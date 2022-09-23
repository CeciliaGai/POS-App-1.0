//
//  ReceiptViewController.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/20.
//

import Foundation
import UIKit
class ReceiptViewController: UIViewController {
    
    var cartItems: [CartItem] = []
    var cartItemManager = CartItemManager()
    
    @IBOutlet weak var receiptTable: UITableView!
    
    @IBOutlet weak var receiptLabel: UILabel!
    
    @IBOutlet weak var totalAmountText: UITextField!
    
    @IBOutlet weak var totalReductionText: UITextField!
    
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cartItems = cartItemManager.getCartItems()
        receiptTable.dataSource = self
        receiptTable.register(UINib(nibName: "ReceiptItemCell", bundle: nil), forCellReuseIdentifier: "ReusableCellReceiptItem")
        totalAmountText.text = "总额：\(Calculator.calculator.total)元"
    }
}

extension ReceiptViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCellReceiptItem", for: indexPath)
        as! ReceiptItemCell
        cell.nameLabel.text = cartItems[indexPath.row].name
        cell.numberLabel.text = String(cartItems[indexPath.row].number)
        cell.priceLabel.text = String(cartItems[indexPath.row].price)
        cell.subtotalLabel.text = String(cartItems[indexPath.row].total)
        return cell
    }
}
