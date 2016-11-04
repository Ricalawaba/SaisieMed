//
//  pickSelectTableViewCell.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 02/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
import DropDown
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


class pickSelectTableViewCell: UITableViewCell ,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    var examen:Examen! = nil
    var dropdown = DropDown()
    
    @IBOutlet weak var intituleLabel: UILabel!

    @IBAction func launchDropDown(_ sender: UIButton) {
        var dd:[String]=[]
        
        for t in Donnees.selectiontextDict[examen.tag]! {
            dd.append(t)
        }
        dropdown.anchorView=self.forLastBaselineLayout
        dropdown.dataSource=dd
        //  dropdown.topOffset = CGPoint(x: 0, y:-sender.plainView.bounds.height)
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.examen.value=item
            //self.tableView.reloadData()
            self.valueTextField.text=item
            
        }
        
        _=dropdown.show()
    }
    @IBAction func tapTextField(_ sender: UITextField) {
//                var dd:[String]=[]
//        
//                for t in Donnees.selectiontextDict[examen.tag]! {
//                    dd.append(t)
//                }
//                dropdown.anchorView=self.viewForLastBaselineLayout
//                dropdown.dataSource=dd
//                //  dropdown.topOffset = CGPoint(x: 0, y:-sender.plainView.bounds.height)
//                dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
//                    self.examen.value=item
//                    //self.tableView.reloadData()
//                    self.valueTextField.text=item
//                    
//                }
//                
//                dropdown.show()
    }
    @IBOutlet weak var valueTextField: UITextField!
    @IBAction func valueTextFieldDidEnd(_ sender: UITextField) {


        if (valueTextField.text != nil) {
            examen.value = valueTextField.text!
            
        }else {
            examen.value=""
        }
        valueTextField.resignFirstResponder()
    }
    var thePickerView:UIPickerView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        valueTextField.delegate=self
        
        thePickerView=UIPickerView()
//        thePickerView.delegate=self
//        valueTextField.inputView=thePickerView
//        
        DropDown.appearance().textFont = UIFont.systemFont(ofSize: 15)
      //  DropDown.appearance().cellHeight=60
        DropDown.appearance().backgroundColor = UIColor.black
        DropDown.appearance().textColor = UIColor.yellow
        DropDown.appearance().selectionBackgroundColor = UIColor.darkGray
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if examen.type == .multirowdatastr {
            return Donnees.multiColumnPickerDataStr[examen.tag]!.count
        }

        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if examen.type == .multirowdatastr {
        return Donnees.multiColumnPickerDataStr[examen.tag]![component].count
        }
        return Donnees.selectiontextDict[examen.tag]!.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if examen.type == .multirowdatastr {
            return Donnees.multiColumnPickerDataStr[examen.tag]![component][row]
        }
        
        return Donnees.selectiontextDict[examen.tag]![row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if examen.type == .multirowdatastr {
            var  makeStr:String=""
            for c in 0..<pickerView.numberOfComponents {
                makeStr += Donnees.multiColumnPickerDataStr[examen.tag]![c][pickerView.selectedRow(inComponent: c)]
            
            }
            valueTextField.text = makeStr
        } else {
        valueTextField.text = Donnees.selectiontextDict[examen.tag]![row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.black
        if examen.type == .multirowdatastr {
            pickerLabel.text = Donnees.multiColumnPickerDataStr[examen.tag]![component][row]
            switch component {
            case 0:
                if Donnees.multiColumnPickerDataStr[examen.tag]?.count  < 6 {
                   pickerLabel.textAlignment = NSTextAlignment.right
                }
            case 1:
                switch Donnees.multiColumnPickerDataStr[examen.tag]!.count {
                case 2,4..<6 :
                    pickerLabel.textAlignment = NSTextAlignment.left
              
                    
                default: break
                    
                    
                }
            case 3:
                if Donnees.multiColumnPickerDataStr[examen.tag]!.count == 5 {
                    pickerLabel.textAlignment = NSTextAlignment.right
                }
            default:
                pickerLabel.textAlignment = NSTextAlignment.center
                break
            }
        } else {
            pickerLabel.text = Donnees.selectiontextDict[examen.tag]![row]
            pickerLabel.textAlignment = .center
        }
        
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.numberOfLines=3
        pickerLabel.adjustsFontSizeToFitWidth=true
        
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 30) // In this use your custom font
                return pickerLabel
    }
}
