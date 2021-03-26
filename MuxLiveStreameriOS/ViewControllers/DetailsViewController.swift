//
//  DetailsViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/21/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var detailsTable: UITableView!
    var lorems: [String] = .init(repeating: .lorem, count: 10)
    var loremsDataSource: LoremsDataSource = LoremsDataSource(count: 10)
    var headerDelegate: HeaderDelegate = HeaderDelegate(title: "Screen 2")

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTable.backgroundColor = .black
        detailsTable.dataSource = loremsDataSource
        detailsTable.delegate = headerDelegate
        detailsTable.register(nib: "ContentTableViewCell")
        detailsTable.adjust(headerHeight: 40)
        detailsTable.separatorStyle = .none
    }
}


extension DetailsViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("did Select")
    }
}
