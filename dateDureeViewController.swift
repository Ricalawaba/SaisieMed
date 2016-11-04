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
    var date=Date() {
        didSet {
            dateHeureDatePicker.date=self.date
        }
    }
    @IBAction func jourheureAction(_ sender: UIButton) {
        self.date=dateHeureDatePicker.date
        returnDate("dd/MM/yyyy (HH:mm)")

    }
    
    @IBAction func anneeAction(_ sender: UIButton) {
        self.date=dateDatePicker.date
        returnDate("yyyy")
    }

    @IBAction func dateHeureChanger(_ sender: UIDatePicker) {
        dateDatePicker.date=sender.date
    }
    @IBAction func moisAction(_ sender: UIButton) {
        self.date=dateDatePicker.date
        returnDate()
    }
    
    @IBAction func jourAction(_ sender: UIButton) {


        self.date=dateDatePicker.date
        
        returnDate("dd/MM/yyyy")
    }
    @IBOutlet weak var dateHeureDatePicker: UIDatePicker!
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    
    @IBAction func qqMinutesActionButton(_ sender: UIButton) {
        returnString("quelques minutes")
    }
    @IBAction func qqHeuresActionButton(_ sender: UIButton) {
        returnString("quelques heures")
    }
    @IBAction func qqJoursActionButton(_ sender: UIButton) {
        returnString("quelques jours")
    }
    @IBAction func qqSemainesActionButton(_ sender: UIButton) {
        returnString("quelques semaines")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
            
            // NSLog(string) // should show something like 05/2015
    //    }

    }
    func returnString(_ str:String) {
        if let del=delegate  {
            del.dateSelected(self, text: str, date: self.date)
            
        }
        _=self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func returnDate(_ format: String="MMMM yyyy"){
        if let del=delegate  {
            let dateFormatter=DateFormatter()
            //dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            //dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
            // dateFormatter.locale = NSLocale.currentLocale()
            dateFormatter.dateFormat=format
            let strDate = dateFormatter.string(from: self.date)
            del.dateSelected(self, text: strDate, date: self.date)
            
        }
        _=self.navigationController?.popViewController(animated: true)
        
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
