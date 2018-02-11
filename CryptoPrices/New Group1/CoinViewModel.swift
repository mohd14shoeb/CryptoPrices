//
//  CoinViewModel.swift
//  MVVM
//
//  Created by Dejan Ribnikar on 08/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class CoinViewModel {    
    let reuseIdentifier = String(describing: CoinTableViewCell.self)
    
    var name: String?
    var symbol: String?
    var price: String?
    var priceChange: String?
    
    init(coin: Coin) {
        self.name = coin.name
        self.symbol = coin.symbol
        self.price = coin.priceUSD
        self.priceChange = coin.precentChange1h
    }
    
    var coins =  [CoinViewModel]()
    
    init(API: API, completion: @escaping () -> ()) {
        API.getData { coins in
            self.coins = coins.map(CoinViewModel.init)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return coins.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> CoinTableViewCell {
        let cell = CoinTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        let coin = coins[indexPath.row]
        cell.nameLabel.text = coin.name
        cell.symbolLabel.text = coin.symbol
        cell.priceLabel.text = coin.price
        cell.priceChangeLabel.text = coin.priceChange
        return cell
    }
}
