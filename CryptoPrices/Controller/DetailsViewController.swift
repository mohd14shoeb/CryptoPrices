//
//  DetailsViewController.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 18/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var nameLabel = DetailsViewCustomLabel()
//    var symbolLabel: DetailsViewCustomLabel!
//    var priceLabel: DetailsViewCustomLabel!
//    var priceChangeLabel: DetailsViewCustomLabel!
//    var rankLabel: DetailsViewCustomLabel!
//    var idLabel: DetailsViewCustomLabel!
//    var dayVolumeLabel: DetailsViewCustomLabel!
//    var marketCapLabel: DetailsViewCustomLabel!
//    var availableSupplyLabel: DetailsViewCustomLabel!
//    var totalSupplyLabel: DetailsViewCustomLabel!
//    var maxSupplyLabel: DetailsViewCustomLabel!
//    var updatedLabel: DetailsViewCustomLabel!
//    var btcPriceLabel: DetailsViewCustomLabel!
    
    var coinViewModel: CoinViewModel!
    var detailsViewModel: DetailsViewModel!
    var api = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        
        detailsViewModel = DetailsViewModel(API: api, completion: {
            let coins = self.detailsViewModel.coins
            if let i = coins.index(where: { $0.name == self.coinViewModel.name }) {
                let coin = coins[i]
                self.nameLabel.text = coin.name
            }
        })
        
    }
    
    func setupViews() {
        view.addSubview(nameLabel)
//        view.addSubview(symbolLabel)
//        view.addSubview(priceLabel)
//        view.addSubview(priceChangeLabel)
//        view.addSubview(rankLabel)
//        view.addSubview(availableSupplyLabel)
//        view.addSubview(idLabel)
//        view.addSubview(dayVolumeLabel)
//        view.addSubview(marketCapLabel)
//        view.addSubview(totalSupplyLabel)
//        view.addSubview(maxSupplyLabel)
//        view.addSubview(updatedLabel)
//        view.addSubview(btcPriceLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.widthAnchor.constraint(equalToConstant: 200)//,
            
//            symbolLabel.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}
