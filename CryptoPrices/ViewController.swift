//
//  ViewController.swift
//  Crypto
//
//  Created by Dejan Ribnikar on 24/01/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currency: String!
    let defaults = UserDefaults.standard
    
    let refreshControl = UIRefreshControl()
    let currencies: [CurrencyTypeEnum] = [.btc, .eth, .ltc, .xrp, .xmr, .neo]
    let reuseIdentifier = String(describing: CryptoPricesTableViewCell.self)
    
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
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getDefaults()
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: func setupViews: Setup views
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
    // MARK: func switcher: Set segmented control
    @objc func switcher() {
        switch currencySwitch.selectedSegmentIndex {
        case 1:
            currency = "USD"
            defaults.set(currency, forKey: "currency")
            
            let range = NSMakeRange(0, tableView.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            tableView.reloadSections(sections as IndexSet, with: .automatic)
            
        default:
            currency = "EUR"
            defaults.set(currency, forKey: "currency")
            
            let range = NSMakeRange(0, tableView.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            tableView.reloadSections(sections as IndexSet, with: .automatic)
        }
    }
    // MARK: func getDefaults: Get or set user defaults
    func getDefaults() {
        guard let curr = defaults.string(forKey: "currency") else {
            currency = "EUR"
            currencySwitch.selectedSegmentIndex = 0
            defaults.set(currency, forKey: "currency")
            return
        }
        currency = curr
        if currency == "EUR" {
            currencySwitch.selectedSegmentIndex = 0
        } else {
            currencySwitch.selectedSegmentIndex = 1
        }
    }
    // MARK: func refreshPrices: Refresh tableView
    @objc func refreshPrices() {
        let range = NSMakeRange(0, tableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        tableView.reloadSections(sections as IndexSet, with: .automatic)
        refreshControl.endRefreshing()
    }
    // MARK: func tableView: Set tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CryptoPricesTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        let currencyType = self.currencies[indexPath.row]
        cell.formatCell(withCurrencyType: currencyType, currencyName: currency)
        cell.sizeToFit()
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cryptocurrency Prices"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return "Updated on " + dateString
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let title = UILabel()
        title.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.lightGray
        header.textLabel?.font = title.font
        header.textLabel?.textAlignment = .left
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let title = UILabel()
        title.font = UIFont(name: "HelveticaNeue-Thin", size: UIFont.systemFontSize)
        
        let footer: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footer.contentView.backgroundColor = UIColor.lightGray
        footer.textLabel?.font = title.font
        footer.textLabel?.textAlignment = .left
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


