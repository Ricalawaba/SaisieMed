//
//  checkTableViewCell.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 17/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class checkTableViewCell: UITableViewCell {
    var examen:Examen! = nil
    
    @IBOutlet weak var questionCheckLabel: UILabel!
    
    @IBOutlet weak var checkSegment: UISegmentedControl!
    @IBOutlet weak var checkSegment1: UISegmentedControl!
    
    @IBAction func chekSegmentChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            examen.value = ""
        } else { examen.value = "0" }
        self.questionCheckLabel.enabled = (examen.value=="0")
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
