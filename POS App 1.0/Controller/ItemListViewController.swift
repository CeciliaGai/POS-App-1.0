//
//  ViewController.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/20.
//

import UIKit

class ItemListViewController: UIViewController {

    let itemManager = ItemManager()
    var cartItemManager = CartItemManager()
    @IBOutlet weak var itemListLabel: UILabel!
    
    var items: [Item] = []
    
    @IBAction func goToShoppingCartButtonPressed(_ sender: UIButton) {
        Calculator.calculator.total = Calculator.calculator.calculatingTotal()
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

extension ItemListViewController: UITableViewDataSource, ItemCellDelegate {
    func addToCartButtonPressed(cell: ItemCell) {
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        as! ItemCell
        cell.delegate = self
        cell.nameLabel.text = items[indexPath.row].name
        cell.priceLabel.text = String(items[indexPath.row].price)
        cell.unitLabel.text = items[indexPath.row].unit
        return cell
    }
}

