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
    
    func setNumbers (numberTouch: String) -> String {
        if numbersString.contains("."),
            numberTouch == "." { return numbersString }
       
        numbersString += numberTouch
        return numbersString.setUpStringNumber()
    }
    
    func cleanNumbers () {
        numbersString = ""
        primeryNumber = 0
        secondaryNumber = 0
        total = 0
    }
    
    func setOperation(idOperation: Int) {
        switch idOperation {
            case 14: operation = Operation.divide
            case 15: operation = Operation.multiply
            case 16: operation = Operation.minus
            case 17: operation = Operation.plus
            default: return
        }
     
        setPrimaryNumber()
    }

    func showOperationTotal() -> String  {
        let value = total.cleanValue
        total = 0
        return value.toDisplay
    }
    
    func setOperationTotal() {
        setSecondaryNumber()
        
        switch operation {
            case .divide?:
                if secondaryNumber == 0 { total = primeryNumber }
                else { total = primeryNumber / secondaryNumber }
            case .multiply?: total = primeryNumber * secondaryNumber
            case .minus?: total = primeryNumber - secondaryNumber
            case .plus?: total = primeryNumber + secondaryNumber
            default: return
        }
        
        numbersString = ""
        secondaryNumber = 0
        primeryNumber = total
    }
    
    
    func showOperation() -> String {
        switch operation {
        case .divide?:
            return "/"
        case .multiply?:
            return "x"
        case .minus?:
            return "-"
        case .plus?:
            return "+"
        default:
            return "🤔"
        }
    }
    
    func setPrimaryNumber() {
        if primeryNumber != 0 { return }
        if numbersString == "" { return }
        primeryNumber = Double(numbersString) ?? 0
        numbersString = ""
    }
    
    func setSecondaryNumber() {
        if secondaryNumber != 0 { return }
        if numbersString == "" { return }
        secondaryNumber = Double(numbersString) ?? 0
        numbersString = ""
    }
    
    func setSquare() {
        setPrimaryNumber()
        primeryNumber = primeryNumber.squareRoot()
        total = primeryNumber
    }
    
    func setPow() {
        setPrimaryNumber()
        primeryNumber = pow(primeryNumber,2)
        total = primeryNumber
    }
}

enum Operation {
    case root
    case square
    case divide
    case multiply
    case minus
    case plus
}
