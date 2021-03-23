//
//  AVPlayerLayer.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/22/21.
//

import AVFoundation
import UIKit

class VideoPlayerView: UIView {
    
    var player: AVPlayer? {
        get {
            playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    var playerLayer: AVPlayerLayer {
        layer as! AVPlayerLayer
    }
    
    override class var layerClass: AnyClass {
        AVPlayerLayer.self
    }
}

class VideoLooperView: UIView {
    private let player = AVQueuePlayer()

}
