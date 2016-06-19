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
    var uneCategorie: categorieExamen.Categorie?=nil
    
    override func viewDidAppear(animated: Bool) {
        var myHTMLString:String=""
        
        
        if uneCategorie == nil {
            myHTMLString = "<H2>\(patient.nomPrenom), \(patient.age) ans</H2>"
            for  cat in patient.examen.categories
            {
                if cat.nom == "Administratif" {
                    var AdminStr=""
                    var sexe:String!
                    var nom:String = cat.examens[0].value
                    if cat.examens[1].value=="0" {
                        sexe="Homme"
                    }else {sexe="Femme"}
                    
                    AdminStr += "<h2>Synthèse médicale</h2><p>\(nom), \(sexe),\(cat.examens[2].value) ans"
                    AdminStr += "<p>Motif: \(cat.examens[4].value)"
                    AdminStr += "<p>Médecin traitant: \(cat.examens[5].value)"
                    let modevie=cat.examens[6].categorie!.detailString()
                    if !modevie.isEmpty {
                        AdminStr += "<p> \(modevie)"
                    }
                    let modeentree=cat.examens[7].categorie!.detailString()
                    if !modeentree.isEmpty {
                        AdminStr += "<p>\(modeentree)"
                    }
                    myHTMLString += AdminStr
                } else {
                    let detailstr=cat.formattedDetaiString()
                    if !detailstr.isEmpty {
                        myHTMLString += "<h2>\(cat.nom)</h2><p>\(detailstr)</p>"
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
