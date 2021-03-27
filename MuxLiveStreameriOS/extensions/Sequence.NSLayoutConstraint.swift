//
//  Sequence.NSLayoutConstraint.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/26/21.
//

import UIKit

extension Sequence where Element == NSLayoutConstraint {
    func activate() {
        forEach { $0.isActive = true }
    }
}
