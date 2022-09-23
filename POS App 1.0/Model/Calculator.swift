//
//  Calculator.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/23.
//

import Foundation

struct Calculator {
    
    static var calculator = Calculator()
    var allItems = PurchasedDB.sharedDB.itemsDB
    var total = 0.0
    mutating func calculatingTotal() -> Double {
        var total = 0.0
        for (itemName, cartItem) in allItems {
            var cartItem = CartItem(name: "", number: 0, total: 0, reduction: 0, price: 0)
            cartItem = PurchasedDB.sharedDB.itemsDB[itemName]!
            if cartItem.number != 0 {
                PurchasedDB.sharedDB.itemsDB[itemName]?.total = Double(cartItem.number) * cartItem.price
                // cartItem.total = Double(cartItem.number) * cartItem.price
                total += Double(cartItem.number) * cartItem.price
            }
        }
        return(total)
    }
}
