//
//  DetailsViewController.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/21/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var detailsHeader: UILabel!
    @IBOutlet var detailsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        detailsTable.backgroundColor = .green
    }
}

