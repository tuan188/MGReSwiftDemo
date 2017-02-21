//
//  ProductListViewController.swift
//  MGReSwiftDemo
//
//  Created by Tuan Truong on 2/20/17.
//  Copyright © 2017 Tuan Truong. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reloadData()
    }
    
    fileprivate func reloadData() {
        products = ProductDataStore.sharedInstance.getProductList()
        tableView.reloadData()
    }
    
    @IBAction func addProduct(_ sender: Any) {
        self.performSegue(withIdentifier: "presentProduct", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = (segue.destination as? UINavigationController)?.topViewController as? ProductDetailsViewController {
            if let product = sender as? Product {
                controller.product = product
            }
            controller.delegate = self
        }
    }

}

extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = "$\(product.price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = products[indexPath.row]
        self.performSegue(withIdentifier: "presentProduct", sender: product)
    }
}

extension ProductListViewController: ProductDetailsViewControllerDelegate {
    func productDetailsDidSave(product: Product, isEdited: Bool) {
        if isEdited {
            ProductDataStore.sharedInstance.update(product: product)
        }
        else {
            ProductDataStore.sharedInstance.add(product: product)
        }
        reloadData()
    }
}


