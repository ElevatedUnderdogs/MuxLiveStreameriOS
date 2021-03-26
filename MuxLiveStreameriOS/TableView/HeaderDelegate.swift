//
//  HeaderDelegate.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/25/21.
//

import UIKit

class HeaderDelegate: NSObject, UITableViewDelegate {

    let title: String

    init(title: String) {
        self.title = title
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView()
        view.label?.text = title
        return view
    }
}
