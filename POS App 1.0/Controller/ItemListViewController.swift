//
//  ViewController.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/20.
//

import UIKit

class ItemListViewController: UIViewController {

    let itemManager = ItemManager()
    let cartItemManager = CartItemManager()
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
        itemManager.fetchItems(itemURL: itemManager.itemURL) { items in
            self.items = items
        }
        super.viewDidLoad()
        itemListTable.dataSource = self
        itemListTable.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        as! ItemCell
        cell.nameLabel.text = items[indexPath.row].name
        cell.priceLabel.text = String(items[indexPath.row].price)
        cell.unitLabel.text = items[indexPath.row].unit
        return cell
    }
}

