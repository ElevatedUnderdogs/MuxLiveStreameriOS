//
//  UITabBarController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/24/21.
//

import UIKit


extension UITabBarController {
    var currentViewController: UIViewController? {
        viewControllers.flatMap { $0[currentIndex] }
    }

    /// The default selected index is a very large number,
    /// Before a selection however, the index should be 0
    var currentIndex: Int {
        selectedIndex > 100 ? 0 : selectedIndex
    }

    func safePresent(
        viewControllerToPresent: UIViewController,
        animated: Bool = true,
        completion: (()->Void)? = nil
    ) {
        DispatchQueue.main.async {
            if self.currentViewController != viewControllerToPresent {
                self.currentViewController?.present(
                    viewControllerToPresent,
                    animated: animated,
                    completion: completion
                )
            }
        }
    }
}
