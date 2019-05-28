//
//  Extensions.swift
//  calculadora
//
//  Created by Marielle Wronka on 28/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

extension Double {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

extension String {
    var toDisplay: String {
        return self.replacingOccurrences(of: ".", with: ",")
    }
    
    mutating func setUpStringNumber() -> String {
        if self == "." { self = "0." }
        if self == ".." { self = "0." }
        if self == "00." { self = "0." }
        return self.replacingOccurrences(of: ".", with: ",")
    }
}
