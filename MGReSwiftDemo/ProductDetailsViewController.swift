//
//  ProductDetailsViewController.swift
//  MGReSwiftDemo
//
//  Created by Tuan Truong on 2/20/17.
//  Copyright © 2017 Tuan Truong. All rights reserved.
//

import UIKit

protocol ProductDetailsViewControllerDelegate: class {
    func productDetailsDidSave(product: Product, isEdited: Bool)
}

class ProductDetailsViewController: UITableViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    var product: Product!
    var isEdited: Bool!
    
    weak var delegate: ProductDetailsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if product != nil {
            idTextField.text = product.id
            nameTextField.text = product.name
            priceTextField.text = String(product.price)
            isEdited = true
        }
        else {
            product = Product()
            isEdited = false
        }
        
        idTextField.becomeFirstResponder()
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        product.id = idTextField.text ?? ""
        product.name = nameTextField.text ?? ""
        if let text = priceTextField.text, let price = Double(text) {
            product.price = price
        }
        delegate?.productDetailsDidSave(product: product, isEdited: self.isEdited)
        self.dismiss(animated: true, completion: nil)
    }
}
