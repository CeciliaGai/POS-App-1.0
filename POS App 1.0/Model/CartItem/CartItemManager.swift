//
//  CartItemManager.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/21.
//

import Foundation
struct CartItemManager {
    
    var purchasedItems: [CartItem] = []
    var db = PurchasedDB()
    
    mutating func getCartItems() -> [CartItem] {
        
        for (itemName, cartItem) in db.itemsDB {
            var cartItem = CartItem(name: "", number: 0, total: 0, reduction: 0, price: 0)
            cartItem = db.itemsDB[itemName]!
            if cartItem.number != 0 {
                purchasedItems.append(cartItem)
            }
        }
        return purchasedItems
    }
    
    mutating func addItem(itemName: String) {
        db.itemsDB[itemName]?.number += 1
    }
}
