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
        monitor.monitorConnected { connected in
            UIApplication.topMostViewController?.handleInternetBanner(connected: connected)
        }
        AVAudioSession.set()
        return true
    }
}

extension UIScene {
    var asWindowScene: UIWindowScene? {
        self as? UIWindowScene
    }

    var isForegroundActive: Bool {
        activationState == .foregroundActive
    }
}

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

extension UIView {
    var nextAsViewController: UIViewController? {
        next as? UIViewController
    }
}

extension UIViewController {

    public var topMostViewController: UIViewController {
        presentedViewController
            .map(\.topMostViewController) ?? view
            .subviews
            .compactMap(\.nextAsViewController)
            .first?
            .topMostViewController ?? self
    }

    private static var bannerID: Int = {
        .random(in: 100...Int.max)
    }()

    private static var identifier: String = {
        .random(length: 20)
    }()

    /// Provided to be overrided for customization per viewController.
    public var noInternetBannerColor: UIColor { .red }

    /// pass connected  = true to indicate internet is connected.
    public func handleInternetBanner(connected: Bool) {
        connected ? hideNoInternetBanner() : showNoInternetBanner()
    }

    private func showNoInternetBanner() {
        let banner = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 0))
        banner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(banner)

        let bottomConstraint = banner.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        [
            banner.rightAnchor.constraint(equalTo: view.rightAnchor),
            banner.topAnchor.constraint(equalTo: view.topAnchor),
            banner.leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomConstraint,
        ].activate()
        banner.backgroundColor = noInternetBannerColor

//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        banner.addSubview(label)
//        [
//            label.centerXAnchor.constraint(equalTo: banner.centerXAnchor),
//            label.bottomAnchor.constraint(equalTo: banner.bottomAnchor, constant: 5),
//            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
//        ].activate()
//        label.text = "No internet"

        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    private func hideNoInternetBanner() {
        let banner = view.viewWithTag(Self.bannerID)
        let heightConstraint = banner?.constraints.first { $0.identifier == Self.identifier }
        heightConstraint?.constant = 0

    }
}
