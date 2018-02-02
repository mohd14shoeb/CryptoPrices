//
//  CurrencyType.swift
//  BTCWidget
//
//  Created by Dejan Ribnikar on 28/01/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import Foundation
import UIKit

class CurrencyType {
    // MARK: func getValue: Get USD or EUR price of cryptocurrencies
    func getValue(cryptoName: String, currencyName: String, completion: @escaping (_ value: NSNumber?) -> Void) {
        let currencies: [String] = ["BTC", "ETH", "LTC", "XRP", "XMR", "NEO"]
        let string = currencies.joined(separator: ",")
        let apiString = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=\(string)&tsyms=EUR,USD"
        guard let apiURL = URL(string: apiString) else {
            completion(nil)
            print("URL Invalid")
            return
        }
        
        let request = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                print(error?.localizedDescription ?? "")
                return
            }
            do {
                let crypto = try JSONDecoder().decode(CellName.self, from: data)
                let value = self.setCurrency(cryptoName: cryptoName, currencyName: currencyName, crypto: crypto)
                completion(value)
            } catch {
                completion(nil)
                print(error.localizedDescription)
            }
        }
        request.resume()
    }
    // MARK: func setCurrency
    func setCurrency(cryptoName: String, currencyName: String, crypto: CellName) -> NSNumber {
        let value: NSNumber
        switch cryptoName {
        case "BTC":
            if currencyName == "EUR" {
                value = crypto.BTC.EUR as NSNumber
                return value
            } else {
                value = crypto.BTC.USD as NSNumber
                return value
            }
        case "ETH":
            if currencyName == "EUR" {
                value = crypto.ETH.EUR as NSNumber
                return value
            } else {
                value = crypto.ETH.USD as NSNumber
                return value
            }
        case "LTC":
            if currencyName == "EUR" {
                value = crypto.LTC.EUR as NSNumber
                return value
            } else {
                value = crypto.LTC.USD as NSNumber
                return value
            }
        case "XRP":
            if currencyName == "EUR" {
                value = crypto.XRP.EUR as NSNumber
                return value
            } else {
                value = crypto.XRP.USD as NSNumber
                return value
            }
        case "XMR":
            if currencyName == "EUR" {
                value = crypto.XMR.EUR as NSNumber
                return value
            } else {
                value = crypto.XMR.USD as NSNumber
                return value
            }
        case "NEO":
            if currencyName == "EUR" {
                value = crypto.NEO.EUR as NSNumber
                return value
            } else {
                value = crypto.NEO.USD as NSNumber
                return value
            }
        default:
            value = -1
            return value
        }
    }
    
    
}
// MARK: struct CellName: Display cryptocurrency name from JSON Decoder
public struct CellName: Decodable {
    var BTC: CellCurrency
    let ETH: CellCurrency
    let LTC: CellCurrency
    let XRP: CellCurrency
    let XMR: CellCurrency
    let NEO: CellCurrency
}
// MARK: struct CellCurrency: Display price in USD and EUR
public struct CellCurrency: Decodable {
    let USD: Double
    let EUR: Double
}
// MARK: extension NSNumber: format JSON value to currency
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
// MARK: enum CurrencyTypeEnum: String names and images of cryptocurrencies
enum CurrencyTypeEnum: String {
    case btc = "BTC",
    eth = "ETH",
    ltc = "LTC",
    xrp = "XRP",
    xmr = "XMR",
    neo = "NEO"
    
    var name: String {
        switch self {
        case .btc:
            return "Bitcoin"
        case .eth:
            return "Ethereum"
        case .ltc:
            return "Litecoin"
        case .xrp:
            return "Ripple"
        case .xmr:
            return "Monero"
        case .neo:
            return "Neo"
        }
    }
}
