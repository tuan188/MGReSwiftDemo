//
//  ProductDataStore.swift
//  MGReSwiftDemo
//
//  Created by Tuan Truong on 2/20/17.
//  Copyright © 2017 Tuan Truong. All rights reserved.
//

import UIKit

class ProductDataStore {
    private static var productDictionary: [ String: Product] = [
        "iphone": Product(id: "iphone", name: "iPhone", price: 600),
        "ipad": Product(id: "ipad", name: "iPad", price: 900),
        "macbook": Product(id: "macbook", name: "MacBook", price: 1500)
    ]
    
    static var sharedInstance = ProductDataStore()
    
    private init() {}
    
    func getProductList() -> [Product] {
        return Array(ProductDataStore.productDictionary.values).sorted { $0.name < $1.name }
    }
    
    func get(productID: String) -> Product? {
        return ProductDataStore.productDictionary[productID]
    }
    
    func add(product: Product) {
        ProductDataStore.productDictionary[product.id] = product
    }
    
    func update(product: Product) {
        ProductDataStore.productDictionary[product.id] = product
    }
    
    func delete(productID: String) {
        ProductDataStore.productDictionary.removeValue(forKey: productID)
    }
}
