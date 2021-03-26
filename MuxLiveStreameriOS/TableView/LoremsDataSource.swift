//
//  LoremsDataSource.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/25/21.
//

import UIKit

class LoremsDataSource: NSObject, UITableViewDataSource {

    let lorems: [String]

    init(count: Int) {
        lorems = .init(repeating: .lorem, count: count)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lorems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentCell: ContentTableViewCell = tableView.cell()
        contentCell.contentLabel.text = lorems[indexPath.row]
        return contentCell
    }
}
