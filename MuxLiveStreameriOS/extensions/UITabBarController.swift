//
//  UITabBarController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/24/21.
//

import UIKit


extension UITabBarController {
    var currentViewController: UIViewController? {
        viewControllers.map { $0[selectedIndex] }
    }
}
