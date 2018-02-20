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
    
    var searchTextString: String?
    
    var name: String?
    var symbol: String?
    var priceUSD: String?
    var priceEUR: String?
    var priceChange: String?
    var coins =  [CoinViewModel]()
    var filteredCoins = [CoinViewModel]()
    
    init(coin: Coin) {
        self.name = coin.name
        self.symbol = coin.symbol
        self.priceUSD = coin.priceUSD
        self.priceEUR = coin.priceEUR
        self.priceChange = coin.precentChange1h
    }
    
    init(API: API, completion: @escaping () -> ()) {
        API.getData { coins in
            self.coins = coins.map(CoinViewModel.init)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func searchText(searchText: String) {
        searchTextString = searchText
        filteredCoins = coins.filter({ (coin) -> Bool in
            return coin.name!.lowercased().contains(searchText.lowercased())
        })
    }
    
    func numberOfRowsInSection() -> Int {
        if searchTextString != nil && searchTextString != "" {
            return filteredCoins.count
        } else {
            return coins.count
        }
    }
    
    func cellForRowAt(currency: String, indexPath: IndexPath) -> CoinTableViewCell {
        let cell = CoinTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        var coin = coins[indexPath.row]
        if searchTextString != nil && searchTextString != "" {
            coin = filteredCoins[indexPath.row]
        } else {
            coin = coins[indexPath.row]
        }
        cell.nameLabel.text = coin.name
        cell.symbolLabel.text = coin.symbol        
        guard let priceChange = coin.priceChange else { return cell }
        if priceChange.contains("-") {
            cell.priceChangeLabel.text = priceChange
            cell.priceChangeLabel.layer.backgroundColor = UIColor.red.cgColor
        } else {
            cell.priceChangeLabel.text = "+\(priceChange)"
            cell.priceChangeLabel.layer.backgroundColor = UIColor.green.cgColor
        }

        if currency == "USD" {
            guard let price = coins[indexPath.row].priceUSD else { return cell }
            let priceDouble = Double(price)
            let formattedPrice = NSNumber(value: priceDouble!).formattedCurrencyStringUSD
            cell.priceLabel.text = formattedPrice
        } else {
            guard let price = coin.priceEUR else { return cell }
            let priceDouble = Double(price)
            let formattedPrice = NSNumber(value: priceDouble!).formattedCurrencyStringEUR
            cell.priceLabel.text = formattedPrice
        }
        guard let symbol = coin.symbol else { return cell }
        guard let image = UIImage(named: symbol.lowercased()) else { return cell }
        cell.cryptoCurrencyImageView.image = image
        return cell
    }
    
    func willDisplayFooterView(view: UIView) {
        let title = UILabel()
        title.font = UIFont(name: "HelveticaNeue-Thin", size: UIFont.systemFontSize)
        
        let footer: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footer.contentView.backgroundColor = UIColor.lightGray
        footer.textLabel?.font = title.font
        footer.textLabel?.textAlignment = .left
    }
    
    func titleForFooterInSection() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return "Updated on " + dateString
    }
}
