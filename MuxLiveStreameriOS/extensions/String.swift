//
//  String.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/22/21.
//

import Foundation

extension String {
    
    static var lorem: String {
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation..."
    }

    static var muxNoVideoMessage: String {
        "Mux videos last only 24 hours, perhaps an update of the video content is in order.  Go to: https://dashboard.mux.com/organizations/1veshj/environments/iomibn/video/assets"
    }

    static var currentAssetID: String {
        "nt8ZixDunp3tWVzKsCFvfhsYYb4W1i7TmXzTbHpk02k00"
    }

    static var playBackID: String {
        "5u7A59S2dXkcgiv2VAmeyUGmANrvmvDIQJTW007b8ROg"
    }

    static var alphaNumeric: String {
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    }

    static func random(length: Int) -> String {
        String((0..<length).compactMap { _ in String.alphaNumeric.randomElement() })
    }
}
