//
//  URLRequestTests.swift
//  MuxLiveStreameriOSTests
//
//  Created by Scott Lydon on 3/26/21.
//

import XCTest
@testable import MuxLiveStreameriOS


extension MuxLiveStreameriOSTests {

    func testURLRequest() {
        let request = URLRequest.asset()
        XCTAssertEqual(request.url?.absoluteString, "https://api.mux.com/video/v1/assets/" + .currentAssetID)
        XCTAssertEqual(request.allHTTPHeaderFields, [
            "Content-Type": "application/json",
            "2daf8db7-7b61-4d1a-a84f-fe14acada049":"3Kp0PGjAuHrecmQEjp3G2lOe7azdyKaBevZfhgd2hN83hCNvzTUlg+x695Z2DS+W9v8s3ZEMmTB"
        ])
        XCTAssertEqual(request.method, .GET)
    }

    func testMethod() {
        XCTAssertEqual(URLRequest.HTTPMethod("get"), .GET)
    }

    func testNilMethod() {
        XCTAssertNil(URLRequest.HTTPMethod(""))
    }

    func testMethodGet() {
        var request = URLRequest(url: URL(string: "https://api.mux.com/video/v1/assets/")!)
        request.method = .GET
        XCTAssertEqual(request.method, .GET)
    }
}
