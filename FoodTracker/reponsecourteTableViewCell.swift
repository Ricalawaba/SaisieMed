//
//  reponsecourteTableViewCell.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class reponsecourteTableViewCell: UITableViewCell, UITextFieldDelegate {
    var examen: Examen! = nil
    
    @IBAction func reponsecourteEditEnd(_ sender: UITextField) {
        if (valeurReponseCourte.text != nil) {
            examen.value = valeurReponseCourte.text!
         
        }else {
            examen.value=""
        }
    }
    @IBOutlet weak var texteReponsecourte: UILabel!
    @IBOutlet weak var valeurReponseCourte: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        valeurReponseCourte.delegate=self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
}
