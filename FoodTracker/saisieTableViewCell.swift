//
//  saisieTableViewCell.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class saisieTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCategorie: UIImageView!
    @IBOutlet weak var nomCategorie: UILabel!
    @IBOutlet weak var detailCategorie: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
