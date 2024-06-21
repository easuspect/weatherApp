//
//  LocationHelper.swift
//  WeatherAppProject
//
//  Created by NewMac on 5/6/22.
//

import MapKit

class LocationHelper {
    
    static func getAddressFromLatLon(
        pdblLatitude: String,
        withLongitude pdblLongitude: String,
        completion: @escaping ((String) -> Void)
    ) {
            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
            let lat: Double = Double("\(pdblLatitude)")!
            //21.228124
            let lon: Double = Double("\(pdblLongitude)")!
            //72.833770
            let ceo: CLGeocoder = CLGeocoder()
            center.latitude = lat
            center.longitude = lon

            let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


            ceo.reverseGeocodeLocation(loc, completionHandler:
                {(placemarks, error) in
                    if (error != nil)
                    {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    }
                let pm = placemarks! as [CLPlacemark]

                    if pm.count > 0 {
                        let pm = placemarks![0]
                        if let locality = pm.locality, let country = pm.country {
                        completion(locality + "," + country)
                        }
                  }
            })

        }
}
