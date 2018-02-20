//
//  ItemViewController.swift
//  Gilded Rose Kata
//
//  Created by Blake Macnair on 2/20/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    var item: Item!
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemTitleLabel: UILabel!
    @IBOutlet private weak var sellInDateLabel: UILabel!
    @IBOutlet private weak var qualityLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure(for: item)
    }
    
    private func configure(for item: Item) {
        itemTitleLabel.text = item.name
        sellInDateLabel.text = "\(item.sellIn)"
        qualityLabel.text = "\(item.quality)"
    }

}
