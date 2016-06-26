//
//  AjoutInformationTableViewCell.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 24/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
protocol AjoutInformationDelegate {
    func ajoutInformation(sender:AjoutInformationTableViewCell, examen: Examen)
    
}
class AjoutInformationTableViewCell: UITableViewCell {
    var examen:Examen! = nil
    var delegate:AjoutInformationDelegate!
    
    @IBOutlet weak var ajoutInfoBtn: UIButton!
    @IBAction func ajoutInfoAction(sender: UIButton) {
        if let del=delegate  {
                let exa=self.examen
            del.ajoutInformation(self, examen: exa)

        }
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
