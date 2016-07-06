//
//  imageSelectTableViewCell.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 05/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
//import AssetsLibrary
import MobileCoreServices
protocol imageSelectedDelegate {
    func imageSelected(sender:UIView,image:UIImage, url: String)
    
}
func randomStringWithLength (len : Int) -> NSString {
    
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    var randomString : NSMutableString = NSMutableString(capacity: len)
    
    for (var i=0; i < len; i++){
        var length = UInt32 (letters.length)
        var rand = arc4random_uniform(length)
        randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
    }
    
    return randomString
}
func getDocumentsURL() -> NSURL {
    let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    return documentsURL
}

func fileInDocumentsDirectory(filename: String) -> String {
    
    let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
    return fileURL.path!
    
}

class imageSelectTableViewCell: UITableViewCell , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBAction func viewDocumentButtonAction(sender: UIButton) {
//        if let del=self.delegate  {
//            del.imageSelected(self, image: loadImageFromPath(examen.value)! , url: examen.value)
//        }
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate=self


        imagePicker.sourceType = .SavedPhotosAlbum
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = true
        
        UIApplication.sharedApplication().keyWindow?.rootViewController!.presentViewController(imagePicker, animated: true, completion: nil)

//        let svc =  UIApplication.sharedApplication().keyWindow?.rootViewController!.storyboard?.instantiateViewControllerWithIdentifier("pluginFormID") as! pluginFormViewController
//        let aview = svc.view
//        svc.imageView.image=UIImage(contentsOfFile: examen.value)
       // UIApplication.sharedApplication().keyWindow?.rootViewController!.navigationController!.pushViewController(svc,animated: true)
        
    }
    @IBOutlet weak var imageLabel: UILabel!
    
    @IBOutlet weak var theImageView: UIImageView!
    @IBAction func selectImageAction(sender: UIButton) {
       // imagePicker.cameraCaptureMode = .Photo
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate=self
        imagePicker.sourceType = .Camera
        imagePicker.showsCameraControls=true
        imagePicker.allowsEditing = true
        
        UIApplication.sharedApplication().keyWindow?.rootViewController!.presentViewController(imagePicker, animated: true, completion: nil)
    }
    var examen:Examen! = nil {
        didSet {
            
        }
    }
    
    var imagePicker = UIImagePickerController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagePicker.delegate=self
        
    }
    var delegate:imageSelectedDelegate?

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            //imageLabel.text=(info[UIImagePickerControllerReferenceURL] as! NSURL).absoluteString
            let fileName = "\(randomStringWithLength(8)).jpg"
            let imagePath = fileInDocumentsDirectory(fileName)
            examen.value=imagePath
            examen.tag="image"
            saveImage(pickedImage, path: imagePath)
                    if let del=self.delegate  {
                        del.imageSelected(self, image: pickedImage , url: fileName)
                    }
         }
        
                UIApplication.sharedApplication().keyWindow?.rootViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //imageLabel.text="(image)"
          UIApplication.sharedApplication().keyWindow?.rootViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    func saveImage (image: UIImage, path: String ) -> Bool{
        
        //let pngImageData = UIImagePNGRepresentation(image)
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = jpgImageData!.writeToFile(path, atomically: true)
        
        return result
        
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }
}
