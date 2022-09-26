//
//  PromotionList.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/26.
//

import Foundation
class PromotionList {
    
    static let promotionlist = PromotionList()
    
    let promotionManager = PromotionManager()
    
    var items = [String]()
    
    func getPromotionList() {
        promotionManager.fetchPromotionList(promotionURL: promotionManager.promotionURL) { items in
            self.items = items
        }
    }
    
}
