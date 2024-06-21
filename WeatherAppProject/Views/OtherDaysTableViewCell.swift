//
//  OtherDaysTableViewCell.swift
//  WeatherAppProject
//
//  Created by NewMac on 4/27/22.
//

import UIKit

class OtherDaysTableViewCell: UITableViewCell {

    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var weatherDegreeLabel: UILabel!
    @IBOutlet weak var weatherSymbolImageView: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
