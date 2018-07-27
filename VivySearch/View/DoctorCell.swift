//
//  DoctorCell.swift
//  VivySearch
//
//  Created by Anuraag Shakya on 26.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

class DoctorCell: UITableViewCell {
    var name = "Name" {
        didSet {
            nameLabel.text = name
        }
    }

    var address = "Address" {
        didSet {
            addressLabel.text = address
        }
    }

    @IBOutlet private var photo: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var addressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
