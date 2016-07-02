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
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Donnees.selectiontextDict[examen.tag]!.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Donnees.selectiontextDict[examen.tag]![row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueTextField.text = Donnees.selectiontextDict[examen.tag]![row]
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView
    {
        var pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.text = Donnees.selectiontextDict[examen.tag]![row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.numberOfLines=3
        pickerLabel.adjustsFontSizeToFitWidth=true
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 15) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
}
