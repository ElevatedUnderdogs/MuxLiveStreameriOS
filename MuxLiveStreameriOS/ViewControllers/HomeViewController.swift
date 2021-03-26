//
//  HomeViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/21/21.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {
    
    @IBOutlet var homeLabel: UILabel!
    @IBOutlet var streamBackdrop: UIView!
    @IBOutlet var contentTable: UITableView!
    @IBOutlet var streamBackdropHeight: NSLayoutConstraint!
    var avPlayer: AVPlayer!

    var statusObserver: NSKeyValueObservation?
    var playingObserver: NSKeyValueObservation?

    var loremsDataSource: LoremsDataSource = LoremsDataSource(count: 4)
    var headerDelegate: HeaderDelegate = HeaderDelegate(title: "Sample Title")

    var asset: AVAsset!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        streamBackdrop.backgroundColor = UIColor(rgb: 0x2D2D2D)
        contentTable.backgroundColor = .black
        contentTable.dataSource = loremsDataSource
        contentTable.delegate = headerDelegate
        contentTable.register(nib: "ContentTableViewCell")
        contentTable.adjust(headerHeight: 40)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.asset = AVAsset(url: .muxStream())
        let avItem = AVPlayerItem(asset: self.asset)
        self.avPlayer = AVPlayer(playerItem: avItem)
        let playerLayer = AVPlayerLayer(player: avPlayer)
        avPlayer.play()
        updateStreamViewHeight(playerLayer)
        avPlayer.remindOfMux24HourLimit()
    }
}

extension HomeViewController {

    fileprivate func updateStreamViewHeight(_ playerLayer: AVPlayerLayer) {
        self.playingObserver = avPlayer.observe(
            \.timeControlStatus,
            options: [.new, .old]
        ) { player, change in
            if player.timeControlStatus == .playing {
                self.streamBackdrop.add(playerLayer: playerLayer)
                print(self.asset.tracks(withMediaType: .video).first)
                self.streamBackdropHeight.constant.setAsProportionateHeight(
                    width: self.streamBackdrop.frame.width,
                    rectHeight: playerLayer.videoRect.height,
                    rectWidth: playerLayer.videoRect.width
                )
                DispatchQueue.main.async {
                    self.streamBackdrop.layer.sublayers = []
                    self.streamBackdrop.add(playerLayer: playerLayer)
                }
            }
        }
    }
}

extension HomeViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("did Select")
    }
}
