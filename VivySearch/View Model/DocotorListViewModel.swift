//
//  DocotorListViewModel.swift
//  VivySearch
//
//  Created by Anuraag Shakya on 26.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import Foundation
import SwiftyJSON

class DoctorListViewModel {
    var dataSource: DoctorListViewDataSource
    let locationProvider = LocationProvider()
    
    init(dataSource: DoctorListViewDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchDoctors() {
        if let sampleFilePath = Bundle.main.path(forResource: "sample", ofType: "json") {
            if let data = try? String(contentsOfFile: sampleFilePath) {
                let json = JSON(parseJSON: data)
                parse(json: json)
                return
            } else {
                print("Could not read contents of file")
            }
        } else {
            print("File not found")
        }
    }
    
    func parse(json: JSON) {
        var data = [Doctor]()
        
        for dataPoint in json["doctors"].arrayValue {
            var specialityIds = [Int]()
            for specialityId in dataPoint["specialityIds"].arrayValue {
                specialityIds.append(specialityId.intValue)
            }
            var openingHours = [String]()
            for openingHour in dataPoint["openingHours"].arrayValue {
                openingHours.append(openingHour.stringValue)
            }
            
            let doctor = Doctor(
                id              : dataPoint["id"].stringValue,
                name            : dataPoint["name"].stringValue,
                photoId         : dataPoint["photoId"].stringValue,
                rating          : dataPoint["rating"].floatValue,
                address         : dataPoint["address"].stringValue,
                lat             : dataPoint["lat"].doubleValue,
                lng             : dataPoint["lng"].doubleValue,
                highlighted     : dataPoint["highlighted"].boolValue,
                reviewCount     : dataPoint["reviewCount"].intValue,
                specialityIds   : specialityIds,
                source          : dataPoint["source"].stringValue,
                phoneNumber     : dataPoint["phoneNumber"].stringValue,
                email           : dataPoint["email"].stringValue,
                website         : dataPoint["website"].stringValue,
                openingHours    : openingHours)
            
            data.append(doctor)
        }
        dataSource.data = data
    }
    
    
}
