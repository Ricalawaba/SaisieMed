//
//  pancarteViewController.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 14/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

protocol saisiePancarteDelegate {
    func pancarteSelected(_ sender:pancarteViewController, pancarteStr:String)
    
}
private var kAssociationKeyNextField: UInt8 = 0

extension UITextField {
    @IBOutlet var nextField: UITextField? {
        get {
            return objc_getAssociatedObject(self, &kAssociationKeyNextField) as? UITextField
        }
        set(newField) {
            objc_setAssociatedObject(self, &kAssociationKeyNextField, newField, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}

class pancarteViewController: UIViewController,UITextFieldDelegate {

      var delegate: saisiePancarteDelegate?
    @IBOutlet weak var taSystLabel: UITextField!
  
    @IBOutlet weak var fRespLabel: UITextField!
    @IBOutlet weak var tempetLabel: UITextField!
    @IBOutlet weak var evaLabel: UITextField!
    @IBOutlet weak var sao2Label: UITextField!
    @IBOutlet weak var fcLabel: UITextField!
    @IBOutlet weak var taDiasLabel: UITextField!
    @IBAction func addPancarteButtonAction(_ sender: UIButton) {
      //  let cat: categorieExamen.Categorie = ExamTree.Pancarte
        var retValueString = ""
        if !(taSystLabel.text?.isEmpty)! {
            retValueString += " TA: \(taSystLabel.text!)/\(taDiasLabel.text!) "
        }
        if !((fcLabel.text?.isEmpty)!) {
            retValueString += " FC: \(fcLabel.text!) "
        }
        if !(tempetLabel.text?.isEmpty)! {
            retValueString += " T°= \(tempetLabel.text!)°C "
        }
        if !(sao2Label.text?.isEmpty)! {
            retValueString += " SaO2: \(sao2Label.text!)% "
        }
        if !(evaLabel.text?.isEmpty)! {
            retValueString += " EVA= \(evaLabel.text!)/10 "
        }
        if !(fRespLabel.text?.isEmpty)! {
            retValueString += " Fr. Resp: \(fRespLabel.text!) "
        }
        let dateFormatter=DateFormatter()
        //dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        //dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        // dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat="dd/MM - kk:mm"
        let strDate = dateFormatter.string(from: Date())
       retValueString = "(\(strDate )) " + retValueString
        
        if let del=delegate {
            del.pancarteSelected(self, pancarteStr: retValueString)
            
        }
        _=self.navigationController?.popViewController(animated: true)

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.taSystLabel.nextField=taDiasLabel
        taDiasLabel.nextField=fcLabel
        fcLabel.nextField=sao2Label
        sao2Label.nextField=evaLabel
        evaLabel.nextField=tempetLabel
        tempetLabel.nextField=fRespLabel
        fRespLabel.nextField=taSystLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.nextField?.becomeFirstResponder()
        return true
    }
}
