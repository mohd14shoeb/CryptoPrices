//
//  Extensions.swift
//  CryptoPrices
//
//  Created by Zan Drakslar on 13/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

extension NSNumber {
    var formattedCurrencyStringUSD: String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        return formatter.string(from: self)
    }
    
    var formattedCurrencyStringEUR: String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_FI")
        formatter.numberStyle = .currency
        return formatter.string(from: self)
    }
}

extension UILabel {
    var basicSetup: UILabel? {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
