//
//  ItemManager.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/21.
//

import Foundation

struct ItemManager {
    let itemURL = "https://tw-mobile-xian.github.io/pos-api/items.json"
    
    func fetchItems(itemURL: String) {
        if let url = URL(string: itemURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                handle(data: data, response: response, error: error)
            }
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
}
