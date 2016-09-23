//
//  selectionTableViewCell.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 17/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class selectionTableViewCell: UITableViewCell {
    var examen:Examen! = nil
    @IBOutlet weak var questionSelection: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // self.textLabel!.font=UIFont(
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
