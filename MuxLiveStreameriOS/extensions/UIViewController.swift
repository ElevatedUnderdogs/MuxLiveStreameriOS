//
//  UIViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/25/21.
//

import UIKit
import AVKit

extension UIViewController {

    func present(avController: AVPlayerViewController) {
        DispatchQueue.main.async {
            self.present(avController, animated: true) {
                avController.player?.play()
            }
        }
    }
}
