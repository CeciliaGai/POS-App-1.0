//
//  PromotionManager.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/23.
//

import Foundation

struct PromotionManager {
    
   let promotionURL = "https://tw-mobile-xian.github.io/pos-api/promotions.json"
    
    func fetchPromotions(promotionURL: String, completion: ([String]) -> Void) {
        var promotionArray = [String]()
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
        var promotionArray = [String]()
        if error != nil {
            print(error!)
        }
        if let safeData = data {
            promotionArray = parseJSON(PromotionData: safeData)
        }
        return promotionArray
    }
    
    func parseJSON(PromotionData: Data) -> [String] {
        let decoder = JSONDecoder()
        var decodedData = [String]()
        do {
            decodedData = try decoder.decode([String].self, from: PromotionData)
        } catch {
            print(error)
        }
        print(decodedData)
        return decodedData
    }
}
