//
//  URL.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/24/21.
//

import Foundation

extension URL {

    static func muxStream(
        id: String = "W4QbiGLpZFvnts73xRn102E5IC01lVCP3je00c6Ndj2mYQ"
    ) -> URL {
        URL(string: "https://stream.mux.com/"+id+".m3u8")!
    }
}
