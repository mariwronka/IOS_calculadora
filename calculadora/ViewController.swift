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
    
//    @IBOutlet var arrayButtons: [UIButton]!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        for btn in arrayButtons { btn.layer.cornerRadius = 30 }
//    }
    
    @IBAction func touchNumbers(_ sender: UIButton) {
        var number = ""
        if sender.tag == 10 { number = "." }
        else { number = String(sender.tag) }
        numbersLabel.text = calculator.setNumbers(numberTouch: number).toDisplay
    }
    
    @IBAction func touchOperators(_ sender: UIButton) {
        let operation = Operation(rawValue: sender.tag)!
        switch operation {
            case .clean: numbersLabel.text = calculator.cleanNumbers()
            case .root: numbersLabel.text = calculator.setSquare()
            case .square: numbersLabel.text = calculator.setPow()
            case .total: numbersLabel.text = calculator.setOperationTotal()
            default: numbersLabel.text = calculator.setOperationSimple(idOperation: operation)
        }
    }
}

