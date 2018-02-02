//
//  TodayViewController.swift
//  BTCWidget
//
//  Created by Dejan Ribnikar on 28/01/2018.
//  Copyright © 2018 Dejan Ribnikar. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDataSource, UITableViewDelegate {

    let reuseIdentifier = String(describing: CryptoTableViewCell.self)
    let currencies: [CurrencyTypeEnum] = [.btc, .eth, .ltc, .xrp, .xmr, .neo]
    var currency: String!
    let defaults = UserDefaults.standard
    
    var tableView: UITableView {
        let tableView =  UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        return tableView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        getDefaults()
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        view.addSubview(tableView)
    }
    
    func getDefaults() {
        guard let curr = defaults.string(forKey: "currency") else {
            currency = "EUR"
            defaults.set(currency, forKey: "currency")
            return
        }
        currency = curr
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CryptoTableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        let currencyType = currencies[indexPath.row]
        cell.formatCell(withCurrencyType: currencyType, currencyName: currency)
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
        footer.contentView.backgroundColor = UIColor.clear
        footer.textLabel?.backgroundColor = UIColor.clear
        footer.textLabel?.font = title.font
        footer.textLabel?.textAlignment = .left
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 340) : maxSize
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
