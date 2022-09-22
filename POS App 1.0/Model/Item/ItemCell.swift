//
//  ItemCell.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/20.
//

import UIKit

protocol ItemCellDelegate: AnyObject {
    func addToCartButtonPressed(cell: ItemCell)
}

class ItemCell: UITableViewCell {
    
    var purchasedDB: [String: CartItem] =
    [
        "可口可乐": CartItem(name: "可口可乐", number: 1, total: 0, reduction: 0, price: 3),
        "雪碧": CartItem(name: "雪碧", number: 1, total: 0, reduction: 0, price: 3),
        "苹果": CartItem(name: "苹果", number: 0, total: 0, reduction: 0, price: 5.5),
        "荔枝": CartItem(name: "荔枝", number: 0, total: 0, reduction: 0, price: 15),
        "电池": CartItem(name: "电池", number: 0, total: 0, reduction: 0, price: 2),
        "方便面": CartItem(name: "方便面", number: 0, total: 0, reduction: 0, price: 4.5)
    ]
    
    var delegate: ItemCellDelegate?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBAction func addToCartButtonPressed(_ sender: UIButton) {
        delegate?.addToCartButtonPressed(cell: self)
        let itemName = self.nameLabel.text
        purchasedDB[itemName!]?.number += 1
        print(purchasedDB[itemName!]!.number)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
