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
    
    var delegate: ItemCellDelegate?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBAction func addToCartButtonPressed(_ sender: UIButton) {
        delegate?.addToCartButtonPressed(cell: self)
        let itemName = self.nameLabel.text
        PurchasedDB.sharedDB.itemsDB[itemName!]?.number += 1
        print(PurchasedDB.sharedDB.itemsDB)
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
