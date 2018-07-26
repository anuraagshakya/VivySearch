//
//  Doctor.swift
//  VivySearch
//
//  Created by Anuraag Shakya on 26.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import Foundation

struct Doctor {
    var id: String
    var name: String
    var photoId: String?
    var rating: Float
    var address: String
    var lat: Double
    var lng: Double
    var highlighted: Bool
    var reviewCount: Int?
    var specialityIds: [Int]
    var source: String?
    var phoneNumber: String?
    var email: String?
    var website: String?
    var openingHours: [String]
   
}
