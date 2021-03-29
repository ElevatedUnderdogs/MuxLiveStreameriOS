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
        avPlayer = AVPlayer(url: .muxStream())
        playerLayer = AVPlayerLayer(player: avPlayer)
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
            guard player.timeControlStatus == .playing else { return }
            DispatchQueue.main.async {
                self?.addPlayerLayer()
            }
        }
    }

    private func addPlayerLayer() {
        spinner?.stopAnimating()
        spinner = nil
        streamBackdrop.add(playerLayer: playerLayer)
        streamBackdropHeight.constant.setAsProportionateHeight(
            width: streamBackdrop.frame.width,
            rectHeight: playerLayer.videoRect.height,
            rectWidth: playerLayer.videoRect.width
        )
        streamBackdrop.layer.sublayers = []
        streamBackdrop.add(playerLayer: playerLayer)
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
