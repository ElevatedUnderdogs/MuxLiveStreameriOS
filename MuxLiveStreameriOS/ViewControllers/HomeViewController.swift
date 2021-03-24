//
//  HomeViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/21/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var homeLabel: UILabel!
    @IBOutlet var streamBackdrop: UIView!
    @IBOutlet var contentTable: UITableView!
    let lorems: [String] = .init(repeating: .lorem, count: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        streamBackdrop.backgroundColor = UIColor(rgb: 0x2D2D2D)
        contentTable.backgroundColor = .black
        contentTable.dataSource = self
        contentTable.delegate = self
        contentTable.register(nib: "ContentTableViewCell")
        contentTable.adjust(headerHeight: 40)
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lorems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentCell: ContentTableViewCell = tableView.cell()
        contentCell.contentLabel.text = lorems[indexPath.row]
        return contentCell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView()
        view.label?.text = "Sample Title"
        return view
    }
}
