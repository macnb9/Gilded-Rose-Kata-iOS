//
//  AddItemViewController.swift
//  Gilded Rose Kata
//
//  Created by Blake Macnair on 3/1/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCreate(newItem: Item)
}

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sellinTextField: UITextField!
    @IBOutlet weak var qualityTextField: UITextField!
    
    weak var delegate: AddItemViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Add New Item"

        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                 target: self,
                                                 action: #selector(createAndDismiss))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        rightBarButtonItem.isEnabled = false
    }

    @objc private func createAndDismiss() {
        let newItem = Item(name: nameTextField.text ?? "",
                           sellIn: Int(sellinTextField.text ?? "0") ?? 0,
                           quality: Int(qualityTextField.text ?? "0") ?? 0)
        
        delegate?.addItemViewControllerDidCreate(newItem: newItem)
        
        guard let navigationController = navigationController else {
            return
        }

        navigationController.popViewController(animated: true)
    }
}

extension AddItemViewController: UITextFieldDelegate {
    /// Captures text changes for text fields and sends the new text to the object manager
    @objc private func textFieldChanged(sender: UITextField?) {
        
    }
}
