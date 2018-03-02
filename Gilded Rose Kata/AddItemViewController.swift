//
//  AddItemViewController.swift
//  Gilded Rose Kata
//
//  Created by Blake Macnair on 3/1/18.
//  Copyright © 2018 Blake Macnair. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    /// Tells the delegate when the AddItemViewController has finished creating a new Item.
    /// - Parameter newItem: The new item that was created
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

        hookUpTextFields()
    }
    
    /// Hooks up the textFieldDidChange method to the three text fields in this view controller so we can pcik up any text changes
    func hookUpTextFields() {
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControlEvents.editingChanged)
        sellinTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControlEvents.editingChanged)
        qualityTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControlEvents.editingChanged)
    }

    @objc private func createAndDismiss() {
        let createContext = AppDelegate.shared.persistentContainer.viewContext

        let newItem = Item(name: nameTextField.text ?? "",
                           sellIn: Int(sellinTextField.text ?? "0") ?? 0,
                           quality: Int(qualityTextField.text ?? "0") ?? 0,
                           insertInto: createContext)

        do {
            try createContext.save()
        } catch {
            print(error)
        }

        delegate?.addItemViewControllerDidCreate(newItem: newItem)

        guard let navigationController = navigationController else {
            return
        }

        navigationController.popViewController(animated: true)
    }

    private func isValid() -> Bool {
        guard let name = nameTextField.text, let sellin = sellinTextField.text, let quality = qualityTextField.text else { return false }

        return !name.trimmingCharacters(in: .whitespaces).isEmpty
            && !sellin.trimmingCharacters(in: .whitespaces).isEmpty
            && !quality.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

extension AddItemViewController: UITextFieldDelegate {
    /// Captures text changes for text fields and sends the new text to the object manager
    @objc private func textFieldChanged(sender: UITextField?) {
        navigationItem.rightBarButtonItem?.isEnabled = isValid()
    }
}
