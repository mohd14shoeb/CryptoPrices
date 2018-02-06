//
//  CurrencyType.swift
//  CryptoTracker
//
//  Created by Dejan Ribnikar on 24/01/2018.
//  Copyright © 2018 Maxwell Stein. All rights reserved.
//

import UIKit
import SwiftyJSON
import Charts

class CurrencyType {
    var currenciesDictionary: [CellName]?
    // MARK: func getValue: Get USD or EUR price of cryptocurrencies
    func getObjects() {
        let apiString = "https://api.coinmarketcap.com/v1/ticker/?convert=EUR"
        guard let apiURL = URL(string: apiString) else {
            print("URL Invalid")
            return
        }        
        let request = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "")
                return
            }
            do {
                let json: [CellName] = try JSONDecoder().decode([CellName].self, from: data)
                Storage.store(json, to: .documents, as: "CellName.json")
            } catch {
                print(error.localizedDescription)
                return
            }
        }
        request.resume()
    }
    
    func getImages() {
        let apiString = "https://min-api.cryptocompare.com/data/all/coinlist"
        guard let apiURL = URL(string: apiString) else {
            print("URL Invalid")
            return
        }
        
        let request = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let data = data else {
                print(error?.localizedDescription as Any)
                return
            }
            
            do {
                let JSONArray = try JSON(data: data)
                let defaults = UserDefaults.standard
                let response = JSON(JSONArray)
                defaults.setValue(response.rawString(), forKey: "JSONArray")
                print("saved")
            } catch {
                print(error.localizedDescription)
            }
        }
        request.resume()
    }
    
    func numberOfRows(currenciesDictionary: [CellName]?) -> Int {
        return currenciesDictionary?.count ?? 0
    }
}
// MARK: struct CellName: Display cryptocurrency name from JSON Decoder
public struct CellName: Codable {
    let id: String?
    let name: String?
    let symbol: String?
    let rank: String?
    let priceUSD: String?
    let priceBTC: String?
    let hVolumeUSD: String?
    let marketCapUSD: String?
    let availableSupply: String?
    let totalSupply: String?
    let maxSupply: String?
    let precentChange1h: String?
    let percentChange24h: String?
    let percentChange7d: String?
    let lastUpdated: String?
    let priceEUR: String?
    let hVolumeEUR: String?
    let marketCapEUR: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case rank
        case priceUSD = "price_usd"
        case priceBTC = "price_btc"
        case hVolumeUSD = "24h_volume_usd"
        case marketCapUSD = "market_cap_usd"
        case availableSupply = "available_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case precentChange1h = "percent_change_1h"
        case percentChange24h = "percent_change_24h"
        case percentChange7d = "percent_change_7d"
        case lastUpdated = "last_updated"
        case priceEUR = "price_eur"
        case hVolumeEUR = "24h_volume_eur"
        case marketCapEUR = "market_cap_eur"
    }
}

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


