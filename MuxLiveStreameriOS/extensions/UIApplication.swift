//
//  UIApplication.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/28/21.
//

import UIKit

extension UIApplication {

    static var foregroundScene: UIWindowScene? {
        shared.connectedScenes
            .filter(\.isForegroundActive)
            .compactMap(\.asWindowScene)
            .first
    }

    static var keyedWindow: UIWindow? {
        foregroundScene?
            .windows
            .filter(\.isKeyWindow)
            .first
    }

    static var topMostViewController: UIViewController? {
        var topController: UIViewController? = keyedWindow?.rootViewController
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        assert(topController != nil, "You don't have any views set. Call from didAppear instead of didLoad.")
        return topController
    }
}

