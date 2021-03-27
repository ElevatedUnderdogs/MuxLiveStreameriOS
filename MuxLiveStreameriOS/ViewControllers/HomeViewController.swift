//
//  HomeViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/21/21.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {

    @IBOutlet var streamBackdrop: UIView!
    @IBOutlet var contentTable: UITableView!
    @IBOutlet var streamBackdropHeight: NSLayoutConstraint!
    @IBOutlet var spinner: UIActivityIndicatorView!
    var avPlayer: AVPlayer!
    var playingObserver: NSKeyValueObservation?
    var loremsDataSource: LoremsDataSource = LoremsDataSource(count: 4)
    var headerDelegate: HeaderDelegate = HeaderDelegate(title: "Sample Title")
   // var asset: AVAsset!
    var playerLayer: AVPlayerLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        streamBackdrop.backgroundColor = UIColor(rgb: 0x2D2D2D)
        contentTable.backgroundColor = .black
        contentTable.dataSource = loremsDataSource
        contentTable.delegate = headerDelegate
        contentTable.register(nib: "ContentTableViewCell")
        contentTable.adjust(headerHeight: 40)
        contentTable.separatorStyle = .none
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // self.asset = AVAsset(url: .muxStream())
        let avItem = AVPlayerItem(url: .muxStream())//AVPlayerItem(asset: self.asset)
        self.avPlayer = AVPlayer(playerItem: avItem)
        self.playerLayer = AVPlayerLayer(player: avPlayer)
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
        ) { [weak self] player, change in
            guard player.timeControlStatus == .playing, let `self` = self else { return }
            DispatchQueue.main.async {
                self.spinner?.stopAnimating()
                self.spinner = nil
                self.streamBackdrop.add(playerLayer: playerLayer)
                self.streamBackdropHeight.constant.setAsProportionateHeight(
                    width: self.streamBackdrop.frame.width,
                    rectHeight: playerLayer.videoRect.height,
                    rectWidth: playerLayer.videoRect.width
                )
                self.streamBackdrop.layer.sublayers = []
                self.streamBackdrop.add(playerLayer: playerLayer)
            }
        }
    }
}

extension HomeViewController: UITabBarControllerDelegate {

    func tabBarController(
        _ tabBarController: UITabBarController,
        didSelect viewController: UIViewController
    ) {
        let next = viewController as? DetailsViewController
        next?.avPlayer = avPlayer
        next?.playerView.player = avPlayer
        next?.size = playerLayer.videoRect.size
    }
}
