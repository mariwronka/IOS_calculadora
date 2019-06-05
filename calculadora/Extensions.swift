//
//  Extensions.swift
//  calculadora
//
//  Created by Marielle Wronka on 28/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

extension String {
    var toDisplay: String {
        if ( self == "inf") { return "∞" } 
        return self.replacingOccurrences(of: ".", with: ",")
    }
    
    mutating func setUpStringNumber() -> String {
        if self == "." { self = "0." }
        if self == ".." { self = "0." }
        if self == "00" { self = "0" }
        return self.toDisplay
    }
}

extension UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
