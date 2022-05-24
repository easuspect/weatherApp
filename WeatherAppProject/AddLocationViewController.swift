//
//  AddLocationViewController.swift
//  WeatherAppProject
//
//  Created by NewMac on 5/20/22.
//

import UIKit

class AddLocationViewController: UIViewController {
    
    var dataSource: SavedCityTableViewDataSource!

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var findCityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = .init(tableView: tableView, vc: self)
   
        containerView.backgroundColor = .clear
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.cornerRadius = 5
        addButton.layer.cornerRadius = 5   
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addCityButtonPressed(_ sender: Any) {
        
    }
    
}

