//
//  API.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 11/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import Foundation
import UIKit

class API {
    func getData(completion: @escaping ([Coin]) -> ()) {
        let urlString = "https://api.coinmarketcap.com/v1/ticker/?convert=EUR"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let coinData = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    completion(coinData)
                }
            } catch let err {
                print(err.localizedDescription)
            }
            }.resume()
    }
}
