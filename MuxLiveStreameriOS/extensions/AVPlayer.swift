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
        currentItem?
            .tracks
            .filter {$0.assetTrack?.mediaType == AVMediaType.video } 
            .count != 0
    }

    func remindOfMux24HourLimit() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            guard sockaddr_in.isConnectedToNetwork else { return }
           //  assert(self.hasVideo, .muxNoVideoMessage)
        }
    }
}
