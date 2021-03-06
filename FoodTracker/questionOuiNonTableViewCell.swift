//
//  questionOuiNonTableViewCell.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class questionOuiNonTableViewCell: UITableViewCell {
    var examen:Examen! = nil
    
    @IBOutlet weak var texteQuestion: UILabel!
    @IBOutlet weak var reponseSegmentedControl: UISegmentedControl!
    @IBAction func Changed(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==2 {examen.value=""}
        else {
            self.examen.value="\(sender.selectedSegmentIndex)"
        }
        self.texteQuestion.enabled = (examen.value != "")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
