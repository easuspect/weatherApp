//
//  UILabel+Extension.swift
//  WeatherAppProject
//
//  Created by NewMac on 4/7/22.
//

import UIKit

extension UILabel {
    
    func setAttrText(
        title: String,
        value: String,
        valueColor: UIColor = .white,
        titleColor: UIColor = .white.withAlphaComponent(0.3)
    ) {
        let valueAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)
        ]
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.3),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
        ]
        
        let mutableAttrString = NSMutableAttributedString(string: value, attributes: valueAttributes)
        let titleString = NSAttributedString(string: title, attributes: titleAttributes)
        
        mutableAttrString.append(titleString)
        
        attributedText = mutableAttrString
    }
}
