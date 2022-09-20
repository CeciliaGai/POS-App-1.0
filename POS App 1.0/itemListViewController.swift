//
//  ViewController.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/20.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet weak var itemListLabel: UILabel!
    @IBOutlet weak var totalAmountText: UITextField!
    
    var items: [Item] = [
        Item(name: "芒果", unit: "斤", price: 5),
        Item(name: "可乐", unit: "瓶", price: 3),
        Item(name: "薯片", unit: "袋", price: 4)
    ]
    
    @IBAction func goToShoppingCartButtonPressed(_ sender: UIButton) {
    }
    
    @IBOutlet weak var itemListTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

