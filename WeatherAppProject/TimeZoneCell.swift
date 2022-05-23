//
//  TimeZoneCell.swift
//  WeatherAppProject
//
//  Created by NewMac on 4/8/22.
//

import UIKit

class TimeZoneCell: UICollectionViewCell {
    
    @IBOutlet weak var upLabel: UILabel!
    
    @IBOutlet weak var downLabel: UILabel!
    
    @IBOutlet weak var midImageLabel: UIImageView!

    @IBOutlet private(set) weak var containerView: UIView!
    @IBOutlet private(set) weak var containeViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var containerViewTopConstraint: NSLayoutConstraint!
    
    var timer = Timer()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //liveTimeMatch()
        
        containerView.layer.cornerRadius = containerView.layer.frame.width / 2
        //upLabel.setAttrText(title: "am", value: "1\n", valueColor: .white, titleColor: .white)
    }
}

extension TimeZoneCell {
    
    func liveTimeMatch() {
//        upLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        upLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }
    
    @objc func tick() {
      //  upLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        upLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    }
}

