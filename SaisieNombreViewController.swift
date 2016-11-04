//
//  SaisieNombreViewController.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 26/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

protocol saisieNombreDelegate {
    func nombreSelected(_ sender:SaisieNombreViewController, numberStr:String)
    
}
class SaisieNombreViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: Propriétés
    var minNumber: Int=0
    var maxNumber: Int=100
    var step:Int=1
    fileprivate var val:String = ""
    var value:String {
        get {
            return val
        }
        set {
            if data == nil {fillData()}
            val=newValue
           
        }
    }
    var data:[String]?
    var Information: String=""
    var delegate: saisieNombreDelegate?
    
    // MARK: IBoutlet & Action
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var informationLabel: UILabel!
    @IBAction func validerAction(_ sender: UIButton) {
        if let del=delegate {
            del.nombreSelected(self,numberStr: value)
            
        }
         _=self.navigationController?.popViewController(animated: true)
    }
    

    // MARK: Remplissage Source données pickerview
    func fillData() {
        if ((data) != nil) {return}
        data=[String]()
        
        for x in stride(from: minNumber, to: maxNumber, by: step) {
     //   for var x=minNumber;x<=maxNumber;x = x+step{
            data!.append(String(x))
        }
    }
    
 // MARK Override View controller
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let indexRow=data!.index(of: val) {
            pickerView.selectRow(indexRow, inComponent: 0, animated: false)
        }
        informationLabel.text=Information
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

    // Mark: UIPicker Delegate / Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        fillData()
        switch component {
        case 0:
            return data![row]
            
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        fillData()
        switch component {
        case 0:
            return data!.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //super.
        value = data![row]
        
        
    }
}
