//
//  AVPlayerViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/25/21.
//

import AVKit

extension AVPlayerViewController {

    convenience init?(urlString: String) {
        guard let url = URL(string: urlString) else { return nil }
        let player = AVPlayer(url: url)
        self.init()
        self.player = player
    }
}
