//
//  CartItemManager.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/21.
//

import Foundation
struct CartItemManager {
    var purchasedDB: [String: CartItem] =
    [
        "可口可乐": CartItem(name: "可口可乐", number: 1, total: 0, reduction: 0, price: 3),
        "雪碧": CartItem(name: "雪碧", number: 1, total: 0, reduction: 0, price: 3),
        "苹果": CartItem(name: "苹果", number: 0, total: 0, reduction: 0, price: 5.5),
        "荔枝": CartItem(name: "荔枝", number: 0, total: 0, reduction: 0, price: 15),
        "电池": CartItem(name: "电池", number: 0, total: 0, reduction: 0, price: 2),
        "方便面": CartItem(name: "方便面", number: 0, total: 0, reduction: 0, price: 4.5)
    ]
    
    var purchasedItems: [CartItem] = []
    
    mutating func getCartItems() -> [CartItem] {
        
        for (itemName, cartItem) in purchasedDB {
            var cartItem = CartItem(name: "", number: 0, total: 0, reduction: 0, price: 0)
            cartItem = purchasedDB[itemName]!
            if cartItem.number != 0 {
                purchasedItems.append(cartItem)
            }
        }
        return purchasedItems
    }
    
    mutating func addItem(itemName: String) {
        purchasedDB[itemName]?.number += 1
        
    }
}
