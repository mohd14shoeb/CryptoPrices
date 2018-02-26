//
//  DetailsViewController.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 18/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var coin: CoinViewModel!
    

    
//    let collectionController = UICollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
//    let collection = UICollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()).collectionView
    
    var collectionView: UICollectionView!
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Rectangle")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let topImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        image.contentMode = .scaleToFill
        return image
    }()
    
    let bottomImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        image.contentMode = .scaleToFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1)
        
        navigationItem.title = coin.name
        
        setupViews()
        
        collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func refreshData() {
    }
    
    func setupViews() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView)
        view.addSubview(topImageView)
        view.addSubview(bottomImageView)
        
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageView.image = UIImage(named: (coin.symbol?.lowercased())!)
        bottomImageView.image = UIImage(named: (coin.symbol?.lowercased())!)
        
        collectionView.backgroundColor = UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1)
        collectionView.backgroundView = backgroundImageView
        collectionView.layer.cornerRadius = 5
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 100),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),

            topImageView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 20),
            topImageView.heightAnchor.constraint(equalToConstant: 70),
            topImageView.widthAnchor.constraint(equalToConstant: 70),
            topImageView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),

            bottomImageView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -20),
            bottomImageView.heightAnchor.constraint(equalToConstant: 70),
            bottomImageView.widthAnchor.constraint(equalToConstant: 70),
            bottomImageView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor)
        ])
        
    }
    
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
        return CGSize(width: view.frame.width, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
