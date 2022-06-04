//
//  savedCityTableViewCell.swift
//  WeatherAppProject
//
//  Created by NewMac on 5/21/22.
//

import UIKit

class AddLocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var savedWeatherConditionLabel: UILabel!
    @IBOutlet weak var savedCityLabel: UILabel!
    @IBOutlet weak var savedCityDegree: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
}
