//
//  UIView.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/23/21.
//

import UIKit
import AVKit

extension UIView {

    func add(playerLayer: AVPlayerLayer) {
        playerLayer.frame = bounds
        layer.addSublayer(playerLayer)
    }

    func equalConstraints(with view: UIView) -> [NSLayoutConstraint] {
        [
            leftAnchor.constraint(equalTo: view.leftAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
    }

    var nibName: String { String(describing: type(of: self)) }
}
