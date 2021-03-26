//
//  URL.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/24/21.
//

import Foundation

extension URL {

    /// - Parameter id: play back id can be found here: `https://dashboard.mux.com/organizations/1veshj/environments/iomibn/video/assets/1nH8B0000fRnTHPQFeKsdFH8WF5LloxBtZd98ER00ghqzs`
    /// - Returns: return force unwrapped url
    static func muxStream(
        id: String = .playBackID
    ) -> URL {
        URL(string: "https://stream.mux.com/"+id+".m3u8")!
    }
}
