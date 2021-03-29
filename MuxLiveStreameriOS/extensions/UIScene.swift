//
//  UIScene.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/28/21.
//

import UIKit

extension UIScene {

    var asWindowScene: UIWindowScene? {
        self as? UIWindowScene
    }

    var isForegroundActive: Bool {
        activationState == .foregroundActive
    }
}
