//
//  CustomLabel.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 18/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class LeftCustomLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    func initializeLabel() {
        self.backgroundColor = .clear
        self.font = UIFont(name: "ChalkboardSE-Light", size: 17)
        self.textAlignment = .left
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

class RightCustomLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    func initializeLabel() {
        self.backgroundColor = .clear
        self.font = UIFont(name: "ChalkboardSE-Light", size: 17)
        self.textAlignment = .right
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

class CustomLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    func initializeLabel() {
        self.backgroundColor = .clear
        self.font = UIFont(name: "ChalkboardSE-Light", size: 17)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
