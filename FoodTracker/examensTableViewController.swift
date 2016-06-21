//
//  examensTableViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class examensTableViewController: UITableViewController,textSelectedDelegate, UITextFieldDelegate,dateSelectedDelegate {
    var categorie : categorieExamen.Categorie!
    var examenSelected: Examen?
    //var examen = [Examen]()
    var activeField: UITextField?
    func dateSelected(sender: selectDateViewController, text: String, date: NSDate) {
//        self.title=text
//        // create the alert
//        let alert = UIAlertController(title: "Selection date", message: text, preferredStyle: UIAlertControllerStyle.Alert)
//        
//        // add an action (button)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//        
//        // show the alert
//        self.presentViewController(alert, animated: true, completion: nil)
        ExamTaped!.value=text
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //examen=Donnees.listeCategorie.categories.first!.examens
        self.title=categorie!.nom
        // print(examen.count)
        registerForKeyboardNotifications()
     
            autoshowFirstGroup()
        
    
    }
    // MARK: Affiche le premier element du tabview si c'est type "selection"
    func autoshowFirstGroup () {
        if categorie.examens.count==0 { return }
        let aExam = categorie.examens[0]
        if !aExam.value.isEmpty { return }
        if aExam.type == .selection {
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("selectionViewID") as! selectionTexteTableViewController
            examenSelected=categorie.examens[0]
            svc.textes = Donnees.selectiontextDict[examenSelected!.tag]!
            svc.delegate=self
            
            //self.presentViewController(svc, animated: true, completion: nil)
            self.navigationController!.pushViewController(svc,animated: true)
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK/ Textfield delegate
    func textFieldDidBeginEditing(textField: UITextField) {
        self.activeField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.activeField = nil
    }
    func registerForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(examensTableViewController.keyboardWasShown(_:)), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(examensTableViewController.keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWasShown(aNotification: NSNotification) {
        if activeField == nil {return}
        let info = aNotification.userInfo as! [String: AnyObject],
        kbSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue().size,
        contentInsets = UIEdgeInsets(top: 90, left: 0, bottom: kbSize.height, right: 0)
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets

        // If active text field is hidden by keyboard, scroll it so it's visible
        // Your app might not need or want this behavior.
        var aRect = self.view.frame
        aRect.size.height -= kbSize.height
        
        if !CGRectContainsPoint(aRect, activeField!.frame.origin) {
           
            
            self.tableView.scrollRectToVisible(activeField!.frame, animated: true)
        }
    }
    
    func keyboardWillBeHidden(aNotification: NSNotification) {
        if activeField == nil {return}
        let contentInsets = UIEdgeInsetsZero
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets
    }
    // MARK: - Table view data source
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "autoshow") {
            
            let svc = segue.destinationViewController as! examensTableViewController
            let mycell = (sender as! examgroupTableViewCell)
            svc.categorie = mycell.examen!.categorie!
            svc.navigationController?.title = svc.categorie!.nom
            //  sender?.row
            //  svc.listePatients = Donnees.listePatient
            
        }
        if (segue.identifier == "selectionSegue") {
            
            let svc = segue.destinationViewController as! selectionTexteTableViewController
            let mycell = (sender as! selectionTableViewCell)
           // let tab:[String]=(["Cholecystectomie","Appendicectomie","IDM"]).sort()
            examenSelected=mycell.examen
            svc.textes = Donnees.selectiontextDict[examenSelected!.tag]!
            svc.delegate=self
            
            //  sender?.row
            //  svc.listePatients = Donnees.listePatient
            
        }

        
    }
    // MARK: Retour selection texte
    func textSelected(sender:selectionTexteTableViewController, text:String) {
        if (examenSelected != nil) {
            if  Donnees.selectiontextDict[examenSelected!.tag]!.indexOf(text) == nil {
                Donnees.selectiontextDict[examenSelected!.tag]!.append(String(text))
                Donnees.selectiontextDict[examenSelected!.tag] = Donnees.selectiontextDict[examenSelected!.tag]?.sort()
            }

            examenSelected?.value=text
        }
        
        tableView.reloadData()
    }
    // MARK: Suppression selection texte
    func textDeleted(sender: selectionTexteTableViewController, text: String) {
        if (examenSelected != nil) {
            if Donnees.selectiontextDict[examenSelected!.tag]!.indexOf(text) != nil{
               Donnees.selectiontextDict[examenSelected!.tag]!.removeAtIndex(Donnees.selectiontextDict[examenSelected!.tag]!.indexOf(text)!)
            }
        }
    }
    // MARK: Tableview datasource et delegate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categorie.examens.count
    }

    @IBAction func EnregistrerModif(sender: UIBarButtonItem) {
        

         self.navigationController?.popViewControllerAnimated(true)
       /* let parent = self.parentViewController as! saisieTableViewController
        parent.tableView.reloadData()*/
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let examen1 = categorie.examens[indexPath.row]
        
        //var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("reponsecourteCell", forIndexPath: indexPath) as! reponsecourteTableViewCell
        //cell.textequestion
        let cell = UITableViewCell()
        if examen1.type==Examen.ExamenEnum.reponsecourte || examen1.type==Examen.ExamenEnum.donnee{
         let cell2 = tableView.dequeueReusableCellWithIdentifier("reponsecourteCell", forIndexPath: indexPath) as! reponsecourteTableViewCell
            cell2.texteReponsecourte.text=examen1.intitule
            if examen1.value != "" {
                cell2.valeurReponseCourte.text = examen1.value
            }
            cell2.examen=examen1
            cell2.valeurReponseCourte.delegate=self
            return cell2
        } else
        if examen1.type==Examen.ExamenEnum.ouinon {
            let cell3 = tableView.dequeueReusableCellWithIdentifier("questionOuiNonCell", forIndexPath: indexPath) as! questionOuiNonTableViewCell
            cell3.texteQuestion.text = examen1.intitule
            cell3.texteQuestion.enabled=true
            if examen1.value == "0" {
                cell3.reponseSegmentedControl.selectedSegmentIndex=0
            } else if examen1.value == "1" {
                cell3.reponseSegmentedControl.selectedSegmentIndex=1
                
            }else if examen1.value == "" {
                cell3.texteQuestion.enabled=false
            }
            cell3.examen=examen1
            return cell3
        }
        if examen1.type==Examen.ExamenEnum.check {
            let cell3 = tableView.dequeueReusableCellWithIdentifier("checkCell", forIndexPath: indexPath) as! checkTableViewCell
            cell3.questionCheckLabel.text = examen1.intitule
            if examen1.value == "0" {
                cell3.questionCheckLabel.enabled=true
                cell3.checkSegment.selectedSegmentIndex=0
            } else  {
                cell3.questionCheckLabel.enabled=false
                cell3.checkSegment.selectedSegmentIndex=1
                
            }
            cell3.examen=examen1
            return cell3
        }

        if examen1.type==Examen.ExamenEnum.group {
            let cell3 = tableView.dequeueReusableCellWithIdentifier("examgroup", forIndexPath: indexPath) as! examgroupTableViewCell
            cell3.intitule.text = examen1.intitule
                        cell3.examen=examen1
            if let namedImage = examen1.categorie?.namedImage
            {
                cell3.monImage.image=UIImage(named: namedImage)
            }
            
            cell3.details.text=examen1.categorie?.detailString()
            cell3.intitule.enabled = !(cell3.details.text?.isEmpty)!
            return cell3
        }
        if examen1.type==Examen.ExamenEnum.selection {
            let cell3 = tableView.dequeueReusableCellWithIdentifier("selectionCell", forIndexPath: indexPath) as! selectionTableViewCell
            
            if examen1.value.isEmpty {
            cell3.questionSelection.text = examen1.intitule
                cell3.questionSelection.enabled=false
            } else {
                cell3.questionSelection.text=examen1.value
                cell3.questionSelection.enabled=true
            }
            
            cell3.examen=examen1

            

            return cell3
        }

        // Configure the cell...
        return cell
         }
    var ExamTaped:Examen?
    
    @IBAction func tapRepCourte(sender: UITapGestureRecognizer) {
        
        let location : CGPoint = sender.locationInView(self.tableView)
        let indexPath:NSIndexPath = self.tableView.indexPathForRowAtPoint(location)!
         ExamTaped = categorie.examens[indexPath.row]
        if !(ExamTaped!.type == Examen.ExamenEnum.donnee || ExamTaped!.type == Examen.ExamenEnum.reponsecourte) {
            return
        }
        
        if ExamTaped!.tag == "date" {
            //let swipedcell:patientTableViewCell = self.tableView.cellForRowAtIndexPath(swipedIndexPath)!
            //do your stuff here
            //        longpushPatient = Donnees.listePatient.patients[swipedIndexPath.row]
            //        performSegueWithIdentifier("showrapportSegue", sender: self)
            //
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("selectDateViewControler") as! selectDateViewController
            //       svc.uneCategorie=rapportCat
            
            svc.delegate=self
            //self.presentViewController(svc, animated: true, completion: nil)
            self.navigationController!.pushViewController(svc,animated: true)
        }
    }
    override func viewWillAppear(animated: Bool) {
        
        tableView.reloadData()
        
    }
//    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
//    {
//        var title = UILabel()
//        title.font = UIFont(name: "Futura", size: 38)!
//        title.textColor = UIColor.lightGrayColor()
//        
//        let header = view as! UITableViewHeaderFooterView
//        header.textLabel?.font=title.font
//        header.textLabel?.textColor=title.textColor
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        swap(&categorie.examens[fromIndexPath.row],&categorie.examens[toIndexPath.row])

    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
