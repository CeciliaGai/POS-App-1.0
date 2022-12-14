//
//  PurchasedDB.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/22.
//

import Foundation

class PurchasedDB {
    static let sharedDB = PurchasedDB()
    var itemsDB: [String: CartItem] =
    [
        "可口可乐": CartItem(name: "可口可乐", number: 0, total: 0, reduction: 0, price: 3, barcode: "ITEM000000"),
        "雪碧": CartItem(name: "雪碧", number: 0, total: 0, reduction: 0, price: 3, barcode: "ITEM000001"),
        "苹果": CartItem(name: "苹果", number: 0, total: 0, reduction: 0, price: 5.5, barcode: "ITEM000002"),
        "荔枝": CartItem(name: "荔枝", number: 0, total: 0, reduction: 0, price: 15, barcode: "ITEM000003"),
        "电池": CartItem(name: "电池", number: 0, total: 0, reduction: 0, price: 2, barcode: "ITEM000004"),
        "方便面": CartItem(name: "方便面", number: 0, total: 0, reduction: 0, price: 4.5, barcode: "ITEM000005")
    ]
}
