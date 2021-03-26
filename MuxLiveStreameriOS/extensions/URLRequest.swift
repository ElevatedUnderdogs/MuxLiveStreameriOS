//
//  URLRequest.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/25/21.
//

import Foundation

extension URLRequest {

    static func asset(
        id: String = .currentAssetID,
        muxToken: String = "2daf8db7-7b61-4d1a-a84f-fe14acada049",
        secret: String = "3Kp0PGjAuHrecmQEjp3G2lOe7azdyKaBevZfhgd2hN83hCNvzTUlg+x695Z2DS+W9v8s3ZEMmTB"
    ) -> URLRequest {
        .init(
            url: URL(string: "https://api.mux.com/video/v1/assets/" + id)!,
            headers: [
                "Content-Type": "application/json",
                muxToken:secret
            ],
            method: .GET
        )
    }

    /// For standard URLRequests.
    /// - Parameters:
    ///   - url: The url for the request.
    ///   - headers: headers to be passed to the request.
    ///   - method: get or post.
    init(
        url: URL,
        headers: [String: String],
        method: HTTPMethod = .POST
    ) {
        self = URLRequest(url: url)
        self.method = method
        self.allHTTPHeaderFields = headers
    }

    enum HTTPMethod: String {
        case GET, POST, DELETE

        init?(_ str: String?) {
            guard let str = str,
                  let method = HTTPMethod(rawValue: str.uppercased()) else { return nil }
            self = method
        }
    }

    var method: HTTPMethod? {
        get {
            return HTTPMethod(httpMethod)
        }
        set {
            httpMethod = newValue?.rawValue
        }
    }
}
