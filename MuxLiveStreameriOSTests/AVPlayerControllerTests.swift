//
//  AVPlayerControllerTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
import AVKit
@testable import MuxLiveStreameriOS

extension MuxLiveStreameriOSTests {

    func testControllerInitSuccess() {
        XCTAssertNotNil(AVPlayerViewController(urlString: "https://stream.mux.com/3f09j3f09j3f309fj.m3u8"))
    }

    func testControllerFail() {
        XCTAssertNil(AVPlayerViewController(urlString: ""))
    }
}
