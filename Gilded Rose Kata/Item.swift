//
//  Item.swift
//  Gilded Rose Kata
//
//  Created by Blake Macnair on 2/20/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import UIKit

class Item: NSObject {
    public var name: String
    public var sellIn: Int // TODO: Change to Date or TimeInterval?
    public var quality: Int
    
    override public var description: String {
        return String(format: "%@, %@, %@", name, sellIn, quality)
    }
    
    init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}
