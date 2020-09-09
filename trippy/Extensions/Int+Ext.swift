//
//  Int+Ext.swift
//  trippy
//
//  Created by Paul Franco on 9/9/20.
//

import Foundation

extension Int {
    func formatToCurrencyString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        
        let nsnum = NSNumber(integerLiteral: self/100)
        return formatter.string(from: nsnum) ?? "$$$"
    }
}
