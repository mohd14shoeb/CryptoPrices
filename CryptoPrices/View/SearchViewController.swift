//
//  SearchViewController.swift
//  CryptoPrices
//
//  Created by Zan Drakslar on 05/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let reuseIdentifier = String(describing: CoinTableViewCell.self)
    
    private var api = API()
    
    private var searchViewModel: SearchViewModel!
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.translatesAutoresizingMaskIntoConstraints = false
        search.delegate = self
        return search
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    fileprivate func tableViewLayoutSetup() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    fileprivate func searchBarLayoutSetup() {
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Cryptocurrency Prices"
        
        let cancelNewCryptoCoinButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelNewCryptoCoin))
        navigationItem.rightBarButtonItem = cancelNewCryptoCoinButton
        
        view.backgroundColor = .white //.clear
        tableView.backgroundColor = .black
        tableView.alpha = 0.1
        
        searchViewModel = SearchViewModel(API: api) {
            self.tableView.reloadData()
        }
        
        view.addSubview(searchBar)
        searchBarLayoutSetup()
        view.addSubview(tableView)
        tableViewLayoutSetup()
    }
    
    @objc func cancelNewCryptoCoin() {
        dismiss(animated: false, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel.searchText(searchText: searchText)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return searchViewModel.cellForRowAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

