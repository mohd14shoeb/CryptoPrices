//
//  DetailsViewController.swift
//  CryptoPrices
//
//  Created by Dejan Ribnikar on 18/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {

    var coin: CoinViewModel!
    
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
}
