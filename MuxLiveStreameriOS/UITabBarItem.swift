//
//  UITabBarItem.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/21/21.
//

import UIKit

extension UITabBarItem {

    func setTextOnlyAttributes(fontSize: CGFloat, color: UIColor = .black) {
        image = nil
        selectedImage = nil
        titlePositionAdjustment = UIOffset(horizontal:0, vertical: -10)
        setTitleTextAttributes(
            [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize),
                NSAttributedString.Key.foregroundColor: color
            ],
            for: .normal
        )
    }
}


extension Sequence where Element == UITabBarItem {
    func setTextOnlyAttributes(fontSize: CGFloat, color: UIColor = .black) {
        forEach {
            $0.setTextOnlyAttributes(fontSize: fontSize, color: color)
        }
    }
}
