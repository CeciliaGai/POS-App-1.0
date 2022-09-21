//
//  CartItem.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/20.
//

import Foundation

struct CartItem {
    let name: String
    let number: Int
    let total: Float
    let reduction: Float
    
    var purchasedDB: [String: Item] =
    [
        "可口可乐": Item(name: "可口可乐", unit: "瓶", price: 3),
        "雪碧": Item(name: "雪碧", unit: "瓶", price: 3),
        "苹果": Item(name: "苹果", unit: "斤", price: 5.5),
        "荔枝": Item(name: "荔枝", unit: "斤", price: 15),
        "电池": Item(name: "电池", unit: "个", price: 2),
        "方便面": Item(name: "方便面", unit: "袋", price: 4.5),
    ]
    
}
