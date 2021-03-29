//
//  DetailsViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/21/21.
//

import UIKit
import AVKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var detailsTable: UITableView!
    var loremsDataSource: LoremsDataSource = LoremsDataSource(count: 10)
    var headerDelegate: HeaderDelegate = HeaderDelegate(title: "Screen 2")

    @IBOutlet var playerViewHeight: NSLayoutConstraint!
    @IBOutlet var playerView: PlayerView!
    var size: CGSize!
    var avPlayer: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTable.backgroundColor = .black
        detailsTable.dataSource = loremsDataSource
        detailsTable.delegate = headerDelegate
        detailsTable.register(nib: "ContentTableViewCell")
        detailsTable.adjust(headerHeight: 40)
        detailsTable.separatorStyle = .none
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard size.width > 0 else { return }
        playerViewHeight.constant = playerView.frame.width * size.height / size.width
    }
}

extension DetailsViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let next = viewController as? HomeViewController
        next?.avPlayer = avPlayer
    }
}
