//
//  CurrencyImage.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 04/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import  UIKit

struct CryptoCurrencyImage: Decodable {
    let BaseImageUrl: String?
    let BaseLinkUrl: String?
    let Data: [String]?
    let DefaultWatchList: [String]?
    let Message: String?
    let Response: String?
    let type: Int?
    
    enum CodingKeys: String, CodingKey {
        case BaseImageUrl
        case BaseLinkUrl
        case Data
        case DefaultWatchList
        case Message
        case Response
        case type = "Type"
    }
}







