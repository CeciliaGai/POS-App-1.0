//
//  ItemData.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/21.
//

import Foundation
struct ItemData: Decodable {
    let barcode: String
    let name: String
    let unit: String
    let price: Double
}
