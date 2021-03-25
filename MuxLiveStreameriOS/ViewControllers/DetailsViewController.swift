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

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTable.backgroundColor = .black
        detailsTable.dataSource = self
        detailsTable.delegate = self
        detailsTable.register(nib: "ContentTableViewCell")
        detailsTable.adjust(headerHeight: 40)
    }
}

extension DetailsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lorems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentCell: ContentTableViewCell = tableView.cell()
        contentCell.contentLabel.text = lorems[indexPath.row]
        return contentCell
    }
}

extension DetailsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView()
        view.label?.text = "Screen 2"
        return view
    }
}

extension DetailsViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("did Select")
    }
}
