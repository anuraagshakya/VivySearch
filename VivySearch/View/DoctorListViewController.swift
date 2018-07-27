//
//  ViewController.swift
//  VivySearch
//
//  Created by Anuraag Shakya on 26.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

class DoctorListViewController: UITableViewController {
    var dataSource = DoctorListViewDataSource()
    var viewModel = DoctorListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set title
        navigationItem.title = "Doctors near you"

        // Relead the tableview when the data sources' data is updated
        dataSource.onDataUpdated = { [unowned self] in
            self.tableView.reloadData()
        }
        tableView.dataSource = self.dataSource

        // Call fetchDoctors, which for the moment authenticates the user and
        //  loads data from sample.json file for UI testing
        // TODO: Remove when search functionality is implemented
        viewModel.fetchDoctors { (doctors, error) in
            if let err = error {
                self.showError(err)
                return
            }
            self.dataSource.data = doctors!
        }
    }

    func showError(_ error: ErrorResult) {
        print(error.description())
        let ac = UIAlertController(title: "An Error Occurred", message: error.description(), preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(ac, animated: true)
    }
    
}
