//
//  DetailsCollectionViewCell.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 26/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    var symbolLabel = RightCustomLabel()
    var priceLabel = RightCustomLabel()
    var priceChange1hLabel = RightCustomLabel()
    var priceChange24hLabel = RightCustomLabel()
    var priceChange7dLabel = RightCustomLabel()
    var dayVolumeLabel = RightCustomLabel()
    var marketCapLabel = RightCustomLabel()
    var availableSupplyLabel = RightCustomLabel()
    var totalSupplyLabel = RightCustomLabel()
    var maxSupplyLabel = RightCustomLabel()
    var btcPriceLabel = RightCustomLabel()
    
    var descriptionSymbolLabel = LeftCustomLabel()
    var descriptionPriceLabel = LeftCustomLabel()
    var descriptionPriceChange1hLabel = LeftCustomLabel()
    var descriptionpriceChange24hLabel = LeftCustomLabel()
    var descriptionpriceChange7dLabel = LeftCustomLabel()
    var descriptionDayVolumeLabel = LeftCustomLabel()
    var descriptionMarketCapLabel = LeftCustomLabel()
    var descriptionAvailableSupplyLabel = LeftCustomLabel()
    var descriptionTotalSupplyLabel = LeftCustomLabel()
    var descriptionMaxSupplyLabel = LeftCustomLabel()
    var descriptionbtcPriceLabel = LeftCustomLabel()
    
   
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {        
        contentView.addSubview(descriptionPriceLabel)
        contentView.addSubview(descriptionbtcPriceLabel)
        contentView.addSubview(descriptionPriceChange1hLabel)
        contentView.addSubview(descriptionpriceChange24hLabel)
        contentView.addSubview(descriptionpriceChange7dLabel)
        contentView.addSubview(descriptionDayVolumeLabel)
        contentView.addSubview(descriptionAvailableSupplyLabel)
        contentView.addSubview(descriptionTotalSupplyLabel)
        contentView.addSubview(descriptionMaxSupplyLabel)
        contentView.addSubview(descriptionMarketCapLabel)
        contentView.addSubview(descriptionSymbolLabel)
        
        contentView.addSubview(priceLabel)
        contentView.addSubview(btcPriceLabel)
        contentView.addSubview(priceChange1hLabel)
        contentView.addSubview(priceChange24hLabel)
        contentView.addSubview(priceChange7dLabel)
        contentView.addSubview(dayVolumeLabel)
        contentView.addSubview(availableSupplyLabel)
        contentView.addSubview(totalSupplyLabel)
        contentView.addSubview(maxSupplyLabel)
        contentView.addSubview(marketCapLabel)
        contentView.addSubview(symbolLabel)
        
        NSLayoutConstraint.activate([
            descriptionPriceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionPriceLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionPriceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            descriptionPriceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionbtcPriceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionbtcPriceLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionbtcPriceLabel.topAnchor.constraint(equalTo: descriptionPriceLabel.bottomAnchor, constant: 12),
            descriptionbtcPriceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionPriceChange1hLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionPriceChange1hLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionPriceChange1hLabel.topAnchor.constraint(equalTo: descriptionbtcPriceLabel.bottomAnchor, constant: 12),
            descriptionPriceChange1hLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionpriceChange24hLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionpriceChange24hLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionpriceChange24hLabel.topAnchor.constraint(equalTo: descriptionPriceChange1hLabel.bottomAnchor, constant: 12),
            descriptionpriceChange24hLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionpriceChange7dLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionpriceChange7dLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionpriceChange7dLabel.topAnchor.constraint(equalTo: descriptionpriceChange24hLabel.bottomAnchor, constant: 12),
            descriptionpriceChange7dLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionDayVolumeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionDayVolumeLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionDayVolumeLabel.topAnchor.constraint(equalTo: descriptionpriceChange7dLabel.bottomAnchor, constant: 12),
            descriptionDayVolumeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionMarketCapLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionMarketCapLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionMarketCapLabel.topAnchor.constraint(equalTo: descriptionDayVolumeLabel.bottomAnchor, constant: 12),
            descriptionMarketCapLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionAvailableSupplyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionAvailableSupplyLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionAvailableSupplyLabel.topAnchor.constraint(equalTo: descriptionMarketCapLabel.bottomAnchor, constant: 12),
            descriptionAvailableSupplyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionTotalSupplyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionTotalSupplyLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionTotalSupplyLabel.topAnchor.constraint(equalTo: descriptionAvailableSupplyLabel.bottomAnchor, constant: 12),
            descriptionTotalSupplyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionMaxSupplyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionMaxSupplyLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionMaxSupplyLabel.topAnchor.constraint(equalTo: descriptionTotalSupplyLabel.bottomAnchor, constant: 12),
            descriptionMaxSupplyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionSymbolLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            descriptionSymbolLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            descriptionSymbolLabel.topAnchor.constraint(equalTo: descriptionMaxSupplyLabel.bottomAnchor, constant: 12),
            descriptionSymbolLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceLabel.leftAnchor.constraint(equalTo: descriptionPriceLabel.rightAnchor),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            btcPriceLabel.leftAnchor.constraint(equalTo: descriptionbtcPriceLabel.rightAnchor),
            btcPriceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            btcPriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 12),
            btcPriceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceChange1hLabel.leftAnchor.constraint(equalTo: descriptionPriceChange1hLabel.rightAnchor),
            priceChange1hLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            priceChange1hLabel.topAnchor.constraint(equalTo: btcPriceLabel.bottomAnchor, constant: 12),
            priceChange1hLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceChange24hLabel.leftAnchor.constraint(equalTo: descriptionpriceChange24hLabel.rightAnchor),
            priceChange24hLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            priceChange24hLabel.topAnchor.constraint(equalTo: priceChange1hLabel.bottomAnchor, constant: 12),
            priceChange24hLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceChange7dLabel.leftAnchor.constraint(equalTo: descriptionpriceChange7dLabel.rightAnchor),
            priceChange7dLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            priceChange7dLabel.topAnchor.constraint(equalTo: priceChange24hLabel.bottomAnchor, constant: 12),
            priceChange7dLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dayVolumeLabel.leftAnchor.constraint(equalTo: descriptionDayVolumeLabel.rightAnchor),
            dayVolumeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            dayVolumeLabel.topAnchor.constraint(equalTo: priceChange7dLabel.bottomAnchor, constant: 12),
            dayVolumeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            marketCapLabel.leftAnchor.constraint(equalTo: descriptionMarketCapLabel.rightAnchor),
            marketCapLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            marketCapLabel.topAnchor.constraint(equalTo: dayVolumeLabel.bottomAnchor, constant: 12),
            marketCapLabel.heightAnchor.constraint(equalToConstant: 30),
            
            availableSupplyLabel.leftAnchor.constraint(equalTo: descriptionAvailableSupplyLabel.rightAnchor),
            availableSupplyLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            availableSupplyLabel.topAnchor.constraint(equalTo: marketCapLabel.bottomAnchor, constant: 12),
            availableSupplyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            totalSupplyLabel.leftAnchor.constraint(equalTo: descriptionTotalSupplyLabel.rightAnchor),
            totalSupplyLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            totalSupplyLabel.topAnchor.constraint(equalTo: availableSupplyLabel.bottomAnchor, constant: 12),
            totalSupplyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            maxSupplyLabel.leftAnchor.constraint(equalTo: descriptionMaxSupplyLabel.rightAnchor),
            maxSupplyLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            maxSupplyLabel.topAnchor.constraint(equalTo: totalSupplyLabel.bottomAnchor, constant: 12),
            maxSupplyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            symbolLabel.leftAnchor.constraint(equalTo: descriptionSymbolLabel.rightAnchor),
            symbolLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            symbolLabel.topAnchor.constraint(equalTo: maxSupplyLabel.bottomAnchor, constant: 12),
            symbolLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
