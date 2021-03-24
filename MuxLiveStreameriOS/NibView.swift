//
//  NibView.swift
//  MuxLiveStreameriOS
//
//  Created by Scott Lydon on 3/23/21.
//

import UIKit

class NibView: UIView {

    var contentView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibInit()
    }

    var loadedViewFromNib: UIView? {
        UINib(nibName: nibName, bundle: bundle)
            .instantiate(withOwner: self, options: nil)
            .first as? UIView
    }

    func nibInit() {
        guard let view = loadedViewFromNib else { return }
        view.frame = bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView = view
    }
}

