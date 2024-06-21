//
//  LocalSearchHelper.swift
//  WeatherAppProject
//
//  Created by NewMac on 5/27/22.
//

import Foundation
import MapKit

protocol LocalSearchHelperDelegate: AnyObject {
    
    func didResultCome(results: [String])
}

//- MARK: Text field gelen veriyi arama yapmaya calistigimiz yer

class LocalSearchHelper: NSObject {
    
    weak var delegate: LocalSearchHelperDelegate?

    private var searchCompleter = MKLocalSearchCompleter()

//    var completion: (([String]) -> ())?

    override init() {
        super.init()
        
        searchCompleter.resultTypes = .address
        searchCompleter.delegate = self
    }
    
    func setSearchText(_ searchText: String) {
        searchCompleter.queryFragment = searchText
    }
}

extension LocalSearchHelper: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        
        print("xxxx \(completer.results)")
        let stringArray = completer.results.map{$0.title}
        delegate?.didResultCome(results: stringArray)
    }
    
//    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
//
//
//        print("xxxx \(completer.results)")
//        let stringArray = completer.results.map{$0.title}
//
//        completion?(stringArray)
//    }
}
