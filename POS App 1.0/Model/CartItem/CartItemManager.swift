//
//  CartItemManager.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/21.
//

import Foundation
struct CartItemManager {
    
    var purchasedItems: [CartItem] = []
    
    mutating func getCartItems() -> [CartItem] {
        
        for (itemName, _) in PurchasedDB.sharedDB.itemsDB {
            let cartItem = PurchasedDB.sharedDB.itemsDB[itemName]!
            if cartItem.number != 0 {
                purchasedItems.append(cartItem)
            }
        }
        return purchasedItems
    }
    
    mutating func addItem(itemName: String) {
        PurchasedDB.sharedDB.itemsDB[itemName]?.number += 1
    }
}
