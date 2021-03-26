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
}
