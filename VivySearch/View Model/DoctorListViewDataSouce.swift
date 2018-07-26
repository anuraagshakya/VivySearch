//
//  DoctorListViewDataSouce.swift
//  VivySearch
//
//  Created by Anuraag Shakya on 26.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

class DoctorListViewDataSource: NSObject, UITableViewDataSource {
    var data = [Doctor]() {
        didSet {
            onDataUpdated()
        }
    }
    var onDataUpdated: () -> Void = {}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell") as! DoctorCell
        cell.name = data[indexPath.row].name
        cell.address = data[indexPath.row].address
        return cell
    }
}
