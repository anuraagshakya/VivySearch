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
    var viewModel: DoctorListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set title
        navigationItem.title = "Doctors near you"

        //
        dataSource.onDataUpdated = { [unowned self] in
            self.tableView.reloadData()
        }
        tableView.dataSource = dataSource
        viewModel = DoctorListViewModel(dataSource: dataSource)

        //
        viewModel.fetchDoctors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
