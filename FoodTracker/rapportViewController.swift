//
//  rapportViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 14/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
import MessageUI
class rapportViewController: UIViewController ,MFMailComposeViewControllerDelegate  {

    @IBAction func MailData(sender: UIBarButtonItem) {
        let email = MFMailComposeViewController()
        email.mailComposeDelegate = self
        email.setToRecipients(["drricalens@gmail.com"])

        email.setSubject("Synthèse clinique de \(patient.nomPrenom), \(patient.age) ans")
        email.setMessageBody(webView.stringByEvaluatingJavaScriptFromString("document.body.innerHTML")!, isHTML: true) // or true, if you prefer
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
            myHTMLString = "<H2>\(patient.nomPrenom), \(patient.age) ans</H2>"
            for  cat in patient.examen.categories
            {
                if cat.nom == "Administratif" {
                    var AdminStr=""
                    var sexe:String!
                    let nom:String = cat.examens[0].value
                    if cat.examens[1].value=="0" {
                        sexe="Homme"
                    }else {sexe="Femme"}
                    
                    AdminStr += "<h2>Synthèse médicale</h2><p>\(nom), \(sexe),\(cat.examens[2].value) ans"
                    let motif=cat.examens[4].categorie!.detailString()
                    if !motif.isEmpty { AdminStr += "<li><b><u>Motif:</u></b> <b>\(motif)</b>" }
                    
                    let medTraitant=cat.examens[5].value
                    if !medTraitant.isEmpty { AdminStr += "<li><u>Médecin traitant:</u> \(medTraitant)" }
                    
                    let modevie=cat.examens[7].categorie!.detailString()
                    if !modevie.isEmpty {
                        AdminStr += "<li><u>Mode de vie:</u> \(modevie)"
                    }
                    let modeentree=cat.examens[6].categorie!.detailString()
                    if !modeentree.isEmpty {
                        AdminStr += "<li><u>Mode d'entrée:</u> \(modeentree)"
                    }
                    let connuProfession=cat.examens[8].value
                    if !connuProfession.isEmpty {
                        AdminStr += "<li><u>Profession:</u> \(connuProfession)"
                    }
                    let connuClinique=cat.examens[9].categorie!.detailString()
                    if !connuClinique.isEmpty {
                        AdminStr += "<li><u>Connu de la clinique:</u> \(connuClinique)"
                    }

                    myHTMLString += AdminStr
                } else {
                    let detailstr=cat.formattedDetaiString()
                    if !detailstr.isEmpty {
                        myHTMLString += "<p><b><u>\(cat.nom)</u></b><br>\(detailstr)</p>"
                    }
                }
            }
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
