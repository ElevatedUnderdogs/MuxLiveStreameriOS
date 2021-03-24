//
//  NSObject.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/23/21.
//

import Foundation

extension NSObject {
    var bundle: Bundle { .init(for: type(of: self)) }
    var nibName: String { String(describing: type(of: self)) }
}
