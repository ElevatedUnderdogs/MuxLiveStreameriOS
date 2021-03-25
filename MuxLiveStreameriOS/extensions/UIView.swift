//
//  UIView.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/23/21.
//

import UIKit
import AVKit

extension UIView {

    func add(player: AVPlayer) {
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = bounds
        layer.addSublayer(playerLayer)
        if playerLayer.superlayer == nil {
            print("not added properly")
        }
    }

//    var loadedViewFromNib: UIView? {
//        UINib(nibName: nibName, bundle: bundle)
//            .instantiate(withOwner: self, options: nil)
//            .first as? UIView
//    }
}
