//
//  ViewController.swift
//  calculadora
//
//  Created by Marielle Wronka on 26/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numbersLabel: UILabel!
    
    lazy var calculator = Calculator()
    
    @IBAction func touchNumbers(_ sender: UIButton) {
        var number = ""
        if numbersLabel.text == "0", sender.tag == 0 { return }

        if numbersLabel.text == "0", sender.tag == 10 { number = "0." }
        else if sender.tag == 10 { number = "." }
        else { number = String(sender.tag) }
        
        numbersLabel.text = calculator.setNumbers(numberTouch: number).toDisplay
    }
    
    @IBAction func touchOperators(_ sender: UIButton) {
        switch sender.tag {
        case 11:
            numbersLabel.text = "0"
            calculator.cleanNumbers()
        case 12:
            calculator.setSquare()
            numbersLabel.text = calculator.showOperationTotal()
        case 13:
            calculator.setPow()
            numbersLabel.text = calculator.showOperationTotal()
        case 18:
            calculator.setOperationTotal()
            numbersLabel.text = calculator.showOperationTotal()
        default:
            calculator.setOperation(idOperation: sender.tag)
            numbersLabel.text = calculator.showOperation()
        }
        
    }
}

