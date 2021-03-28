//
//  UIViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/25/21.
//

import UIKit
import AVKit

extension UIViewController {

    func present(avController: AVPlayerViewController) {
        DispatchQueue.main.async {
            self.present(avController, animated: true) {
                avController.player?.play()
            }
        }
    }
}


// MARK: no Internet methods
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
        banner.tag = Self.bannerID

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        banner.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        [
            label.centerXAnchor.constraint(equalTo: banner.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: banner.bottomAnchor, constant: -2),
        ].activate()
        label.text = "No internet"

        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    private func hideNoInternetBanner() {
        view.viewWithTag(Self.bannerID)?.alpha = 0
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.layoutIfNeeded()
        } completion: { [weak self] _ in
            self?.view.viewWithTag(Self.bannerID)?.removeFromSuperview()
        }
    }
}
