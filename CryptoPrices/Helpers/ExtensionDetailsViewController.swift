//
//  ExtensionDetailsViewController.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 26/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

extension DetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailsCollectionViewCell
        
        let priceDouble = Double(coin.priceUSD!)
        let formattedPrice = NSNumber(value: priceDouble!).formattedCurrencyStringUSD
        cell.btcPriceLabel.text = (coin.priceBTC ?? "N/A") + " BTC"
        cell.symbolLabel.text = coin.symbol ?? "N/A"
        cell.priceLabel.text = formattedPrice ?? "N/A"
        cell.priceChange1hLabel.text = (coin.priceChange1h ?? "N/A") + " %"
        cell.priceChange24hLabel.text = (coin.priceChange24h ?? "N/A") + " %"
        cell.priceChange7dLabel.text = (coin.priceChange7d ?? "N/A") + " %"
        let dayVolumeDouble = Double(coin.dayVolumeUSD!)
        let formattedDayVolume = NSNumber(value: dayVolumeDouble!).formattedCurrencyStringUSD
        cell.dayVolumeLabel.text = formattedDayVolume ?? "N/A"
        let marketCapDouble = Double(coin.marketCapUSD!)
        let formattedMarketCap = NSNumber(value: marketCapDouble!).formattedCurrencyStringUSD
        cell.marketCapLabel.text = formattedMarketCap ?? "N/A"
        cell.availableSupplyLabel.text = (coin.availableSupply ?? "N/A") + " \(coin.symbol!)"
        cell.totalSupplyLabel.text = (coin.totalSupply ?? "N/A") + " \(coin.symbol!)"
        cell.maxSupplyLabel.text = (coin.maxSupply ?? "N/A") + " \(coin.symbol!)"
        
        cell.descriptionPriceLabel.text = "CoinPrice"
        cell.descriptionbtcPriceLabel.text = "Price in BTC"
        cell.descriptionSymbolLabel.text = "Coin Symbol"
        cell.descriptionPriceChange1hLabel.text = "Price Change (1h)"
        cell.descriptionpriceChange24hLabel.text = "Price Change (24h)"
        cell.descriptionpriceChange7dLabel.text = "Price Change (7d)"
        cell.descriptionDayVolumeLabel.text = "Daily Volume"
        cell.descriptionMarketCapLabel.text = "Market Cap"
        cell.descriptionAvailableSupplyLabel.text = "Available Supply"
        cell.descriptionTotalSupplyLabel.text = "Total Supply"
        cell.descriptionMaxSupplyLabel.text = "Max Supply"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 474)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
