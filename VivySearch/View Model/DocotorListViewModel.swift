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
    let locationProvider = LocationProvider()
    
    func fetchDoctors(completion: @escaping ([Doctor]?, ErrorResult?) -> ()) {
        DoctorAPI.sharedInstance.authenticate { errorResult in
            // on failure propagate error result to viewcontroller
            completion(nil, errorResult)
        }
        
        // Fetch sample data from file for UI testing
        guard let sampleFilePath = Bundle.main.path(forResource: "sample", ofType: "json") else {
            completion(nil, ErrorResult.other(string: "File could not be opened"))
            return
        }
        
        guard let data = try? String(contentsOfFile: sampleFilePath) else {
            completion(nil, ErrorResult.other(string: "File contents could not be read"))
            return
        }
        
        let json = JSON(parseJSON: data)
        completion(parse(json: json), nil)
    }
    
    func parse(json: JSON) -> [Doctor] {
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
                openingHours    : openingHours
            )
            
            data.append(doctor)
        }
        return data
    }
}
