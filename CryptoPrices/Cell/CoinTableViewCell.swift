//
//  CoinTableViewCell.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 01/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import Foundation
import UIKit

class CoinTableViewCell: UITableViewCell {
    var cryptoCurrencyImageView = UIImageView()
    var priceLabel = UILabel()
    var symbolLabel = UILabel()
    var nameLabel = UILabel()
    var priceChangeLabel = UILabel()
    
    let priceLineChartView = UILabel()
    let queue = OperationQueue()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    func setupViews() {
        self.backgroundColor = UIColor.lightGray
        cryptoCurrencyImageView.backgroundColor = UIColor.clear
        
        nameLabel.font = nameLabel.font.withSize(16)
        nameLabel.adjustsFontSizeToFitWidth = true
        
        priceLabel.font = priceLabel.font.withSize(16)
        priceLabel.textAlignment = .center
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.layer.backgroundColor = UIColor.clear.cgColor
        priceLabel.layer.borderWidth = 1
        priceLabel.layer.cornerRadius = 5
        
        priceLineChartView.textAlignment = .right
        priceLineChartView.font = UIFont.systemFont(ofSize: 25)
        
        symbolLabel.font = symbolLabel.font.withSize(12)
        symbolLabel.textAlignment = .left
        
        priceChangeLabel.font = priceChangeLabel.font.withSize(16)
        priceChangeLabel.textAlignment = .center
        priceChangeLabel.layer.backgroundColor = UIColor.green.cgColor
        priceChangeLabel.layer.borderWidth = 1
        priceChangeLabel.layer.cornerRadius = 5
        
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
        
        NSLayoutConstraint.activate([
            cryptoCurrencyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cryptoCurrencyImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            cryptoCurrencyImageView.widthAnchor.constraint(equalToConstant: 46),
            cryptoCurrencyImageView.heightAnchor.constraint(equalToConstant: 46),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leftAnchor.constraint(equalTo: cryptoCurrencyImageView.rightAnchor, constant: 8),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            symbolLabel.leftAnchor.constraint(equalTo: cryptoCurrencyImageView.rightAnchor, constant: 8),
            symbolLabel.widthAnchor.constraint(equalToConstant: 100),
            symbolLabel.heightAnchor.constraint(equalToConstant: 18),
            
            priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            priceLabel.widthAnchor.constraint(equalToConstant: 100),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            priceLineChartView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            priceLineChartView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            priceLineChartView.widthAnchor.constraint(equalToConstant: 200),
            priceLineChartView.heightAnchor.constraint(equalToConstant: 46),
            
            priceChangeLabel.topAnchor.constraint(equalTo: priceLineChartView.bottomAnchor, constant: 8),
            priceChangeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            priceChangeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            priceChangeLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
