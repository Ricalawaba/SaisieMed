//
//  imageDocumentTableViewCell.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 26/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class imageDocumentTableViewCell: UITableViewCell {
    @IBOutlet weak var intituleLabel: UILabel!
    @IBOutlet weak var imageDocument: UIImageView!
    //var examen:Examen?
    var imageMapped:MappedImage? {
        didSet {
            imageDocument.image=imageMapped?.image
        }
    }
    var examen:Examen? {
        didSet {
            if let ex=examen {
                intitule=ex.intitule
                //if let img = UIImage( contentsOfFile:fileInDocumentsDirectory(ex.value)) {
                if let imageMap=MappedImage(contentsOfFile: ex.value){
                    imageMapped=imageMap
                } else
                    if let img = UIImage(named: ex.value) {
                        // if img.
                        var imageMap=MappedImage()
                        imageMap.imageFileName=ex.value
                        imageMap.name=ex.value.stringByAppendingPathExtension("pngmap")
                        imageMap.saveToFile(imageMap.name)
                        ex.value=imageMap.name
                        imageDocument.image = img
                        DataSave.saveFilePatients()
                        print(img.description)
                    } else
                    {print (ex.value," not found") }
                
                
            }
        }
    }
    var intitule:String {
        get {
            return intituleLabel.text!
        }
        set {
            intituleLabel.text=newValue
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
