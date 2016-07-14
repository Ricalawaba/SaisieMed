//
//  imagefileTableViewCell.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 13/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class imagefileTableViewCell: UITableViewCell {
    var imagefilepathname: String!

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var filenameImageView: UIImageView!
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
