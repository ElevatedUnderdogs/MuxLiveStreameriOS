//
//  TabViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/20/21.
//

import UIKit
import AVKit

class TabViewController: UITabBarController {

    var streamLayer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.items?.setTextOnlyAttributes(fontSize: 20, color: .white)
        tabBar.barTintColor = .black
        tabBar.items?[1].title = "SCREEN2"

    }

}
