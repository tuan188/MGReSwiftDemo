//
//  Actions.swift
//  MGReSwiftDemo
//
//  Created by Tuan Truong on 2/24/17.
//  Copyright © 2017 Tuan Truong. All rights reserved.
//

import UIKit
import ReSwift

// all of the actions that can be applied to the state
struct ProductActionSetList: Action {
    var products: [Product]
}
struct ProductActionAdd: Action {
    var product: Product
}
struct ProductActionUpdate: Action {
    var product: Product
}
struct ProductActionDelete: Action {
    var product: Product
}


