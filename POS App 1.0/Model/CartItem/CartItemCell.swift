//
//  CartItemCell.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/21.
//

import UIKit

class CartItemCell: UITableViewCell {

    @IBOutlet weak var reductionLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
