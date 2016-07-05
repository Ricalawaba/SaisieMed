//
//  pickSelectTableViewCell.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 02/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class pickSelectTableViewCell: UITableViewCell ,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    var examen:Examen! = nil
    
    
    @IBOutlet weak var intituleLabel: UILabel!

    @IBOutlet weak var valueTextField: UITextField!
    @IBAction func valueTextFieldDidEnd(sender: UITextField) {
        if (valueTextField.text != nil) {
            examen.value = valueTextField.text!
            
        }else {
            examen.value=""
        }

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        valueTextField.delegate=self
        
        var pickerView=UIPickerView()
        pickerView.delegate=self
        valueTextField.inputView=pickerView
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if examen.type == .multirowdatastr {
            return Donnees.multiColumnPickerDataStr[examen.tag]!.count
        }

        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if examen.type == .multirowdatastr {
        return Donnees.multiColumnPickerDataStr[examen.tag]![component].count
        }
        return Donnees.selectiontextDict[examen.tag]!.count
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if examen.type == .multirowdatastr {
            return Donnees.multiColumnPickerDataStr[examen.tag]![component][row]
        }
        
        return Donnees.selectiontextDict[examen.tag]![row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if examen.type == .multirowdatastr {
            var  makeStr:String=""
            for c in 0..<pickerView.numberOfComponents {
                makeStr += Donnees.multiColumnPickerDataStr[examen.tag]![c][pickerView.selectedRowInComponent(c)]
            
            }
            valueTextField.text = makeStr
        } else {
        valueTextField.text = Donnees.selectiontextDict[examen.tag]![row]
        }
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView
    {
        
        
        var pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        if examen.type == .multirowdatastr {
            pickerLabel.text = Donnees.multiColumnPickerDataStr[examen.tag]![component][row]
            switch component {
            case 0:
                if Donnees.multiColumnPickerDataStr[examen.tag]?.count  < 6 {
                   pickerLabel.textAlignment = NSTextAlignment.Right
                }
            case 1:
                switch Donnees.multiColumnPickerDataStr[examen.tag]!.count {
                case 2,4..<6 :
                    pickerLabel.textAlignment = NSTextAlignment.Left
              
                    
                default: break
                    
                    
                }
            case 3:
                if Donnees.multiColumnPickerDataStr[examen.tag]!.count == 5 {
                    pickerLabel.textAlignment = NSTextAlignment.Right
                }

//                if Donnees.multiColumnPickerDataStr[examen.tag]?.count  < 3 {
//                    pickerLabel.textAlignment = NSTextAlignment.Left
//                }
            default:
                pickerLabel.textAlignment = NSTextAlignment.Center

                break
                
            }
        }
            else { pickerLabel.text = Donnees.selectiontextDict[examen.tag]![row]}
        
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.numberOfLines=3
        pickerLabel.adjustsFontSizeToFitWidth=true
        
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 25) // In this use your custom font
                return pickerLabel
    }
}
