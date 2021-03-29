//
//  AVAudioSession.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/28/21.
//

import Foundation
import AVFoundation

extension AVAudioSession {

    class func set(category: AVAudioSession.Category = .playback) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(category)
        } catch {
            print("Audio session failed", error)
        }
    }
}
