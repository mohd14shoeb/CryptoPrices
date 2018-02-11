//
//  Coin.swift
//  MVVM
//
//  Created by Dejan Ribnikar on 08/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import Foundation

struct Coin: Decodable {
    var id: String?
    var name: String?
    var symbol: String?
    var rank: String?
    var priceUSD: String?
    var priceBTC: String?
    var hVolumeUSD: String?
    var marketCapUSD: String?
    var availableSupply: String?
    var totalSupply: String?
    var maxSupply: String?
    var precentChange1h: String?
    var percentChange24h: String?
    var percentChange7d: String?
    var lastUpdated: String?
    var priceEUR: String?
    var hVolumeEUR: String?
    var marketCapEUR: String?

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

