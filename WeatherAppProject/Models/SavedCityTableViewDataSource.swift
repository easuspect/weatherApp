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
    
    let savedCityTableViewCell = "SavedCityTableViewCell"

    init(tableView: UITableView, vc: UIViewController) {
    
        super.init()
        self.tableView = tableView
        self.viewController = vc
    
        tableView.dataSource = self
        tableView.delegate = self
        
        registerCell()

        }
    }

    extension SavedCityTableViewDataSource {
        func registerCell() {
        tableView.register(.init(nibName: "SavedCityTableViewCell", bundle: nil), forCellReuseIdentifier: savedCityTableViewCell)
        }
    }

    extension SavedCityTableViewDataSource: UITableViewDelegate {
    
        
    }

    extension SavedCityTableViewDataSource: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
   
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: savedCityTableViewCell) as! SavedCityTableViewCell
            cell.savedCityDegree.text = "sjdckdcnskldjc"
            cell.savedCityLabel.text = "SDLCKNSDCKLN"
            cell.savedWeatherConditionLabel.text = "ldcjnldcn"
            return cell
        }
    }


