//
//  UIAlertController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/25/21.
//

import UIKit

extension UIAlertController {
    convenience init(title: String, message: String, action: UIAlertAction, preferredStyle: UIAlertController.Style = .alert) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        addAction(action)
    }
}
