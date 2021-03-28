//
//  AppDelegate.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/20/21.
//

import UIKit
import AVFoundation
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let monitor = NWPathMonitor()

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        .portrait
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        monitor.connectivity { connected in
            UIApplication.topMostViewController?.handleInternetBanner(connected: connected)
        }
        AVAudioSession.set()
        return true
    }
}
