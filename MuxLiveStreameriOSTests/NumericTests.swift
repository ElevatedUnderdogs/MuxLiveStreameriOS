//
//  NumericTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
@testable import MuxLiveStreameriOS

extension MuxLiveStreameriOSTests {

    func testSetAsProportionate() {
        var num: Double = 0
        num.setAsProportionateHeight(width: 5, rectHeight: 3, rectWidth: 60)
        XCTAssertEqual(num, 15 / 60)
    }
}

