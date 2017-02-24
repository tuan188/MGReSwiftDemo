//
//  ProductReducer.swift
//  MGReSwiftDemo
//
//  Created by Tuan Truong on 2/24/17.
//  Copyright © 2017 Tuan Truong. All rights reserved.
//

import UIKit

import ReSwift

// the reducer is responsible for evolving the application state based
// on the actions it receives
struct ProductReducer: Reducer {
    typealias ReducerStateType = AppState
    
    
    func handleAction(action: Action, state: AppState?) -> AppState {
        
        // if no state has been provided, create the default state
        var state = state ?? AppState()
        
        switch action {
        case let action as ProductActionSetList:
            state.products = action.products
        case let action as ProductActionAdd:
            state.products.append(action.product)
        case let action as ProductActionUpdate:
            if let index = state.products.index(where: { $0.id == action.product.id }) {
                state.products[index] = action.product
            }
        case let action as ProductActionDelete:
            if let index = state.products.index(where: { $0.id == action.product.id }) {
                state.products.remove(at: index)
            }
        default:
            break
        }
        
        return state
    }
    
}
