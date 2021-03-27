//
//  StringTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
@testable import MuxLiveStreameriOS

extension MuxLiveStreameriOSTests {

    func testLorem() {
        XCTAssertEqual(String.lorem, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation...")
    }

    func testMuxNoMessageWarning() {
        XCTAssertEqual(String.muxNoVideoMessage, "Mux videos last only 24 hours, perhaps an update of the video content is in order.  Go to: https://dashboard.mux.com/organizations/1veshj/environments/iomibn/video/assets")
    }

    func testCurrentAssetID() {
        XCTAssertNotEqual(String.currentAssetID, "")
    }

    func testPlayBackID() {
        XCTAssertNotEqual(String.currentAssetID, "")
    }
}
