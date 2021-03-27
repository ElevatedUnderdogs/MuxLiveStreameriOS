//
//  AppDelegateTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
@testable import MuxLiveStreameriOS

extension MuxLiveStreameriOSTests {

    func testOrientation() {
        XCTAssertEqual(AppDelegate().application(UIApplication.shared, supportedInterfaceOrientationsFor: nil), .portrait)
    }

    func testDidFinishLaunching() {
        XCTAssertTrue(AppDelegate().application(UIApplication.shared, didFinishLaunchingWithOptions: nil))
    }
}
