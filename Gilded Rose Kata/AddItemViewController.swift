//
//  AddItemViewController.swift
//  Gilded Rose Kata
//
//  Created by Blake Macnair on 3/1/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sellinTextField: UITextField!
    @IBOutlet weak var qualityTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Add New Item"

        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                 target: self,
                                                 action: #selector(createAndDismiss))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    @objc private func createAndDismiss() {
        guard let navigationController = navigationController else {
            return
        }

        navigationController.popViewController(animated: true)
    }
}
