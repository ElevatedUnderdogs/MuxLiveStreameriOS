//
//  AVPlayer.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/25/21.
//

import AVKit

extension AVPlayer {
    
    convenience init?(urlString: String) {
        guard let url = URL(string: urlString) else { return nil }
        self.init(url: url)
    }

    var hasVideo: Bool {
        self.currentItem?
            .tracks
            .filter({$0.assetTrack?.mediaType == AVMediaType.video})
            .count != 0
    }
}
