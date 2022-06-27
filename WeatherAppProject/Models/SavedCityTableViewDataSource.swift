//
//  SavedCityTableViewDataSource.swift
//  WeatherAppProject
//
//  Created by NewMac on 5/21/22.
//

import Foundation
import UIKit

class SavedCityTableViewDataSource: NSObject {
    
    private weak var tableView: UITableView!
    private weak var viewController: UIViewController!
    
    private var items = [AddLocationTableViewCellViewModel]()
    
    private let addLocationTableViewCell = "AddLocationTableViewCell"
    
    private var isSearchActive: Bool = false
    
    init(tableView: UITableView, vc: UIViewController) {
        
        super.init()
        self.tableView = tableView
        self.viewController = vc
        
        tableView.dataSource = self
        tableView.delegate = self
        
        registerCell()
        
    }
  
    func setItems(_ items: [AddLocationTableViewCellViewModel], isSearchActive: Bool = false) {
        //self.isSearchActive = isSearchActive
        self.items = items
        tableView?.reloadData()
    }
}

extension SavedCityTableViewDataSource {
    func registerCell() {
        tableView.register(.init(nibName: "AddLocationTableViewCell", bundle: nil), forCellReuseIdentifier: addLocationTableViewCell)
    }
}


extension SavedCityTableViewDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)! as! AddLocationTableViewCell

        print(currentCell.savedCityLabel.text)
        
        for (i,element) in items.enumerated().reversed() {
            items[i].isSelected = false
        }
        
        self.items[indexPath.row].isSelected = true
        
        tableView.reloadData()
    }
}

extension SavedCityTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: addLocationTableViewCell) as! AddLocationTableViewCell
        let rowItem = items[indexPath.row]
        cell.savedCityDegree.text = rowItem.degree
        cell.savedCityLabel.text = rowItem.cityNameText
        cell.savedWeatherConditionLabel.text = rowItem.weatherStatusText
        if rowItem.isSelected == true {
            cell.checkImageView.isHidden = false
        } else {
            cell.checkImageView.isHidden = true
        }
        
        return cell
    }
}

