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
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
}

extension LocationProvider: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        lat = locValue.latitude
        lng = locValue.longitude
        
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}
