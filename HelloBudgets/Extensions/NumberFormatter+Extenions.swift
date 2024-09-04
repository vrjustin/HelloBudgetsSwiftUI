//
//  NumberFormatter+Extenions.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/4/24.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
