//
//  URL.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/24/21.
//

import Foundation

extension URL {

    static func muxStream(
        id: String = .currentAssetID
    ) -> URL {
        URL(string: "https://stream.mux.com/"+id+".m3u8")!
    }

    
}
