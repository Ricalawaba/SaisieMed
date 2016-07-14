//
//  pancarteViewController.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 14/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

protocol saisiePancarteDelegate {
    func pancarteSelected(sender:pancarteViewController, pancarteStr:String)
    
}
class pancarteViewController: UIViewController {

      var delegate: saisiePancarteDelegate?
    @IBOutlet weak var taSystLabel: UITextField!
  
    @IBOutlet weak var fRespLabel: UITextField!
    @IBOutlet weak var tempetLabel: UITextField!
    @IBOutlet weak var evaLabel: UITextField!
    @IBOutlet weak var sao2Label: UITextField!
    @IBOutlet weak var fcLabel: UITextField!
    @IBOutlet weak var taDiasLabel: UITextField!
    @IBAction func addPancarteButtonAction(sender: UIButton) {
        let cat: categorieExamen.Categorie = ExamTree.Pancarte
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
        let dateFormatter=NSDateFormatter()
        //dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        //dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        // dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat="dd/MM - kk:mm"
        let strDate = dateFormatter.stringFromDate(NSDate())
       retValueString = "(\(strDate )) " + retValueString
        
        if let del=delegate {
            del.pancarteSelected(self, pancarteStr: retValueString)
            
        }
        self.navigationController?.popViewControllerAnimated(true)

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
