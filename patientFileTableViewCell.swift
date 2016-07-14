//
//  patientFileTableViewCell.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 13/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class patientFileTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var filenameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
