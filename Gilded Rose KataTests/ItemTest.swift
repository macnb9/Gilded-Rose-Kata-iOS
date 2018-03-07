//
//  ItemTest.swift
//  GildedRoseKataTests
//
//  Created by Blake Macnair on 3/2/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import XCTest
@testable import GildedRoseKata

class ItemTest: XCTestCase {
    func testConfigure() {
        let expectedName = "Excalibur"
        let expectedQuality = 42
        let expectedSellin = 24

        let context = AppDelegate.shared.persistentContainer.newBackgroundContext()

        let newItem = Item(name: expectedName,
                     sellIn: expectedSellin,
                    quality: expectedQuality,
                    insertInto: context)

        XCTAssertEqual(newItem.name, expectedName)
        XCTAssertEqual(newItem.sellIn, expectedSellin)
        XCTAssertEqual(newItem.quality, expectedQuality)
        XCTAssertEqual(newItem.sellInString, "24 days ago")
    }
}
