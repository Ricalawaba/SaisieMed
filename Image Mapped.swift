//
//  Image Mapped.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 27/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation
import UIKit
/*protocol mappedImageDelegate {
 func regionSelected(sender:MappedImage,region: MappedImage.region)
 func actionSelected(sender:MappedImage,region:MappedImage.region,action:String)
 }*/
class MappedImage: NSObject,NSCoding {
    
    //  var delegate:mappedImageDelegate?
    class region: NSObject,NSCoding {
        // MARK: Propriétés
        var name:String
        var bounds:CGRect
        var action:String=""
        var value:String=""
        //var tag:NSObject?
        
        var regions:[region]?
        // MARK: Fonctions
        func contains(point:CGPoint)->Bool { return bounds.contains(point) }
        func haveRegion() -> Bool {
            if let reg=regions {
                return reg.count>0
            }
            return false
        }
        func regionAtLocation(location:CGPoint) -> region?{
            if let regs=regions {
                for reg in regs {
                    if reg.bounds.contains(location) {
                        return reg
                    }
                }
            }
            return nil
        }
        // MARK: Initialisation / NSCoding
        required
        init?(coder decoder: NSCoder) {
            guard let name = decoder.decodeObjectForKey("name") as? String,
                
                let action = decoder.decodeObjectForKey("action") as? String,
           //     let tag = decoder.decodeObjectForKey("tag") as? NSObject,
                let value = decoder.decodeObjectForKey("value") as? String
                else { return nil }
            let bounds = decoder.decodeCGRectForKey("bounds")
            let regions = decoder.decodeObjectForKey("regions") as? [region]
            self.name=name
            self.bounds=bounds
            self.action=action
        //    self.tag=tag
            self.regions=regions
            self.value=value
        }
        func encodeWithCoder(aCoder: NSCoder) {
            aCoder.encodeObject(name, forKey: "name")
   //         aCoder.encodeObject(tag, forKey: "tag")
            aCoder.encodeObject(action, forKey: "action")
            aCoder.encodeCGRect(bounds, forKey: "bounds")
            aCoder.encodeObject(regions,forKey: "regions")
            aCoder.encodeObject(value,forKey: "value")
        }
        
        
        override init() {
            //super.init()
            name=""
            bounds=CGRect.zero
            
        }
        init (name:String,bounds:CGRect) {
            self.name=name
            self.bounds=bounds
            
        }
        init(bounds:CGRect) {
            self.name=""
            self.bounds=bounds
            
        }
    }
    var name=""
    var imageFileName:String="" {
        didSet {
            readImage()
                    }
    }
    var regionsMain:[region]=[]

    var image: UIImage?
    func readImage() {
        if let img = UIImage(named: imageFileName) {
            image = img
            print(img.description)
        } else if let img = UIImage(contentsOfFile:fileInDocumentsDirectory(imageFileName)) {
            image = img
            print(img.description)
        }
        else {print (imageFileName," non trouvé (classe Image Mapped)") }
  
    }
    // MARK: Load/Save to file
    func saveToFile(filename:String) {
        let pathfilename=DataSave.getDocumentsDirectory().stringByAppendingPathComponent(filename)
        if  NSKeyedArchiver.archiveRootObject(self, toFile: pathfilename) {
        print("save map:",filename)
        print(self)
        } else {print("erreur ecriture fichier map") }

    }	
//    func loadFromFile(filename:String) {
//        if let listpatient=NSKeyedUnarchiver.unarchiveObjectWithFile(filePathPatients) as? patients{
//            Donnees.listePatient=listpatient
//        }
//    }
    // MARK: NSCoding
    init(name:String,regionsMain:[region],imagefilename:String){
        self.name=name
        self.regionsMain=regionsMain
        self.imageFileName=imagefilename
    }
    override init() {
        super.init()
    }
    private var loadedFromPathfilename:String?
    
    
    init?(contentsOfFile:String) {
        
        super.init()
        let pathfilename=DataSave.getDocumentsDirectory().stringByAppendingPathComponent(contentsOfFile)
        loadedFromPathfilename=contentsOfFile
        if let imagemap=NSKeyedUnarchiver.unarchiveObjectWithFile(pathfilename) as? MappedImage {
            
            self.name = imagemap.name
            self.regionsMain = imagemap.regionsMain
            self.imageFileName=imagemap.imageFileName
            self.readImage()
            print("lecture fichier map: ",pathfilename)
            print("name:",name,"imageFileName",self.imageFileName)
    //        print("MappedImage: img:",self.imageFileName," - file:", self.loadedFromPathfilename!)
            print("Regions:")
            for reg in self.regionsMain {
                print(reg.name,reg.bounds)
            }
        } else {
            print("lecture impossible fichier map:",self.imageFileName)
            return nil}
        
 
    }
    required
    init?(coder decoder: NSCoder) {
 //       super.init(decoder)
        
        guard let name = decoder.decodeObjectForKey("name") as? String,
            let imageFilename = decoder.decodeObjectForKey("imagefilename") as? String,
            let regions = (decoder.decodeObjectForKey("regionsmain") as? [region])
            else { return nil }
        
        self.name=name
        self.imageFileName=imageFilename
        self.regionsMain=regions
        
        
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.imageFileName,forKey: "imagefilename")
        aCoder.encodeObject(self.regionsMain,forKey: "regionsmain")
    }
    // MARK: Gestion UI des zones
    func addZone(rect:CGRect,viewController:UIViewController){
        let reg=region(bounds: rect)
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Nom de zone", message: "Entrer texte", preferredStyle: .Alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            reg.name=textField.text!
            print("Text field: \(textField.text)")
            self.regionsMain.append(reg)
            if let pathfilename=self.loadedFromPathfilename {
                dispatch_async(dispatch_get_main_queue()) {
                    //HACK: If not done in dispatch_async on main queue `setupUI` will have no effect
                    self.saveToFile(pathfilename)
                    print(pathfilename," sauvegardé. + ",reg.name,reg.bounds)
                }

                }
                

                       }))
        
        // 4. Present the alert.
        //view
        viewController.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: Calcul zones
    func hittedAt(point:CGPoint)->Bool {
        for reg in regionsMain {
            if reg.contains(point) {return true}
        }
        return false
    }
    
    func regionHittedAt(point:CGPoint)->region?{
        for reg in regionsMain {
            if reg.contains(point) {return reg}
        }
        return nil
    }
    
    func haveRegion() -> Bool { return regionsMain.count>0 }
    
    
    
}
