//
//  TableViewDataSource.swift
//  WeatherAppProject
//
//  Created by NewMac on 4/27/22.
//

import Foundation
import UIKit

class TableViewDataSource: NSObject {
    
    let otherDaysCell = "OtherDaysTableViewCell"
    
    weak var tableView: UITableView?
    
    private var items: [OtherDaysInfoModel] = []
    
    init(tableView: UITableView) {
        super.init()
        
        self.tableView = tableView
        
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        
        registerCell()
    }
}

extension TableViewDataSource {
    public func addItems(_ items: [OtherDaysInfoModel]) {
        self.items = items
        tableView?.reloadData()
    }
}

extension TableViewDataSource {
    func registerCell() {
        tableView?.register(.init(nibName: otherDaysCell, bundle: nil), forCellReuseIdentifier: otherDaysCell)
    }
}

extension TableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension TableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: otherDaysCell) as! OtherDaysTableViewCell
        cell.daysLabel.text = items[indexPath.row].dayName
        cell.weatherDegreeLabel.text = items[indexPath.row].dailyDegree
        cell.weatherSymbolImageView.image = UIImage.init(named: "")
        
        return cell
    }
}
