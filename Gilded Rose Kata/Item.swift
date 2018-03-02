//
//  Item.swift
//  Gilded Rose Kata
//
//  Created by Blake Macnair on 2/20/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import UIKit
import CoreData

@objc(Item)
class Item: NSManagedObject {
    @NSManaged public var name: String
    @NSManaged private var sellInNum: NSNumber // TODO: Change to Date or TimeInterval?
    @NSManaged private var qualityNum: NSNumber
    
    public var sellIn: Int {
        get {
        return sellInNum.intValue
        }
        set {
            sellInNum = NSNumber(value: newValue)
        }
        }
    public var quality: Int {
        get {
            return qualityNum.intValue
        }
        set {
            qualityNum = NSNumber(value: newValue)
        }
    }
    
    public var sellInString: String {
        if sellIn == 0 {
            return "Today"
        } else  if sellIn < 0 {
            return "\(-sellIn) days ago"
        } else {
            return "\(sellIn) days left"
        }
    }
    
    override public var description: String {
        return String(format: "%@, %@, %@", name, sellIn, quality)
    }
    
    convenience init(name: String, sellIn: Int, quality: Int, insertInto moc: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: moc)!
        self.init(entity: entity, insertInto: moc)
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}
