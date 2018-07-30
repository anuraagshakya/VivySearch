//
//  LocationProvider.swift
//  VivySearch
//
//  Created by Anuraag Shakya on 26.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import CoreLocation
import Foundation

class LocationProvider: NSObject {
    var lat: Double?
    var lng: Double?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.distanceFilter = 1000
            locationManager.requestLocation()
        }
    }
}

extension LocationProvider: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("location = \(location.coordinate.latitude) \(location.coordinate.longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Error: \(error.localizedDescription)")
    }
}
