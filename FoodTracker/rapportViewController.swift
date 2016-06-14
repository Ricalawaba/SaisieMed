//
//  rapportViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 14/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class rapportViewController: UIViewController {

    @IBAction func done(sender: UIBarButtonItem) {
       self.navigationController?.popViewControllerAnimated(true)  
    }
    @IBOutlet weak var webView: UIWebView!
    var patient=patients.patient()
    
    override func viewDidAppear(animated: Bool) {
        var myHTMLString:String
        myHTMLString = "<H2>\(patient.nomPrenom), \(patient.age)</H2>"
        
        for  cat in patient.examen.categories
        {
            let detailstr=cat.detailString()
            if !detailstr.isEmpty {
                myHTMLString += "<h2>\(cat.nom)</h2><p>\(detailstr)</p>"
            }
        }
        webView.loadHTMLString(myHTMLString, baseURL: nil)
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
