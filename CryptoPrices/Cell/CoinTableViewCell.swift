//
//  CoinTableViewCell.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 01/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import Foundation
import UIKit
import Charts

class CoinTableViewCell: UITableViewCell {
    var cryptoCurrencyImageView = UIImageView()
    var priceLabel = UILabel()
    var symbolLabel = UILabel()
    var nameLabel = UILabel()
    var priceChangeLabel = UILabel()
    
    let priceLineChartView = LineChartView()
    let queue = OperationQueue()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.lightGray
        cryptoCurrencyImageView.backgroundColor = UIColor.clear
        
        nameLabel.font = nameLabel.font.withSize(16)
        
        priceLabel.font = priceLabel.font.withSize(16)
        priceLabel.textAlignment = .center
        priceLabel.layer.backgroundColor = UIColor.clear.cgColor
        priceLabel.layer.borderWidth = 1
        priceLabel.layer.cornerRadius = 5
        
        symbolLabel.font = symbolLabel.font.withSize(12)
        symbolLabel.textAlignment = .left
        
        priceChangeLabel.font = priceChangeLabel.font.withSize(16)
        priceChangeLabel.textAlignment = .center
        priceChangeLabel.layer.backgroundColor = UIColor.green.cgColor
        priceChangeLabel.layer.borderWidth = 1
        priceChangeLabel.layer.cornerRadius = 5
        
        priceLineChartView.borderColor = UIColor.black
        priceLineChartView.borderLineWidth = 1
        priceLineChartView.drawBordersEnabled = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        cryptoCurrencyImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLineChartView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(cryptoCurrencyImageView)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(priceChangeLabel)
        contentView.addSubview(priceLineChartView)
        
        cryptoCurrencyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        cryptoCurrencyImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        cryptoCurrencyImageView.widthAnchor.constraint(equalToConstant: 46).isActive = true
        cryptoCurrencyImageView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: cryptoCurrencyImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        symbolLabel.leftAnchor.constraint(equalTo: cryptoCurrencyImageView.rightAnchor, constant: 8).isActive = true
        symbolLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        symbolLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        priceLineChartView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        priceLineChartView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        priceLineChartView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        priceLineChartView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        priceChangeLabel.topAnchor.constraint(equalTo: priceLineChartView.bottomAnchor, constant: 8).isActive = true
        priceChangeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        priceChangeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        priceChangeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
