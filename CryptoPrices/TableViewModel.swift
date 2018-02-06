//
//  TableViewModel.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 07/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import Foundation

class SerialOperationQueue: OperationQueue {
    override init() {
        super .init()
        maxConcurrentOperationCount = 1
    }
}
