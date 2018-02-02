//
//  CryptoTableViewCell.swift
//  Crypto
//
//  Created by Dejan Ribnikar on 24/01/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

//import UIKit
//
//class CryptoTableViewCell: UITableViewCell {
//    
//    let currencyImageView = UIImageView()
//    let nameLabel = UILabel()
//    let priceLabel = UILabel()
//    let json = [CellName]()
//    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        let viewsDict = [
//            "image": currencyImageView,
//            "name": nameLabel,
//            "price": priceLabel
//            ] as [String: Any]
//        
//        self.backgroundColor = UIColor.lightGray
//        currencyImageView.backgroundColor = UIColor.lightGray
//        nameLabel.font = nameLabel.font.withSize(16)
//        priceLabel.font = priceLabel.font.withSize(10)
//        
//        currencyImageView.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        priceLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        contentView.addSubview(currencyImageView)
//        contentView.addSubview(nameLabel)
//        contentView.addSubview(priceLabel)
//        
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(30)]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[name][price]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image(30)]-[name]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image(30)]-[price]-|", options: [], metrics: nil, views: viewsDict))        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func formatCell(withCurrencyType currencyType: CurrencyTypeEnum, currencyName: String) {
//        nameLabel.text = currencyType.name
//        currencyImageView.image = currencyType.image
//        
//        CurrencyType().getValue(cryptoName: currencyType.rawValue, currencyName: currencyName) { (value) in
//            DispatchQueue.main.async {
//                if currencyName == "USD" {
//                    self.priceLabel.text = value?.formattedCurrencyStringUSD ?? "Failed to get price"
//                } else {
//                    self.priceLabel.text = value?.formattedCurrencyStringEUR ?? "Failed to get price"
//                }
//            }
//        }
//    }
//}
    


