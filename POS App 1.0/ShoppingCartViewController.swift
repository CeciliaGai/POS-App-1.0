//
//  ShoppingCartViewController.swift
//  POS App 1.0
//
//  Created by Hanyue Gai on 2022/9/20.
//

import Foundation
import UIKit

class ShoppingCartViewController: UIViewController {
    
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
        
    }
    
}
       
