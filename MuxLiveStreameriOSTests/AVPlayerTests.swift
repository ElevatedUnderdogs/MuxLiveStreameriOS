//
//  AVPlayerTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
import AVKit
@testable import MuxLiveStreameriOS

extension MuxLiveStreameriOSTests {

    func testInitWithString() {
        XCTAssertNotNil(AVPlayer(urlString: "https://stream.mux.com/3f09j3f09j3f309fj.m3u8"))
    }

    func testNilURLAVPlayer() {
        XCTAssertNil(AVPlayer(urlString: ""))
    }

    func testHasVideo() {
        XCTAssertTrue(((AVPlayer(urlString: "https://stream.mux.com/39fj.m3u8")?.hasVideo) == false))
    }
}
