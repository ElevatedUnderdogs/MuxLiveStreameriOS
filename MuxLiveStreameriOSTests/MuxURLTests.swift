//
//  MuxURLTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
@testable import MuxLiveStreameriOS


extension MuxLiveStreameriOSTests {

    func testMuxURL() {
        XCTAssertEqual("https://stream.mux.com/123456.m3u8", URL.muxStream(id: "123456").absoluteString)
    }
}
