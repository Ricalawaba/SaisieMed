//
//  AjoutPatientViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
import DropDown
protocol ajoutPatientDelegate {
    func patientAdded(_ sender:AjoutPatientViewController, patient:patients.patient)
}

class AjoutPatientViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var actionButtonItem: UIBarButtonItem!
let dropdown = DropDown()
    @IBAction func ActionButtonAction(_ sender: AnyObject) {
        
        dropdown.anchorView=actionButtonItem
        
        dropdown.dataSource=["Main","pied","Cheville","coude","tete"].sorted()
        
        _ = dropdown.show()
    }
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
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
            let patient1 =  patients.patient(nomPrenom: "\(nomFamille.text!.uppercased())",
                                             age: unAge!,
                                             localisation: "",
                                             motif: "", masculin: val )
            del.patientAdded(self, patient: patient1)
        }
    }
    @IBAction func ajoutPatientViewButtonAction(_ sender: UIButton) {
        ajoutPatient()
        _=self.navigationController?.popViewController(animated: true)

    }
    @IBAction func ajoutPatientTabBarButtonAction(_ sender: UIBarButtonItem) {
        ajoutPatient()
        _=self.navigationController?.popViewController(animated: true)

    }

    @IBAction func AjoutPatientAction(_ sender: UIButton) {
        ajoutPatient()
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
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return false
//    }
}
