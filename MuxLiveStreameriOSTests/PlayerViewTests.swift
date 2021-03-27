//
//  PlayerViewTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
import AVKit
@testable import MuxLiveStreameriOS

extension MuxLiveStreameriOSTests {

    func testPlayerViewLayer() {
        XCTAssertNotNil(PlayerView().playerLayer)
    }

    func testLayerClass() {
        XCTAssertNotNil(PlayerView.layerClass)
    }

    func testPlayer() {
        let newPlayerView = PlayerView()
        XCTAssertNil(newPlayerView.player)
        newPlayerView.player = AVPlayer()
        XCTAssertNotNil(newPlayerView.player)
    }
}
