//
//  configurationViewController.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 21/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class configurationViewController: UIViewController,dateSelectedDelegate {

    func dateSelected(sender: selectDateViewController, text: String, date: NSDate) {
        self.title=text
        // create the alert
        let alert = UIAlertController(title: "Selection date", message: text, preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func exportSwift(sender: UIButton) {
        let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("rapportControlerID") as! rapportViewController
        svc.directHTML="<H3>Export Swift<H3><p>"
        var addStr="selectiontextDict[\"atcd\"] = ["
        
        for anStr in Donnees.selectiontextDict["atcd"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"
        
        addStr += "selectiontextDict[\"medicament\"] = ["
        for anStr in Donnees.selectiontextDict["medicament"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"
        addStr += "selectiontextDict[\"motif\"] = ["
        for anStr in Donnees.selectiontextDict["motif"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"
        
        addStr += "selectiontextDict[\"localisation\"] = ["
        for anStr in Donnees.selectiontextDict["localisation"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"
        
        addStr += "selectiontextDict[\"etablissement\"] = ["
        for anStr in Donnees.selectiontextDict["etablissement"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"
        
        addStr += "selectiontextDict[\"medecin\"] = ["
        for anStr in Donnees.selectiontextDict["medecin"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"
        
        addStr += "selectiontextDict[\"posologie\"] = ["
        for anStr in Donnees.selectiontextDict["posologie"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"
        
        addStr += "selectiontextDict[\"profession\"] = ["
        for anStr in Donnees.selectiontextDict["profession"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"

        addStr += "selectiontextDict[\"ConclusionRx\"] = ["
        for anStr in Donnees.selectiontextDict["ConclusionRx"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"

        addStr += "selectiontextDict[\"Evenement\"] = ["
        for anStr in Donnees.selectiontextDict["Evenement"]! {
            addStr += "\r\n\"\(anStr)\","
        }
        addStr += "\r\n]<p>"

        svc.directHTML="<H3>Export Swift<H3><p>\(addStr)"
        //self.presentViewController(svc, animated: true, completion: nil)
        self.navigationController!.pushViewController(svc,animated: true)
    }
    @IBAction func changerFichierPatient(sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier=="selectDateFromConfig"
        {
            let svc = segue.destinationViewController as! selectDateViewController
            svc.delegate=self

        }
        
    }
    

}
