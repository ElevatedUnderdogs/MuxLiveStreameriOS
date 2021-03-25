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
    var avPlayer: AVPlayer!

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
        self.avPlayer = AVPlayer(url: .muxStream())
        streamBackdrop.add(player: avPlayer)
        avPlayer.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            assert(self.avPlayer.hasVideo, .muxNoVideoMessage)
        }
    }
}

extension HomeViewController: AVPlayerViewControllerDelegate {

    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        tabBarController?.safePresent(
            viewControllerToPresent: playerController,
            animated: true
        )
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

extension HomeViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("did Select")
    }
}
