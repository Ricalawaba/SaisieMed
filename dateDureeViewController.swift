//
//  dateDureeViewController.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 03/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class dateDureeViewController: UIViewController {
    var delegate:dateSelectedDelegate?
    var date=NSDate() {
        didSet {
            dateHeureDatePicker.date=self.date
        }
    }
    @IBAction func jourheureAction(sender: UIButton) {
        self.date=dateHeureDatePicker.date
        returnDate("dd/MM/yyyy (HH:mm)")

    }
    
    @IBAction func anneeAction(sender: UIButton) {
        self.date=dateDatePicker.date
        returnDate("yyyy")
    }

    @IBAction func dateHeureChanger(sender: UIDatePicker) {
        dateDatePicker.date=sender.date
    }
    @IBAction func moisAction(sender: UIButton) {
        self.date=dateDatePicker.date
        returnDate()
    }
    
    @IBAction func jourAction(sender: UIButton) {


        self.date=dateDatePicker.date
        
        returnDate("dd/MM/yyyy")
    }
    @IBOutlet weak var dateHeureDatePicker: UIDatePicker!
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    
    @IBAction func qqMinutesActionButton(sender: UIButton) {
        returnString("quelques minutes")
    }
    @IBAction func qqHeuresActionButton(sender: UIButton) {
        returnString("quelques heures")
    }
    @IBAction func qqJoursActionButton(sender: UIButton) {
        returnString("quelques jours")
    }
    @IBAction func qqSemainesActionButton(sender: UIButton) {
        returnString("quelques semaines")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
            
            // NSLog(string) // should show something like 05/2015
    //    }

    }
    func returnString(str:String) {
        if let del=delegate  {
            del.dateSelected(self, text: str, date: self.date)
            
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func returnDate(format: String="MMMM yyyy"){
        if let del=delegate  {
            let dateFormatter=NSDateFormatter()
            //dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            //dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
            // dateFormatter.locale = NSLocale.currentLocale()
            dateFormatter.dateFormat=format
            let strDate = dateFormatter.stringFromDate(self.date)
            del.dateSelected(self, text: strDate, date: self.date)
            
        }
        self.navigationController?.popViewControllerAnimated(true)
        
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
