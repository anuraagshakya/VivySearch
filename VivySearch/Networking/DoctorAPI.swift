//
//  doctorAPI.swift
//  VivySearch
//
//  Created by Anuraag Shakya on 26.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import Foundation
import SwiftyJSON

class DoctorAPI {
    static let sharedInstance = DoctorAPI()
    
    // MARK: User credential constants
    
    let username = "ioschallenge@uvita.eu"
    let password = "shouldnotbetoohard"
    
    // MARK: Endpoint constants
    
    let authenticationEndpoint  = "https://api.uvita.eu/oauth/token"
    let searchEndpoint          = "https://api.uvita.eu/api/users/me/doctors"
    let pictureEndpoint         = "https://api.uvita.eu/api/users/me/files"
    
    // MARK: API methods
    
    func authenticate(onFailure: @escaping (ErrorResult) -> ()) {
        let url = URL(string: authenticationEndpoint)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Basic aXBob25lOmlwaG9uZXdpbGxub3RiZXRoZXJlYW55bW9yZQ==", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        let postString = "grant_type=password&username=ioschallenge%40uvita.eu&password=shouldnotbetoohard"
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Check for networking errors
            guard let _ = data, error == nil else {
                onFailure(ErrorResult.network(string: error!.localizedDescription))
                return
            }
            
            // Check for HTTP errors
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                onFailure(ErrorResult.network(string: "statusCode should be 200, but is \(httpStatus.statusCode)"))
                return
            }
        }
        task.resume()
    }
}
