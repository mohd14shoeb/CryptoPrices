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
    var currency: String!
    private var vc = ViewController()
    
    var name: String?
    var symbol: String?
    var price: String?
    var priceChange: String?
    var coins =  [CoinViewModel]()
    
    init(coin: Coin) {
        let currency = ViewController().currency
        self.name = coin.name
        self.symbol = coin.symbol
        if currency == "USD" {
            self.price = coin.priceUSD
        } else {
            self.price = coin.priceEUR
        }
        
        self.priceChange = coin.precentChange1h
        print(coin.symbol!.lowercased())
    }
    
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
    
    func cellForRowAt(currency: String, indexPath: IndexPath) -> CoinTableViewCell {
        let cell = CoinTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        let coin = coins[indexPath.row]
        cell.nameLabel.text = coin.name
        cell.symbolLabel.text = coin.symbol
        cell.priceChangeLabel.text = coin.priceChange
        guard let priceChange = coin.priceChange else { return cell }
        if priceChange.contains("-") {
            cell.priceChangeLabel.layer.backgroundColor = UIColor.red.cgColor
        } else {
            cell.priceChangeLabel.layer.backgroundColor = UIColor.green.cgColor
        }
        guard let price = coin.price else { return cell }
        let formattedPrice = NumberFormatter().number(from: price)
        if currency == "USD" {
            cell.priceLabel.text = formattedPrice?.formattedCurrencyStringUSD
        } else {
            cell.priceLabel.text = formattedPrice?.formattedCurrencyStringEUR
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
