//
//  ItemTableViewCell.swift
//  Gilded Rose Kata
//
//  Created by Blake Macnair on 3/1/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var qualityLabel: UILabel!
    @IBOutlet private weak var sellinLabel: UILabel!
    
    func configure(for item: Item) {
        titleLabel.text = item.name
        qualityLabel.text = "\(item.quality)"
        sellinLabel.text = "\(item.sellIn)"
    }
}
