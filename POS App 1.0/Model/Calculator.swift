//
//  Calculator.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/23.
//

import Foundation

struct Calculator {
    
    static var calculator = Calculator()
    var promotionList = PromotionList()
    var total = 0.0
    mutating func calculatingTotal() -> Double {
        let allItems = PurchasedDB.sharedDB
        var total = 0.0
        for (itemName, _) in allItems.itemsDB {
            var cartItem = CartItem(name: "", number: 0, total: 0, reduction: 0, price: 0, barcode: "")
            cartItem = allItems.itemsDB[itemName]!
            if cartItem.number != 0 {
                if promotionList.items.contains(allItems.itemsDB[itemName]!.barcode) {
                    if ((allItems.itemsDB[itemName]!.number % 2) != 0) {
                        allItems.itemsDB[itemName]?.total = Double((cartItem.number + 1)/2) * cartItem.price
                        total += allItems.itemsDB[itemName]!.total
                    } else {
                        allItems.itemsDB[itemName]?.total = Double(cartItem.number/2) * cartItem.price
                        total += allItems.itemsDB[itemName]!.total
                    }
                } else {
                    allItems.itemsDB[itemName]?.total = Double(cartItem.number) * cartItem.price
                    total += Double(cartItem.number) * cartItem.price
                }
            }
        }
        return(total)
    }
}
