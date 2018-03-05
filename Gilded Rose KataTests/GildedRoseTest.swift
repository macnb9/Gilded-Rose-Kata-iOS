//
//  GildedRoseTest.swift
//  GildedRoseKataTests
//
//  Created by Blake Macnair on 3/2/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import XCTest

@testable import GildedRoseKata

class GildedRoseTest: XCTestCase {
    
    var items: [Item]?
    var gildedRose: GildedRose!
    
    override func setUp() {
        super.setUp()

        let createContext = AppDelegate.shared.persistentContainer.viewContext

        items = [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20, insertInto: createContext),
            Item(name: "Aged Brie", sellIn: 2, quality: 0, insertInto: createContext),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7, insertInto: createContext),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80, insertInto: createContext),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80, insertInto: createContext),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20, insertInto: createContext),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49, insertInto: createContext),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49, insertInto: createContext),
            Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6, insertInto: createContext)
        ]

        AppDelegate.shared.saveContext(createContext)
        gildedRose = GildedRose(items: items!)
    }
    
    func findItem(named name: String) -> Item? {
        for item in items! {
            if item.name == name {
                return item
            }
        }

        return nil
    }
    
    func testUpdateQuality() {
        for _ in 1...13 {
            gildedRose.updateQuality()
        }
        
        guard let brie = findItem(named: "Aged Brie"),
        let backStagePasses = findItem(named: "Backstage passes to a TAFKAL80ETC concert"),
        let sulfuras = findItem(named: "Sulfuras, Hand of Ragnaros"),
        let manaCake = findItem(named: "Conjured Mana Cake"),
        let elixirMongoose = findItem(named: "Elixir of the Mongoose"),
            let dexterityVest = findItem(named: "+5 Dexterity Vest") else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(brie.quality, 24)
        XCTAssertEqual(backStagePasses.quality, 44)
        XCTAssertEqual(sulfuras.quality, 80)
        XCTAssertEqual(manaCake.quality, 0)
        XCTAssertEqual(elixirMongoose.quality, 0)
        XCTAssertEqual(dexterityVest.quality, 4)
    }
}
