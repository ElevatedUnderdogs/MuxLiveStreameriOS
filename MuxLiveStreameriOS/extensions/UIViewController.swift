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

    private static var hideIdentifier: String = {
        .random(length: 20)
    }()

    private static var showIdentifier: String = {
        .random(length: 20)
    }()

    /// Provided to be overrided for customization per viewController.
    public var noInternetBannerColor: UIColor { .red }

    /// pass connected  = true to indicate internet is connected.
    public func handleInternetBanner(connected: Bool) {
        connected ? hideNoInternetBanner() : showNoInternetBanner()
    }

    fileprivate func constraints(banner: UIView, other view: UIView) -> [NSLayoutConstraint] {
        [
            banner.rightAnchor.constraint(equalTo: view.rightAnchor),
            banner.topAnchor.constraint(equalTo: view.topAnchor),
            banner.leftAnchor.constraint(equalTo: view.leftAnchor),
        ]
    }

    fileprivate func constraints(label: UIView, banner: UIView) -> [NSLayoutConstraint] {
        [
            label.leftAnchor.constraint(equalTo: banner.leftAnchor),
            label.rightAnchor.constraint(equalTo: banner.rightAnchor),
            label.bottomAnchor.constraint(equalTo: banner.bottomAnchor, constant: -10),
        ]
    }

    @discardableResult
    fileprivate func hideConstraint(superView: UIView, banner: UIView, id: String = hideIdentifier) -> NSLayoutConstraint {
        let constraint = superView.topAnchor.constraint(equalTo: banner.bottomAnchor)
        constraint.identifier = id
        constraint.isActive = false
        constraint.priority = .required
        return constraint
    }

    @discardableResult
    fileprivate func showConstraint(label: UIView, banner: UIView, id: String = showIdentifier) -> NSLayoutConstraint {
        let constraint = label.topAnchor.constraint(equalTo: banner.safeAreaLayoutGuide.topAnchor, constant: -5)
        constraint.identifier = id
        constraint.isActive = false
        constraint.priority = .required
        return constraint
    }

    private func showNoInternetBanner() {
        let banner = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 0))
        banner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(banner)

        let bannerConstraints = constraints(banner: banner, other: view)
        bannerConstraints.activate()
        banner.backgroundColor = noInternetBannerColor
        banner.tag = Self.bannerID
        hideConstraint(superView: view, banner: banner)

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 0))
        banner.addSubview(label)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelConstraints = constraints(label: label, banner: banner) + [showConstraint(label: label, banner: banner)]
        labelConstraints.activate()
        label.text = "No internet"

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    private func hideNoInternetBanner() {
        let banner = view.viewWithTag(Self.bannerID)
        banner?.constraints.first { $0.identifier == Self.hideIdentifier }?.isActive = true
        banner?.constraints.first { $0.identifier == Self.showIdentifier }?.isActive = false
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.layoutIfNeeded()
        } completion: { _ in
            banner?.removeFromSuperview()
        }
    }
}
