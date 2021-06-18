//
//  FormatterController.swift
//  OpenRestaurant
//
//  Created by Brenton Niebauer on 6/18/21.
//

import Foundation

class FormatterController {
    static let shared = FormatterController()
    
    let priceFormatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter
    }()
    
    func getStringFormatFor(price: Double) -> String {
        return priceFormatter.string(from: NSNumber(value: price))!
    }
}
