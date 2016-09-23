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
    func imageSelected(_ sender:UIView,image:UIImage, url: String)
    
}
func randomStringWithLength (_ len : Int) -> NSString {
    
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    let randomString : NSMutableString = NSMutableString(capacity: len)
    for _ in 0..<len {
    //for ( var i=0;i<len; i++  ){
        let length = UInt32 (letters.length)
        let rand = arc4random_uniform(length)
        randomString.appendFormat("%C", letters.character(at: Int(rand)))
    }
    
    return randomString
}


class imageSelectTableViewCell: UITableViewCell , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBAction func viewDocumentButtonAction(_ sender: UIButton) {
//        if let del=self.delegate  {
//            del.imageSelected(self, image: loadImageFromPath(examen.value)! , url: examen.value)
//        }
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate=self


        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = false
        
        UIApplication.shared.keyWindow?.rootViewController!.present(imagePicker, animated: true, completion: nil)

//        let svc =  UIApplication.sharedApplication().keyWindow?.rootViewController!.storyboard?.instantiateViewControllerWithIdentifier("pluginFormID") as! pluginFormViewController
//        let aview = svc.view
//        svc.imageView.image=UIImage(contentsOfFile: examen.value)
       // UIApplication.sharedApplication().keyWindow?.rootViewController!.navigationController!.pushViewController(svc,animated: true)
        
    }
    @IBOutlet weak var imageLabel: UILabel!
    
    @IBOutlet weak var theImageView: UIImageView!
    @IBAction func selectImageAction(_ sender: UIButton) {
       // imagePicker.cameraCaptureMode = .Photo
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate=self
        imagePicker.sourceType = .camera
        imagePicker.showsCameraControls=true
        imagePicker.allowsEditing = false
        
        UIApplication.shared.keyWindow?.rootViewController!.present(imagePicker, animated: true, completion: nil)
    }
    var examen:Examen! = nil {
        didSet {
            print("examen set dans imageselectviewcell")
        }
    }
    
    var imagePicker = UIImagePickerController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagePicker.delegate=self
        
    }
    var delegate:imageSelectedDelegate?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
      let quelleImage="UIImagePickerControllerOriginalImage"
       // if picker.sourceType == .Camera { quelleImage="UIImagePickerControllerEditedImage"}
        if let pickedImage = info[quelleImage] as? UIImage {
            //imageLabel.text=(info[UIImagePickerControllerReferenceURL] as! NSURL).absoluteString
            let fileName = "\(Donnees.patientEnCours!.nomPrenom)\(randomStringWithLength(4)).jpg"
            let imagePath = fileInDocumentsDirectory(fileName)
            examen.value=fileName
            examen.tag="image"
            theImageView.image=pickedImage
            saveImage(pickedImage, path: imagePath)
                    if let del=self.delegate  {
                        del.imageSelected(self, image: pickedImage , url: fileName)
                    }
         }
        
                UIApplication.shared.keyWindow?.rootViewController!.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //imageLabel.text="(image)"
          UIApplication.shared.keyWindow?.rootViewController!.dismiss(animated: true, completion: nil)
    }
    func saveImage (_ image: UIImage, path: String ) -> Bool{
        
        //let pngImageData = UIImagePNGRepresentation(image)
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = (try? jpgImageData!.write(to: URL(fileURLWithPath: path), options: [.atomic])) != nil
        
        return result
        
    }
    
    func loadImageFromPath(_ path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }
}
