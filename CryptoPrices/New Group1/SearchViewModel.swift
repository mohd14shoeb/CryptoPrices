//
//  SearchViewModel.swift
//  MVVM
//
//  Created by Dejan Ribnikar on 08/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class SearchViewModel {
    let reuseIdentifier = String(describing: SearchTableViewCell.self)
    var name: String?
    var symbol: String?
    var coins =  [SearchViewModel]()
    
    init(coin: Coin) {
        self.name = coin.name
        self.symbol = coin.symbol
    }
    
    init(API: API, completion: @escaping () -> ()) {
        API.getData { coins in
            self.coins = coins.map(SearchViewModel.init)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return coins.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> SearchTableViewCell {
        let cell = SearchTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        let coin = coins[indexPath.row]
        cell.nameLabel.text = coin.name
        
        guard let symbol = coin.symbol else { return cell }
        guard let image = UIImage(named: symbol.lowercased()) else { return cell }
        cell.cryptoCurrencyImageView.image = image
        return cell
    }
    
    
}
