//
//  AjoutPatientViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

protocol ajoutPatientDelegate {
    func patientAdded(sender:AjoutPatientViewController, patient:patients.patient)
}

class AjoutPatientViewController: UIViewController , UITextFieldDelegate {

  //  @IBOutlet weak var motif: UITextField!
    @IBOutlet weak var hommeFemme: UISegmentedControl!
    @IBOutlet weak var nomFamille: UITextField!
   // @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var age: UITextField!
  //  @IBOutlet weak var localisation: UITextField!
 //   @IBOutlet weak var medicaltraumato: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nomFamille.delegate=self
        
  //      localisation.delegate=self
        age.delegate=self
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AjoutPatientViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AjoutPatientViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
    }
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     // MARK: - Ajout patient par delegation
    var delegate: ajoutPatientDelegate?
    func ajoutPatient() {
        if let del = delegate {
            var val = false
            var unAge = Int(age.text!)
            if unAge==nil {unAge=0}
            if hommeFemme.selectedSegmentIndex==0 {val = true}
            let patient1 =  patients.patient(nomPrenom: "\(nomFamille.text!.uppercaseString)",
                                             age: unAge!,
                                             localisation: "",
                                             motif: "", masculin: val )
            del.patientAdded(self, patient: patient1)
        }
    }
    @IBAction func ajoutPatientViewButtonAction(sender: UIButton) {
        ajoutPatient()
        self.navigationController?.popViewControllerAnimated(true)

    }
    @IBAction func ajoutPatientTabBarButtonAction(sender: UIBarButtonItem) {
        ajoutPatient()
        self.navigationController?.popViewControllerAnimated(true)

    }

    @IBAction func AjoutPatientAction(sender: UIButton) {
        ajoutPatient()
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
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return false
//    }
}
