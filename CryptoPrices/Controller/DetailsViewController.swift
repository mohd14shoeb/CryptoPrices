//
//  DetailsViewController.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 18/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var name: String!
    var detailsViewModel: DetailsViewModel!
    var api = API()
    
    var nameLabel = DetailsViewCustomLabel()
    var symbolLabel = DetailsViewCustomLabel()
    var priceLabel = DetailsViewCustomLabel()
    var priceChangeLabel = DetailsViewCustomLabel()
    var rankLabel = DetailsViewCustomLabel()
    var idLabel = DetailsViewCustomLabel()
    var dayVolumeLabel = DetailsViewCustomLabel()
    var marketCapLabel = DetailsViewCustomLabel()
    var availableSupplyLabel = DetailsViewCustomLabel()
    var totalSupplyLabel = DetailsViewCustomLabel()
    var maxSupplyLabel = DetailsViewCustomLabel()
    var updatedLabel = DetailsViewCustomLabel()
    var btcPriceLabel = DetailsViewCustomLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        detailsViewModel = DetailsViewModel(API: api, completion: {
            let coins = self.detailsViewModel.coins
            if let i = coins.index(where: { $0.name == self.name }) {
                let coin = coins[i]
                let priceDouble = Double(coin.priceUSD!)
                let formattedPrice = NSNumber(value: priceDouble!).formattedCurrencyStringUSD
                self.nameLabel.text = coin.name
                self.symbolLabel.text = "Coin symbol: " + (coin.symbol ?? "N/A")
                self.priceLabel.text = "Coin price: " + (formattedPrice ?? "N/A")
                self.priceChangeLabel.text = "1h Change: " + (coin.priceChange1h ?? "N/A") + "%"
                self.btcPriceLabel.text = "Price in BTC: " + (coin.priceBTC ?? "N/A")
                self.rankLabel.text = "Coin rank: " + (coin.rank ?? "N/A")
                self.dayVolumeLabel.text = "24h volume: " + (coin.dayVolumeUSD ?? "N/A")
                self.marketCapLabel.text = "Market cap: " + (coin.marketCapUSD ?? "N/A")
                self.availableSupplyLabel.text = "Available supply: " + (coin.availableSupply ?? "N/A")
                self.totalSupplyLabel.text = "Total supply: " + (coin.totalSupply ?? "N/A")
                self.maxSupplyLabel.text = "Max. supply: " + (coin.maxSupply ?? "N/A")
                self.idLabel.text = "Coin ID: " + (coin.id ?? "N/A")
                self.updatedLabel.text = "Last updated: " + (coin.lastUpdated ?? "N/A")
            }
        })
    }
    
    func setupViews() {
        view.backgroundColor = .lightGray
        view.addSubview(nameLabel)
        view.addSubview(symbolLabel)
        view.addSubview(priceLabel)
        view.addSubview(priceChangeLabel)
        view.addSubview(rankLabel)
        view.addSubview(idLabel)
        view.addSubview(dayVolumeLabel)
        view.addSubview(marketCapLabel)
        view.addSubview(availableSupplyLabel)
        view.addSubview(totalSupplyLabel)
        view.addSubview(maxSupplyLabel)
        view.addSubview(updatedLabel)
        view.addSubview(btcPriceLabel)
        nameLabel.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            nameLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),

            symbolLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            symbolLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            symbolLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            priceLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 8),
            priceLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            btcPriceLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            btcPriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            btcPriceLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            btcPriceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceChangeLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            priceChangeLabel.topAnchor.constraint(equalTo: btcPriceLabel.bottomAnchor, constant: 8),
            priceChangeLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            priceChangeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            rankLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            rankLabel.topAnchor.constraint(equalTo: priceChangeLabel.bottomAnchor, constant: 8),
            rankLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            rankLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dayVolumeLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            dayVolumeLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor, constant: 8),
            dayVolumeLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            dayVolumeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            marketCapLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            marketCapLabel.topAnchor.constraint(equalTo: dayVolumeLabel.bottomAnchor, constant: 8),
            marketCapLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            marketCapLabel.heightAnchor.constraint(equalToConstant: 30),
            
            availableSupplyLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            availableSupplyLabel.topAnchor.constraint(equalTo: marketCapLabel.bottomAnchor, constant: 8),
            availableSupplyLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            availableSupplyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            totalSupplyLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            totalSupplyLabel.topAnchor.constraint(equalTo: availableSupplyLabel.bottomAnchor, constant: 8),
            totalSupplyLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            totalSupplyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            maxSupplyLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            maxSupplyLabel.topAnchor.constraint(equalTo: totalSupplyLabel.bottomAnchor, constant: 8),
            maxSupplyLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            maxSupplyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            idLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            idLabel.topAnchor.constraint(equalTo: maxSupplyLabel.bottomAnchor, constant: 8),
            idLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            idLabel.heightAnchor.constraint(equalToConstant: 30),
            
            updatedLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            updatedLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 8),
            updatedLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            updatedLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
