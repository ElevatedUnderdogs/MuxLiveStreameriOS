//
//  UIViewTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
import AVKit
@testable import MuxLiveStreameriOS


extension MuxLiveStreameriOSTests {

    func testAddPlayer() {
        let playerLayer = AVPlayerLayer()
        let view = UIView()
        view.add(playerLayer: playerLayer)
        if let contains = view.layer.sublayers?.contains(playerLayer) {
            XCTAssertTrue(contains)
        } else {
            XCTFail()
        }
        XCTAssertEqual(playerLayer.frame, view.frame)
        XCTAssertEqual(playerLayer.bounds, view.bounds)
    }

    func testEqualConstriants() {
        let playerView = PlayerView()
        XCTAssertEqual(playerView.nibName, "PlayerView")
    }

    
}
