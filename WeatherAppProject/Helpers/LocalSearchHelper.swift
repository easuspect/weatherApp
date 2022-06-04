//
//  LocalSearchHelper.swift
//  WeatherAppProject
//
//  Created by NewMac on 5/27/22.
//

import Foundation
import MapKit

class LocalSearchHelper: NSObject {
    
    private var searchCompleter = MKLocalSearchCompleter()
    
    var completion: (([String]) -> ())?
    
    override init() {
        super.init()
        
        searchCompleter.resultTypes = .address
        searchCompleter.delegate = self
    }
    
    func setSearchText(_ text: String) {
        searchCompleter.queryFragment = text
    }
}

extension LocalSearchHelper: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        print("xxxx \(completer.results)")
        completion?(completer.results.map{$0.title})
    }
}
