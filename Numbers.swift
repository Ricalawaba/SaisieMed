//
//  Numbers.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 25/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class NumbersPickerView: UIPickerView , UIPickerViewDelegate, UIPickerViewDataSource  {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    enum NumbersType {
        case none
        case tensionarterielle
        case temperature
        case EVA
        case frequencecardiaque
        case frequencerespiratoire
        
    }
    var type:NumbersType = .none
    var onNumberSelected: ((number:String) -> Void)?
    var data1:[String]!
    var data2:[String]?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonSetup()
    }
    
    func commonSetup() {
        NSLog(String(self.type.hashValue))
        type = .tensionarterielle
        if type == .none { return }
        if type == .tensionarterielle {
            var ldata = [String]()
            var ta=60
            while ta < 300 {
                ldata += [String(ta)]
                 ta += 5
            }
            data1=ldata
            ldata=[String]()
            ta=30
            while ta < 160 {
                ldata += [String(ta)]
                ta += 5
                
            }
            data2=ldata
            self.selectRow(9, inComponent: 0, animated: false)
            self.selectRow(8, inComponent: 1, animated: false)

        }
//        var years: [Int] = []
//        let year = NSCalendar(identifier: NSCalendarIdentifierGregorian)!.component(.Year, fromDate: NSDate())
//        if years.count == 0 {
//            
//            for y in 1910...year {
//                years.append(y)
//                // year += 1
//            }
//        }
//   //     self.years = years
        
        self.delegate = self
        self.dataSource = self
        // self.numberOfComponents=2
//        let month = NSCalendar(identifier: NSCalendarIdentifierGregorian)!.component(.Month, fromDate: NSDate())
//        self.selectRow(month-1, inComponent: 0, animated: false)
//        self.selectRow(years.indexOf(year)!, inComponent: 1, animated: true)
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if data1.count==0 {commonSetup()}
        if type == .tensionarterielle { return 2 }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return data1[row]
        case 1:
            return data2![row]
        default:
            return nil
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return data1.count
        case 1:
            return data2!.count
        default:
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if let block = onNumberSelected {
            if self.type == .tensionarterielle { block(number: "\(data1[self.selectedRowInComponent(0)])/\(data2![self.selectedRowInComponent(1)])")}
        }
//        let month = self.selectedRowInComponent(0)+1
//        let year = years[self.selectedRowInComponent(1)]
//        if let block = onDateSelected {
//            block(month: month, year: year)
//        }
        
//        self.month = month
//        self.year = year
    }

    
}
