//
//  ItemManager.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/21.
//

import Foundation

struct ItemManager {
    let itemURL = "https://tw-mobile-xian.github.io/pos-api/items.json"
    
    var defaultItems: [Item] = [
        Item(name: "芒果", unit: "斤", price: 5),
        Item(name: "可乐", unit: "瓶", price: 3),
        Item(name: "薯片", unit: "袋", price: 4)
    ]
    
    func fetchItems(itemURL: String, completion: @escaping ([Item]) -> Void) {
        var itemArray: [Item] = []
        if let url = URL(string: itemURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                itemArray =  handle(data: data, response: response, error: error)
                completion(itemArray)
            }
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> [Item] {
        var itemArray: [Item] = []
        if error != nil {
            print(error!)
        }
        if let safeData = data {
            itemArray = parseJSON(itemData: safeData)
        }
        return itemArray
    }
    
    func parseJSON(itemData: Data) -> [Item] {
        let decoder = JSONDecoder()
        var decodedData: [ItemData] = []
        do {
            decodedData = try decoder.decode([ItemData].self, from: itemData)
        } catch {
            print(error)
        }
        let itemArray = ConvertToItemArray(itemDataArray: decodedData)
        return itemArray
    }
    
    func ConvertToItemArray(itemDataArray: [ItemData]) -> [Item] {
        var ItemArray: [Item] = []
        var item: Item = Item(name: "", unit: "", price: 0)
        for itemData in itemDataArray {
            item.name = itemData.name
            item.price = itemData.price
            item.unit = itemData.unit
            ItemArray.append(item)
        }
        return ItemArray
    }
}
