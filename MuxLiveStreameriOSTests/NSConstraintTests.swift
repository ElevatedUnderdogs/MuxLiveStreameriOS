//
//  NSConstraintTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
@testable import MuxLiveStreameriOS

extension MuxLiveStreameriOSTests {

    func testConstraintActivation() {
        let superView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        let firstView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        let secondView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        superView.addSubview(firstView)
        superView.addSubview(secondView)
        let constraints = firstView.equalConstraints(with: secondView)
        constraints.activate()
        XCTAssertTrue(constraints.first!.isActive)
    }
}
