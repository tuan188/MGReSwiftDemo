//
//  Product.swift
//  MGReSwiftDemo
//
//  Created by Tuan Truong on 2/20/17.
//  Copyright © 2017 Tuan Truong. All rights reserved.
//

import UIKit

class Product {
    var id: String
    var name: String
    var price: Double
    
    convenience init() {
        self.init(id: "", name: "", price: 0.0)
    }
    
    init(id: String, name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }
}
