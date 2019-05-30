//
//  calculator.swift
//  calculadora
//
//  Created by Marielle Wronka on 26/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

class Calculator {
    
    var numbersString = ""
    
    var primeryNumber: Double = 0
    
    var secondaryNumber: Double = 0
    
    var total: Double = 0
    
    var operation: Operation?
    
    func setNumbers(numberTouch: String) -> String {
        if numbersString.contains("."),
            numberTouch == "." { return numbersString }
       
        numbersString += numberTouch
        return numbersString.setUpStringNumber()
    }
    
    func cleanNumbers() -> String {
        numbersString = ""
        primeryNumber = 0
        secondaryNumber = 0
        total = 0
        return "0"
    }
    
    func setOperationSimple(idOperation: Operation) -> String {
        setPrimaryNumber()

        if idOperation == .divide {
            operation = Operation.divide
            return "/"
        } else if idOperation == Operation.multiply {
            operation = .multiply
            return "*"
        } else if idOperation == Operation.minus {
            operation = .minus
            return "-"
        } else {
            operation = .plus
            return "+"
        }
    }

    func showOperationTotal() -> String  {
        let value = total.cleanValue
        total = 0
        return value.toDisplay
    }
    
    func setOperationTotal() -> String {
        setSecondaryNumber()
        
        if operation == .divide {
            total = primeryNumber / secondaryNumber
        } else if operation == .multiply {
            total = primeryNumber * secondaryNumber
        } else if operation == .minus {
            total = primeryNumber - secondaryNumber
        } else if operation == .plus {
            total = primeryNumber + secondaryNumber
        }
        
        numbersString = ""
        secondaryNumber = 0
        primeryNumber = total
        
        return showOperationTotal()
    }
    
    func setSquare() -> String {
        setPrimaryNumber()
        primeryNumber = primeryNumber.squareRoot()
        total = primeryNumber
        return showOperationTotal()
    }
    
    func setPow() -> String  {
        setPrimaryNumber()
        primeryNumber = pow(primeryNumber,2)
        total = primeryNumber
        return showOperationTotal()
    }
    
    func setPrimaryNumber() {
        if primeryNumber != 0, numbersString == "" { return }
        primeryNumber = Double(numbersString) ?? 0
        numbersString = ""
    }
    
    func setSecondaryNumber() {
        if secondaryNumber != 0, numbersString == "" { return }
        secondaryNumber = Double(numbersString) ?? 0
        numbersString = ""
    }
    
}

enum Operation: Int {
    case clean = 11
    case root = 12
    case square = 13
    case divide = 14
    case multiply = 15
    case minus = 16
    case plus = 17
    case total = 18
}
