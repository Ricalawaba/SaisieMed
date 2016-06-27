//
//  rapportViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 14/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//
// TODO: Plntage lors de l'export mail de rapport non "patient"
import UIKit
import MessageUI
class rapportViewController: UIViewController ,MFMailComposeViewControllerDelegate  {

    @IBAction func MailData(sender: UIBarButtonItem) {
        let email = MFMailComposeViewController()
        email.mailComposeDelegate = self
        email.setToRecipients(["drricalens@gmail.com"])

        email.setSubject("Synthèse clinique de \(patient.nomPrenom), \(patient.age) ans")
        let messageBody=webView.stringByEvaluatingJavaScriptFromString("document.body.innerHTML")!
        email.setMessageBody(messageBody, isHTML: true) // or true, if you prefer
        presentViewController(email, animated: true, completion: nil)
    }
    @IBAction func done(sender: UIBarButtonItem) {
       self.navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var webView: UIWebView!
    var patient=patients.patient()
    var uneCategorie: categorieExamen.Categorie?=nil
    var directHTML : String?

    // Delegate requirement
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidAppear(animated: Bool) {
        var myHTMLString:String="<head><meta name=\"viewport\" content=\"width=device-width;initial-scale=1.0\"></head>"
        if directHTML != nil {
            myHTMLString=directHTML!
        }
        else if uneCategorie == nil {
            myHTMLString = patient.DetailedString()
            
        } else {
            myHTMLString = "<H2>\(uneCategorie!.nom)</H2>"
            let detailstr=uneCategorie!.formattedDetaiString()
            if !detailstr.isEmpty {
                myHTMLString += "<h2>\(uneCategorie!.nom)</h2><p>\(detailstr)</p>"
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
