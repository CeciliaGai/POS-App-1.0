//
//  ReceiptViewController.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/20.
//

import Foundation
import UIKit
class ReceiptViewController: UIViewController {
    
    var receiptItems: [ReceiptItem] = [
        ReceiptItem(name: "芒果", number: 1, price: 5, subtotal: 3.5),
        ReceiptItem(name: "可乐", number: 2, price: 3, subtotal: 6)
    ]
    
    @IBOutlet weak var receiptTable: UITableView!
    
    @IBOutlet weak var receiptLabel: UILabel!
    
    @IBOutlet weak var totalAmountText: UITextField!
    
    @IBOutlet weak var totalReductionText: UITextField!
    
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        receiptTable.dataSource = self
        receiptTable.register(UINib(nibName: "ReceiptItemCell", bundle: nil), forCellReuseIdentifier: "ReusableCellReceiptItem")
    }
}

extension ReceiptViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCellReceiptItem", for: indexPath)
        as! ReceiptItemCell
        return cell
    }
}
