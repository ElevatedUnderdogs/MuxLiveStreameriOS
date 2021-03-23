//
//  UITabBarItem.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/21/21.
//

import UIKit

extension UITabBarItem {
    
//    convenience init(
//        title: String,
//        tagIndex: Int,
//        fontSize: CGFloat,
//        color: UIColor = .black
//    )  {
//        self.init(
//            title: title,
//            image: nil,
//            selectedImage: nil
//        )
//        self.titlePositionAdjustment = UIOffset(horizontal:0, vertical:-10)
//        self.tag = tagIndex
//        setTitleTextAttributes(
//            [
//                NSAttributedString.Key.font: UIFont(name: "American Typewriter", size: fontSize)!,
//                NSAttributedString.Key.foregroundColor: color
//            ],
//            for: .normal
//        )
//    }
    
    func setTextOnlyAttributes(fontSize: CGFloat, color: UIColor = .black) {
        image = nil
        selectedImage = nil
        titlePositionAdjustment = UIOffset(horizontal:0, vertical:-10)
        setTitleTextAttributes(
            [
                NSAttributedString.Key.font: UIFont(name: "American Typewriter",
                                                    size: fontSize)!,
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
