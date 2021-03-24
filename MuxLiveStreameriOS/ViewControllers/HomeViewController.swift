//
//  HomeViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/21/21.
//

import UIKit
import AVKit

var playerController: AVPlayerViewController!

class HomeViewController: UIViewController {
    
    @IBOutlet var homeLabel: UILabel!
    @IBOutlet var streamBackdrop: UIView!
    @IBOutlet var contentTable: UITableView!
    let lorems: [String] = .init(repeating: .lorem, count: 4)


    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        streamBackdrop.backgroundColor = UIColor(rgb: 0x2D2D2D)
        contentTable.backgroundColor = .black
        contentTable.dataSource = self
        contentTable.delegate = self
        contentTable.register(nib: "ContentTableViewCell")
        contentTable.adjust(headerHeight: 40)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        play()
    }
}

extension HomeViewController: AVPlayerViewControllerDelegate {

    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        if tabBarController?.currentViewController != playerController {
            tabBarController?.currentViewController?.present(playerController, animated: true, completion: nil)
        }
    }

    func play() {
        let player = AVPlayer(url: .muxStream())
        playerController = AVPlayerViewController()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didfinishPlaying(notification:)),
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )
        playerController.player = player
        playerController.allowsPictureInPicturePlayback = true
        playerController.delegate = self
        playerController.player?.play()
        present(playerController, animated: true, completion: nil)
    }

    @objc func didfinishPlaying(notification: NSNotification) {
        playerController.dismiss(animated: true, completion: nil)
        let alertView = UIAlertController(title: "Finished", message: "Video finished", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alertView, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lorems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentCell: ContentTableViewCell = tableView.cell()
        contentCell.contentLabel.text = lorems[indexPath.row]
        return contentCell
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView()
        view.label?.text = "Sample Title"
        return view
    }
}
