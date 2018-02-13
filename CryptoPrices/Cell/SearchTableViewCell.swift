//
//  SearchTableViewCell.swift
//  CryptoPrices
//
//  Created by Zan Drakslar on 12/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    var cryptoCurrencyImageView = UIImageView()
    var nameLabel = UILabel()
    
    //    let queue = OperationQueue()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.white
        cryptoCurrencyImageView.backgroundColor = UIColor.clear
        
        nameLabel.font = nameLabel.font.withSize(16)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        cryptoCurrencyImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(cryptoCurrencyImageView)
        
        cryptoCurrencyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        cryptoCurrencyImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        cryptoCurrencyImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        cryptoCurrencyImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: cryptoCurrencyImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
