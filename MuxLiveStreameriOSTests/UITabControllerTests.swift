//
//  UITabControllerTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
@testable import MuxLiveStreameriOS

extension MuxLiveStreameriOSTests {

    func testCurrentViewController() {
        let tabBarController = UITabBarController()
        let viewController1 = UIViewController()
        viewController1.view.backgroundColor = .red
        let viewController2 = UIViewController()
        viewController2.view.backgroundColor = .orange
        tabBarController.viewControllers = [
            viewController1,
            viewController2
        ]
        XCTAssertEqual(tabBarController.currentViewController, viewController1)
    }

    func testCurrentIndex() {
        let tabBarController = UITabBarController()
        let viewController1 = UIViewController()
        viewController1.view.backgroundColor = .red
        let viewController2 = UIViewController()
        viewController2.view.backgroundColor = .orange
        tabBarController.viewControllers = [
            viewController1,
            viewController2
        ]
        XCTAssertEqual(tabBarController.currentIndex, 0)
    }
}

