//
//  AjoutPatientViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class AjoutPatientViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var motif: UITextField!
    @IBOutlet weak var hommeFemme: UISegmentedControl!
    @IBOutlet weak var nomFamille: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var localisation: UITextField!
    @IBOutlet weak var medicaltraumato: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        motif.delegate=self
        nomFamille.delegate=self
        prenom.delegate=self
        localisation.delegate=self
        age.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func AjoutPatientAction(sender: UIButton) {
        let patient1 =  patients.patient()
        patient1.age = Int(age.text!)!
        patient1.nomPrenom = "\(nomFamille.text!.uppercaseString) \(prenom.text!.capitalizedString)"
        patient1.localisation=localisation.text!
        if hommeFemme.selectedSegmentIndex==0 {patient1.masculin=true}
        patient1.motif=motif.text!
        Donnees.listePatient.patients.append(patient1)
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
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
