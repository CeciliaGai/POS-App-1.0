//
//  PromotionManager.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/26.
//

import Foundation
struct PromotionManager {
    let promotionURL = "https://tw-mobile-xian.github.io/pos-api/promotions.json"
    
    
    func fetchPromotionList(promotionURL: String, completion: @escaping ([String]) -> Void) {
        var promotionArray: [String] = []
        if let url = URL(string: promotionURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                promotionArray =  handle(data: data, response: response, error: error)
                completion(promotionArray)
            }
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> [String] {
        var promotionArray: [String] = []
        if error != nil {
            print(error!)
        }
        if let safeData = data {
            promotionArray = dataToStringArray(promotionData: safeData)!
        }
        return promotionArray
    }
    
    func dataToStringArray(promotionData: Data) -> [String]? {
      return (try? JSONSerialization.jsonObject(with: promotionData, options: [])) as? [String]
    }

}


