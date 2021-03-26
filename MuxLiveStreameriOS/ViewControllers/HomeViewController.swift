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
        contentTable.separatorStyle = .none
    }

    var playerLayer: AVPlayerLayer!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.asset = AVAsset(url: .muxStream())
        self.avPlayer = AVPlayer(playerItem: AVPlayerItem(asset: self.asset))
        self.playerLayer = AVPlayerLayer(player: avPlayer)
        avPlayer.play()
        URLRequest.asset().getCodable { (asset: MuxAsset?) in
            guard let size = asset?.data.tracks.first?.maxSize else { return }
            self.updateStreamViewHeight(self.playerLayer, size: size)
        }
        avPlayer.remindOfMux24HourLimit()
    }
}

extension HomeViewController {

    fileprivate func updateStreamViewHeight(
        _ playerLayer: AVPlayerLayer,
        size: CGSize
    ) {
        self.playingObserver = avPlayer.observe(
            \.timeControlStatus,
            options: [.new, .old]
        ) { player, change in
            if player.timeControlStatus == .playing {
                print(playerLayer.videoGravity.rawValue)
                self.streamBackdrop.add(playerLayer: playerLayer)
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


    func tabBarController(
        _ tabBarController: UITabBarController,
        didSelect viewController: UIViewController
    ) {

    }
}
