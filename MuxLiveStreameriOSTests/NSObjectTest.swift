//
//  NSObjectTest.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
@testable import MuxLiveStreameriOS

class Temp {}

extension MuxLiveStreameriOSTests {

    func testBundle() {
        XCTAssertNotEqual(NSObject().bundle, Bundle(for: type(of: Temp())))
    }
}
