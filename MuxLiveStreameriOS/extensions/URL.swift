//
//  URL.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/24/21.
//

import Foundation

extension URL {

    static func muxStream(id: String = "8keDP8QPPVdA9qcQn6qzv9S6UT6YUOXsBZm1aWcxh9M") -> URL {
        URL(string: "https://stream.mux.com/"+id+".m3u8")!
    }
}
