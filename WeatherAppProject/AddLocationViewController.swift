//
//  AddLocationViewController.swift
//  WeatherAppProject
//
//  Created by NewMac on 5/20/22.
//

import UIKit

class AddLocationViewController: UIViewController {
    
    var dataSource: SavedCityTableViewDataSource!
    
    @IBOutlet weak var segmentedLabel: UISegmentedControl!

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var findCityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        dataSource = .init(tableView: tableView, vc: self)
        findCityTextField.delegate = self
   
        containerView.backgroundColor = .clear
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.cornerRadius = 5
        addButton.layer.cornerRadius = 5
        
        setPlaceHolderUI()
        segmentedLabel.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addCityButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func segmentedPressedButton(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("Listing")
        } else {
            print("Map")
        }
    }   
}

extension AddLocationViewController {
    func setPlaceHolderUI() {
        findCityTextField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
    }
}

extension AddLocationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        segmentedLabel.isHidden = false
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        segmentedLabel.isHidden = true
        print("End")
    }
}

