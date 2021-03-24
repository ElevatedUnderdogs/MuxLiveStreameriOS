//
//  UITableView.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/23/21.
//

import UIKit

extension UITableView {
    
    ///This is used only for a cell created with a storyboard.  Do not use this if you created the cell programmatically.
    func cell<T: UITableViewCell>() -> T {
        if let cell = dequeueReusableCell(withIdentifier: T.reuseID) as? T {
            cell.selectionStyle = .none
            return cell
        } else {
            fatalError("Make sure the reuse id matches the cell being used in storyboard, and that its on the table view being used And that its registered")
        }
    }

    func register(nib: String) {
        register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: nib)
    }

    func adjust(headerHeight: CGFloat) {
        sectionHeaderHeight = UITableView.automaticDimension
        estimatedSectionHeaderHeight = headerHeight
    }
}
