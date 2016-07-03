//
//  selectDateViewController.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 21/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
protocol dateSelectedDelegate {
    func dateSelected(sender:UIViewController, text:String,date:NSDate)
    
}

class selectDateViewController: UIViewController {
    
    @IBOutlet weak var dateMYPickerView: MonthYearPickerView!
    @IBOutlet weak var jourmoisanneeDatePicker: UIDatePicker!
    @IBOutlet weak var dateComplete: UIDatePicker!
    
    @IBAction func returnDateComplète(sender: UIButton) {
        self.date=dateComplete.date
        returnDate("dd MMM yyyy à HH:mm")
    }
    @IBAction func returnJourMoisAnnee(sender: UIButton) {
        self.date=jourmoisanneeDatePicker.date
        returnDate("dd/MM/yyyy")
    }
    @IBAction func returnMoisAnnee(sender: UIButton) {
            returnDate()
    }
    @IBAction func returnAnnee(sender: UIButton) {
            returnDate("yyyy")
    }
    var date=NSDate()
    
    var delegate:dateSelectedDelegate?
    func returnDate(format: String="MMMM yyyy"){
        if let del=delegate  {
            let dateFormatter=NSDateFormatter()
            //dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            //dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
           // dateFormatter.locale = NSLocale.currentLocale()
            dateFormatter.dateFormat=format
            let strDate = dateFormatter.stringFromDate(self.date).capitalizedString
            del.dateSelected(self, text: strDate, date: self.date)
            
        }
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dateMYPickerView.onDateSelected =   { (month: Int, year: Int) in
        //    let string = String(format: "%02d/%d", month, year)
            
            let components = NSDateComponents()
            let calendar = NSCalendar.currentCalendar()
            components.month = month
            components.year = year
            
            self.date = calendar.dateFromComponents(components)!
            
            
           // NSLog(string) // should show something like 05/2015
        }
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
