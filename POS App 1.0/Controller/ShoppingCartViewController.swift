//
//  ShoppingCartViewController.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/20.
//

import Foundation
import UIKit

class ShoppingCartViewController: UIViewController {
    
    var cartItems: [CartItem] = [
        CartItem(name: "芒果", number: 1, total: 3.5, reduction: 0),
        CartItem(name: "可乐", number: 2, total: 6, reduction: 0)
    ]
    
    @IBOutlet weak var cartItemsTable: UITableView!
    @IBOutlet weak var shoppingCartLabel: UILabel!

    @IBOutlet weak var totalPieceText: UITextField!
    
    @IBOutlet weak var totalAmoutText: UITextField!
    
    @IBOutlet weak var totalReductionText: UITextField!
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cartItemsTable.dataSource = self
        cartItemsTable.register(UINib(nibName: "CartItemCell", bundle: nil), forCellReuseIdentifier: "ReusableCellCartItemPage")
        
    }
    
}

extension ShoppingCartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCellCartItemPage", for: indexPath)
        as! CartItemCell
        return cell
    }
}
       