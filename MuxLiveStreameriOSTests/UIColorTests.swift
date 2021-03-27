//
//  UIColorTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
@testable import MuxLiveStreameriOS

extension MuxLiveStreameriOSTests {

    func testTabGray() {
        XCTAssertEqual(UIColor(red: 79, green: 79, blue: 79), .tabGray)
    }

    func testDeselected() {
        XCTAssertEqual(UIColor(red: 200, green: 200, blue: 200), .deselected)
    }

    func testInitRGB() {
        XCTAssertEqual(UIColor(rgb: 0xFFA500), UIColor(red: 255, green: 165, blue: 0))
    }
}
