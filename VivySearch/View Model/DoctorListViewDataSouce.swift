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
            // call onDataUpdated closure when data is set
            onDataUpdated()
        }
    }

    var onDataUpdated: () -> Void = {}

    // MARK: UITableViewDelegate methods

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
