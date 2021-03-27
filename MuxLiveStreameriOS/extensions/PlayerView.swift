//
//  PlayerView.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/26/21.
//

import AVKit

class PlayerView: UIView {

    var playerLayer: AVPlayerLayer {
        layer as! AVPlayerLayer
    }

    override class var layerClass: AnyClass {
        AVPlayerLayer.self
    }

    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
}
