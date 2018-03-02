//
//  GildedRoseViewController.swift
//  Gilded Rose Kata
//
//  Created by Blake Macnair on 2/20/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import UIKit

class GildedRoseViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    private var gildedRose: GildedRose?

    override func viewDidLoad() {
        super.viewDidLoad()

        let rightButton = UIBarButtonItem(barButtonSystemItem: .add,
                                          target: self,
                                          action: #selector(addItem))
        navigationItem.rightBarButtonItem = rightButton
        
        let leftButton = UIBarButtonItem(title: "Next Day",
                                         style: .plain,
                                         target: self,
                                         action: #selector(updateQuality))
        navigationItem.leftBarButtonItem = leftButton

        tableView.delegate = self
        tableView.dataSource = self

        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ItemTableViewCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44

        setupGildedRose()
    }

    /// Initializes the gildedRose property and adds some default items to it
    private func setupGildedRose() {
        let items = [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            Item(name: "Aged Brie", sellIn: 2, quality: 0),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
            Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)]

        gildedRose = GildedRose(items: items)
    }
    
    /// Initializes and presents a view for creating a new item to add to the Gilded Rose
    @objc private func addItem() {
        let addItemViewController = AddItemViewController(nibName: "AddItemViewController", bundle: Bundle.main)
        addItemViewController.delegate = self
        navigationController?.pushViewController(addItemViewController, animated: true)
    }
    
    /// Runs GildedRose().updateQuality and refreshes the table to show the new values
    @objc private func updateQuality() {
        gildedRose?.updateQuality()
        tableView.reloadData()
    }
}

extension GildedRoseViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gildedRose?.items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell, let item = gildedRose?.items[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configure(for: item)
        
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = gildedRose?.items[indexPath.row] else { return }
        let itemViewController = ItemViewController(nibName: "ItemViewController", bundle: Bundle.main)
        itemViewController.item = item
        navigationController?.pushViewController(itemViewController, animated: true)
    }
}

extension GildedRoseViewController: AddItemViewControllerDelegate {
    func addItemViewControllerDidCreate(newItem: Item) {
        gildedRose?.items.append(newItem)
        tableView.reloadData()
    }
}
