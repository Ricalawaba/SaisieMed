//
//  examgroupTableViewCell.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 15/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class examgroupTableViewCell: UITableViewCell {
    var examen : Examen?
    
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var intitule: UILabel!
  
    @IBOutlet weak var monImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
