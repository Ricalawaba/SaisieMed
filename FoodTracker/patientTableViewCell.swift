//
//  patientTableViewCell.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class patientTableViewCell: UITableViewCell {

    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var imageSex: UIImageView!
    @IBOutlet weak var nomage: UILabel!
    @IBOutlet weak var localisation: UILabel!
    @IBOutlet weak var motif: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
