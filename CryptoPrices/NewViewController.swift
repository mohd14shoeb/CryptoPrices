//
//  NewViewController.swift
//  CryptoPrices
//
//  Created by Zan Drakslar on 05/02/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let cellId = "cellId"
    
    var crypto = ["Bitcoin", "Bitcoin Cash", "Etherium", "Ripple", "NEO", "Cardano", "Litecoin"]
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        //        search.isHidden = true
        search.placeholder = "Search"
        search.translatesAutoresizingMaskIntoConstraints = false
        search.delegate = self
        return search
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    fileprivate func tableViewLayoutSetup() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
        
        view.backgroundColor = .clear
        
        view.addSubview(searchBar)
        searchBarLayoutSetup()
        view.addSubview(tableView)
        tableViewLayoutSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func cancelNewCryptoCoin() {
        dismiss(animated: false, completion: nil)
    }
    
    var filteredData: [String] = []
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            tableView.isHidden = true
        } else {
            if tableView.isHidden {
                tableView.isHidden = false
            }
            
            filteredData = crypto.filter({ (coin) -> Bool in
                return coin.lowercased().contains(searchText.lowercased())
            })
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
}
