//
//  DetailsViewModel.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 18/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class DetailsViewModel {
    var name: String?
    var symbol: String?
    var priceUSD: String?
    var priceEUR:String?
    var priceBTC: String?
    var priceChange1h: String?
    var priceChange24h: String?
    var priceChange7d: String?
    var rank: String?
    var id: String?
    var dayVolumeUSD: String?
    var dayVolumeEUR: String?
    var marketCapUSD: String?
    var marketCapEUR: String?
    var availableSupply: String?
    var totalSupply: String?
    var maxSupply:String?
    var lastUpdated: String?
    
    var coins = [DetailsViewModel]()
    var detailsViewController = DetailsViewController()
    
    init(coin: Coin) {
        name = coin.name
        symbol = coin.symbol
        priceUSD = coin.priceUSD
        priceEUR = coin.priceEUR
        priceBTC = coin.priceBTC
        priceChange1h = coin.precentChange1h
        priceChange24h = coin.percentChange24h
        priceChange7d = coin.percentChange7d
        rank = coin.rank
        id = coin.id
        dayVolumeUSD = coin.hVolumeUSD
        dayVolumeEUR = coin.hVolumeEUR
        marketCapUSD = coin.marketCapUSD
        marketCapEUR = coin.marketCapEUR
        availableSupply = coin.availableSupply
        totalSupply = coin.totalSupply
        maxSupply = coin.maxSupply
        lastUpdated = coin.lastUpdated
    }
    
    init(API: API, completion: @escaping () -> ()) {
        API.getData { (coins) in
            self.coins = coins.map(DetailsViewModel.init)
            completion()
        }
    }
}
