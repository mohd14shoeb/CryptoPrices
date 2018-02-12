//
//  ViewController.swift
//  Crypto
//
//  Created by Dejan Ribnikar on 24/01/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import SQLite3

let cache = NSCache<AnyObject, AnyObject>()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModel: CoinViewModel!
    private var api = API()
    var currency: String!

    
    let refreshControl = UIRefreshControl()
    let reuseIdentifier = String(describing: CoinTableViewCell.self)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = UIColor.lightGray
        return tableView
    }()
    
    lazy var currencySwitch: UISegmentedControl = {
        let items = ["EUR", "USD"]
        let currencySwitch = UISegmentedControl(items: items)
        currencySwitch.selectedSegmentIndex = 0
        currencySwitch.setTitle("USD", forSegmentAt: 1)
        currencySwitch.setTitle("EUR", forSegmentAt: 0)
        currencySwitch.backgroundColor = UIColor.lightGray
        currencySwitch.layer.cornerRadius = 5
        currencySwitch.tintColor = UIColor.black
        return currencySwitch
    }()
    
    var addNewCryptoCoinButton: UIBarButtonItem!
    var cancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getDefaults()
        viewModel = CoinViewModel(API: api) {
            self.tableView.reloadData()
        }
        setupViews()
        
        navigationItem.title = "Cryptocurrency Prices"
        
        addNewCryptoCoinButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewCryptoCoin))
        navigationItem.rightBarButtonItem = addNewCryptoCoinButton
    }
    
    @objc func addNewCryptoCoin() {
        let newViewController = NewViewController()
        let navController = UINavigationController(rootViewController: newViewController)
        navController.modalPresentationStyle = .overCurrentContext
        self.present(navController, animated: false, completion: nil)
    }
    
    @objc func refreshPrices() {
        viewModel = CoinViewModel(API: api) {
            let range = NSMakeRange(0, self.tableView.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            self.tableView.reloadSections(sections as IndexSet, with: .automatic)
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func switcher() {
        switch currencySwitch.selectedSegmentIndex {
        case 1:
            currency = "USD"
            UserDefaults.standard.set(currency, forKey: "currency")
            
            let range = NSMakeRange(0, self.tableView.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            self.tableView.reloadSections(sections as IndexSet, with: .automatic)
            
        default:
            currency = "EUR"
            UserDefaults.standard.set(currency, forKey: "currency")
            
            let range = NSMakeRange(0, tableView.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            tableView.reloadSections(sections as IndexSet, with: .automatic)
        }
    }
    
    func getDefaults() {
        guard let curr = UserDefaults.standard.string(forKey: "currency") else {
            viewModel.currency = "EUR"
            self.currencySwitch.selectedSegmentIndex = 0
            UserDefaults.standard.set(viewModel.currency, forKey: "currency")
            return
        }
        currency = curr
        if currency == "EUR" {
            currencySwitch.selectedSegmentIndex = 0
        } else {
            currencySwitch.selectedSegmentIndex = 1
        }
    }
    
    func setupViews() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshPrices), for: .valueChanged)
        
        view.backgroundColor = UIColor.lightGray
        view.addSubview(currencySwitch)
        currencySwitch.translatesAutoresizingMaskIntoConstraints = false
        currencySwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        currencySwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        currencySwitch.widthAnchor.constraint(equalToConstant: 100).isActive = true
        currencySwitch.heightAnchor.constraint(equalToConstant: 25).isActive = true
        currencySwitch.addTarget(self, action: #selector(switcher), for: .valueChanged)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: currencySwitch.bottomAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellForRowAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return viewModel.titleForFooterInSection()
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        viewModel.willDisplayFooterView(view: view)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


