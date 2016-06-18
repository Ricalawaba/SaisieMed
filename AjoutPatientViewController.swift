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

    @IBOutlet weak var motif: UITextField!
    @IBOutlet weak var hommeFemme: UISegmentedControl!
    @IBOutlet weak var nomFamille: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var localisation: UITextField!
    @IBOutlet weak var medicaltraumato: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        motif.delegate=self
        nomFamille.delegate=self
        prenom.delegate=self
        localisation.delegate=self
        age.delegate=self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
    }
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        keyboardFrame = self.view.convertRect(keyboardFrame, fromView: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height+20
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        
        var contentInset:UIEdgeInsets = UIEdgeInsetsZero
        self.scrollView.contentInset = contentInset
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
            let patient1 =  patients.patient(nomPrenom: "\(nomFamille.text!.uppercaseString) \(prenom.text!.capitalizedString)",
                                             age: unAge!,
                                             localisation: localisation.text!,
                                             motif: motif.text!, masculin: val )
            del.patientAdded(self, patient: patient1)
        }
    }

    @IBAction func AjoutPatientAction(sender: UIButton) {
//        var val = false
//        if hommeFemme.selectedSegmentIndex==1 {val = true}
//        let patient1 =  patients.patient(nomPrenom: "\(nomFamille.text!.uppercaseString) \(prenom.text!.capitalizedString)",
//                                         age: Int(age.text!)!,
//                                         localisation: localisation.text!,
//                                         motif: motif.text!, masculin: val )
        
        /*patient1.age = Int(age.text!)!
        patient1.nomPrenom = "\(nomFamille.text!.uppercaseString) \(prenom.text!.capitalizedString)"
        patient1.localisation=localisation.text!
        if hommeFemme.selectedSegmentIndex==0 {patient1.masculin=true}
        patient1.motif=motif.text!*/
        ajoutPatient()
        //Donnees.listePatient.patients.append(patient1)
        
//        
//        let parentview = self.parentViewController as! patientTableViewController
//        
//        parentview.tableView.reloadData()
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
