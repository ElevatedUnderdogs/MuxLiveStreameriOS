//
//  TabViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/20/21.
//

import AVKit

class TabViewController: UITabBarController {

    var pictureInPictureController: AVPictureInPictureController!

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.items?.setTextOnlyAttributes(fontSize: 20, color: .white)
        tabBar.barTintColor = .black
        tabBar.items?[1].title = "SCREEN2"
        updateDelegate()
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        updateDelegate()
    }

    func updateDelegate() {
        delegate = currentViewController as? UITabBarControllerDelegate
    }
}
