//
//  examensTableViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
//import EasyTipView
import DropDown



class examensTableViewController: UITableViewController,textSelectedDelegate, UITextFieldDelegate,dateSelectedDelegate,
    AjoutInformationDelegate,numberSelectedDelegate,
saisieNombreDelegate,imageSelectedDelegate,saisiePancarteDelegate{
    var categorie : categorieExamen.Categorie!
    var examenSelected: Examen?
    //var examen = [Examen]()
    var dropdown = DropDown()
    @IBAction func ajouterChampLibre(sender: UIBarButtonItem) {
        //var categorie : categorieExamen.Categorie!
        var dd:[String]=[]
        //        if let subitemsDel=categorie.subItemDel {
        //            categorie.subitems=#selector(subitemsDel)as [String:Examen]
        //
        //        }
        let subitems=categorie.subitems
        for (name) in subitems {
            dd.append(name)
        }
        
        dd.append("Libre")
        dropdown.anchorView=sender
        dropdown.dataSource=dd
        dropdown.topOffset = CGPoint(x: 0, y:-sender.plainView.bounds.height)
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            var exam : Examen? = ExamTree.getExam(item)
            //      if let exam=
            if exam != nil {
                self.categorie.examens.append(exam!)
                
            }
            else {print("erreur examen non reconnu : \"\(item)\"");return}
            
            //                 let netExam=Examen(intitule: exam.intitule, type: exam.type)
            //                self.categorie.examens.append(self.categorie.subitems![item]!)
            
            self.tableView.reloadData()
            
            let rowToSelect:NSIndexPath = NSIndexPath(forRow: self.categorie.examens.count-1, inSection: 0)
            // NSIndexPath(
            self.tableView.selectRowAtIndexPath(rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.Bottom)
            // self.performSegueWithIdentifier("autoshow", sender: self.tableView.cellForRowAtIndexPath(rowToSelect));
            self.tableView.scrollToRowAtIndexPath(rowToSelect, atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
            if exam!.categorie==nil {
                self.tableView.reloadData();
                
                return}
            self.performSegueWithIdentifier("autoshow", sender: self.tableView.cellForRowAtIndexPath(rowToSelect));
            self.tableView.reloadData()
            
        }
        
        dropdown.show()
        
        // categorie.examens.append(ExamTree.libre)
        
    }
    @IBAction func refreshButtonAction(sender: UIBarButtonItem) {
        tableView.reloadData()
        
    }
    
    var activeField: UITextField?
    func ajoutInformation(sender:AjoutInformationTableViewCell, examen: Examen) {
        let indextoInsert = categorie.examens.indexOf(examen)!
        
        if examen.tag=="dupliquer" {
            let prevExamen=categorie.examens[indextoInsert-1]
            if prevExamen.intitule.containsString("Main") {
                categorie.examens.insert(Examen(categorie: ExamTree.Main), atIndex: indextoInsert)
            } else if prevExamen.intitule.containsString("Doigt") {
                categorie.examens.insert(Examen(categorie: ExamTree.Doigt), atIndex: indextoInsert)
            } else if prevExamen.intitule.containsString("Hanche") {
                categorie.examens.insert(Examen(categorie: ExamTree.Hanche), atIndex: indextoInsert)
            } else if prevExamen.intitule.containsString("Coude") {
                categorie.examens.insert(Examen(categorie: ExamTree.Coude), atIndex: indextoInsert)
            } else if prevExamen.intitule.containsString("Genou") {
                categorie.examens.insert(Examen(categorie: ExamTree.Genou), atIndex: indextoInsert)
            } else if prevExamen.intitule.containsString("Epaule") {
                categorie.examens.insert(Examen(categorie: ExamTree.Epaule), atIndex: indextoInsert)
            } else if prevExamen.intitule.containsString("Cheville") {
                categorie.examens.insert(Examen(categorie: ExamTree.Cheville), atIndex: indextoInsert)
            }
        }
        if examen.tag=="atcd" {
            categorie.examens.insert(Examen(categorie: ExamTree.atcd), atIndex: indextoInsert)
        }
        if examen.tag=="TTT" {
            categorie.examens.insert(Examen(categorie: ExamTree.TTT), atIndex: indextoInsert)
        }
        if examen.tag=="Plainte" {
            categorie.examens.insert(Examen(categorie: ExamTree.Plainte), atIndex: indextoInsert)
        }
        if examen.tag=="motif" {
            categorie.examens.insert(Examen(categorie: ExamTree.motif), atIndex: indextoInsert)
        }
        if examen.tag=="medecin" {
            categorie.examens.insert( Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"), atIndex: indextoInsert)
        }
        if examen.tag=="pancarteV" {
            categorie.examens.insert(Examen(intitule: "<br>Pancarte", type: .donnee,tag: "pancarteView" ), atIndex: indextoInsert)
            tableView.reloadData()
            return
        }
        if examen.tag=="evenementSuivi" {
            categorie.examens.insert( ExamTree.evenement.asExamen(), atIndex: indextoInsert)
        }
        
        if examen.tag=="radiologie" {
            categorie.examens.insert( ExamTree.Imagerie.asExamen(), atIndex: indextoInsert)
        }
        if examen.tag=="page" {
            categorie.examens.insert( Examen(intitule: "(image)", type:  .imagefilename ), atIndex: indextoInsert)
        }
        if examen.tag=="document" {
            categorie.examens.insert( ExamTree.Document.asExamen(), atIndex: indextoInsert)
        }
        if examen.tag=="clinique" {
            categorie.examens.insert( ExamTree.ExamenClinique.asExamen(), atIndex: indextoInsert)
        }
        if examen.tag=="connuClinique" {
            categorie.examens.insert( ExamTree.ConnuClinique.asExamen(), atIndex: indextoInsert)
        }
        if examen.tag=="libre" {
            categorie.examens.insert(Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre" ), atIndex: indextoInsert)
        }
        
        //tableView.sel
        
        
        tableView.reloadData()
        let rowToSelect:NSIndexPath = NSIndexPath(forRow: indextoInsert, inSection: 0)
        // NSIndexPath(
        self.tableView.selectRowAtIndexPath(rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.None)
        if examen.tag == "medecin" {
            self.performSegueWithIdentifier("selectionSegue", sender: self.tableView.cellForRowAtIndexPath(rowToSelect));
        } else if examen.tag != "libre" && examen.tag != "page" {
            
            self.performSegueWithIdentifier("autoshow", sender: self.tableView.cellForRowAtIndexPath(rowToSelect));
            
        }
        
    }
    func imageSelected(sender:UIView,image:UIImage, url:String) {
        let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("pluginFormID") as! pluginFormViewController
        _=svc.view
        svc.imageView.image=image
        svc.titreLabel.text="Document"
        
        
        
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
            
        }
        self.navigationController!.pushViewController(svc,animated: true)
        //tableView.reloadData()
    }
    func numberSelected(sender:selectNumberViewController, number:String) {
        ExamTaped!.value=number
        tableView.reloadData()
    }
    @IBAction func GoAccueil(sender: UIBarButtonItem) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers ;
        for aViewController in viewControllers {
            if(aViewController is patientTableViewController){
                self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
    }
    @IBAction func documentPageTap(sender: UITapGestureRecognizer) {
        let location : CGPoint = sender.locationInView(self.tableView)
        let indexPath:NSIndexPath? = self.tableView.indexPathForRowAtPoint(location)
        if indexPath == nil {return }
        ExamTaped = categorie.examens[indexPath!.row]
        
        if (ExamTaped!.type == .imagefilename ){
            //  image: loadImageFromPath(examen.value)! , url: examen.value)
            // performSegueWithIdentifier("autoshow", sender: self)
            //examensTableViewController
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("pluginFormID") as! pluginFormViewController
            _=svc.view
            svc.imageView.image = UIImage( contentsOfFile:fileInDocumentsDirectory(ExamTaped!.value))
            svc.titreLabel.text = categorie.examens[0].value
            
            
            //  svc.navigationController?.title = svc.categorie!.nom
            self.navigationController!.pushViewController(svc,animated: true)
            
        }
        
    }
    
    
    @IBAction func goPatient(sender: UIBarButtonItem) {
        self.navigationController!.popToViewController(DataSave.lastPatientVC!,animated: true)
    }
    @IBAction func apercuBarButtonAction(sender: UIBarButtonItem) {
        let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("rapportControlerID") as! rapportViewController
        svc.uneCategorie=self.categorie
        self.navigationController!.pushViewController(svc,animated: true)
    }
    func dateSelected(sender: UIViewController, text: String, date: NSDate) {
        
        ExamTaped!.value=text
        tableView.reloadData()
    }
    func nombreSelected(sender:SaisieNombreViewController, numberStr:String) {
        ExamTaped!.value=numberStr
        tableView.reloadData()
        
        
    }
    
    var ExamTaped:Examen?
    
    @IBOutlet var doubleTap: UITapGestureRecognizer!
    @IBOutlet var singleTap: UITapGestureRecognizer!
    @IBAction func editDidBegin(sender: UITextField) {
    }
    @IBAction func doubletapRepCourteAction(sender: UITapGestureRecognizer) {
        if tableView.editing {return}
        let location : CGPoint = sender.locationInView(self.tableView)
        let indexPath:NSIndexPath = self.tableView.indexPathForRowAtPoint(location)!
        ExamTaped = categorie.examens[indexPath.row]
        NSLog("Double tap sur \(ExamTaped?.intitule)")
        if ExamTaped!.intitule.containsString("Document") && ExamTaped!.type == .group {
            for ex in ExamTaped!.categorie!.examens where ex.type == .imagefilename {
                let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("pluginFormID") as! pluginFormViewController
                _=svc.view
                svc.imageView.image = UIImage( contentsOfFile: fileInDocumentsDirectory(ex.value))
                svc.titreLabel.text=categorie.UIString().stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
                // svc.descriptionLabel.text = categorie.detailString()
                // svc.delegate=self
                self.navigationController!.pushViewController(svc,animated: true)
                break
            }
        } else  if ExamTaped!.tag == "image" {
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("pluginFormID") as! pluginFormViewController
            _=svc.view
            svc.imageView.image = UIImage( contentsOfFile: fileInDocumentsDirectory(ExamTaped!.value))
            svc.titreLabel.text=categorie.UIString().stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
            
            // svc.descriptionLabel.text = categorie.detailString()
            // svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
        //    let aview = svc.view
        
        
        
        // EasyTipView.Pref
    }
    @IBAction func tapRepCourte(sender: UITapGestureRecognizer) {
        if tableView.editing {return}
        
        let location : CGPoint = sender.locationInView(self.tableView)
        let indexPath:NSIndexPath? = self.tableView.indexPathForRowAtPoint(location)
        if indexPath == nil {return }
        ExamTaped = categorie.examens[indexPath!.row]
        
        if (ExamTaped!.type == .group ){
            // performSegueWithIdentifier("autoshow", sender: self)
            //examensTableViewController
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("examensTVID") as! examensTableViewController
            //svc.delegate=self
            svc.categorie = ExamTaped!.categorie
            svc.navigationController?.title = svc.categorie!.nomUI()
            self.navigationController!.pushViewController(svc,animated: true)
            
        } else if (ExamTaped!.type == .selection ){
            if ExamTaped!.tag.isEmpty {return}
            let svc = self.storyboard?.instantiateViewControllerWithIdentifier("selectionViewID") as! selectionTexteTableViewController
            svc.textes = Donnees.selectiontextDict[ ExamTaped!.tag ]!
            examenSelected=ExamTaped
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
            return
        } else if (ExamTaped!.type == .datastr ){
            var dd:[String]=[]
            
            for t in Donnees.selectiontextDict[ExamTaped!.tag]! {
                dd.append(t)
            }
            dropdown.anchorView=self.navigationController?.view
            dropdown.bottomOffset = CGPoint(x: 0, y:(dropdown.anchorView?.plainView.bounds.height)!)
            dropdown.dataSource=dd
            //  dropdown.topOffset = CGPoint(x: 0, y:-sender.plainView.bounds.height)
            dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.ExamTaped!.value=item
                self.tableView.reloadData()
                //self.valueTextField.text=item
                
                
            }
            
            dropdown.show()

        }
        
        if ExamTaped?.type != .addinfo &&   ExamTaped?.type != .datastr && (Donnees.selectiontextDict.indexForKey((ExamTaped?.tag)!) != nil) {
            
            let svc = self.storyboard?.instantiateViewControllerWithIdentifier("selectionViewID") as! selectionTexteTableViewController
            svc.textes = Donnees.selectiontextDict[ ExamTaped!.tag ]!
            examenSelected=ExamTaped
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
            return
        }
        
        
        if ExamTaped!.tag == "date" {
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("dateDureeViewID") as! dateDureeViewController
            
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
        if ExamTaped!.tag == "pancarteView" {
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("pancartViewRef") as! pancarteViewController
            
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
             if ExamTaped!.tag == "poids" {
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("saisieNombreID") as! SaisieNombreViewController
            svc.minNumber=10
            svc.maxNumber=140
            svc.step=1
            svc.Information = "Poids (kg)"
            if ExamTaped!.value.isEmpty {
                svc.value="65"
            } else {
                svc.value=ExamTaped!.value
            }
            _ = svc.view
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
        if ExamTaped!.tag == "taille" {
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("saisieNombreID") as! SaisieNombreViewController
            svc.minNumber=145
            svc.maxNumber=210
            svc.step=1
            svc.Information = "Taille (cm)"
            if ExamTaped!.value.isEmpty {
                svc.value="165"
            } else {
                svc.value=ExamTaped!.value
            }
            _ = svc.view
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
        if ExamTaped!.tag == "age" {
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("saisieNombreID") as! SaisieNombreViewController
            svc.minNumber=2
            svc.maxNumber=100
            svc.step=1
            svc.Information = "Age (ans)"
            if ExamTaped!.value.isEmpty {
                svc.value="30"
            } else {
                svc.value=ExamTaped!.value
            }
            _ = svc.view
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
        if ExamTaped!.tag == "glasgow" {
            let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("saisieNombreID") as! SaisieNombreViewController
            svc.minNumber=3
            svc.maxNumber=16
            svc.step=1
            svc.Information = "Score de Glasgow"
            if ExamTaped!.value.isEmpty {
                svc.value="15"
            } else {
                svc.value=ExamTaped!.value
            }
            if ExamTaped!.tag == "image" {
                let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("pluginFormID") as! pluginFormViewController
                _=svc.view
                svc.imageView.image = UIImage( contentsOfFile:fileInDocumentsDirectory(ExamTaped!.value))
                svc.titreLabel.text = "" // categorie.examens[0].value
            }
            
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
        
    }
    override func viewDidLoad() {
        singleTap.requireGestureRecognizerToFail(doubleTap)
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //examen=Donnees.listeCategorie.categories.first!.examens
        if categorie != nil {     self.title=categorie!.nomUI() }
        
        // print(examen.count)
        registerForKeyboardNotifications()
        
        autoshowFirstGroup()
        
        
    }
    // MARK: Affiche le premier element du tabview si c'est type "selection"
    func autoshowFirstGroup () {
        if categorie == nil {return }
        if categorie.examens.count==0 { return }
        
        let aExam = categorie.examens[0]
        if !aExam.value.isEmpty { return }
        if aExam.intitule == "horodatage" || aExam.intitule == "timestamp"{
            
            let dateFormatter=NSDateFormatter()
            //dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            //dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
            // dateFormatter.locale = NSLocale.currentLocale()
            dateFormatter.dateFormat="dd/MM/yyyy - HH:mm"
            let strDate = dateFormatter.stringFromDate(NSDate())
            aExam.value=strDate
            
        }
        
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
        if (sender is examgroupTableViewCell &&  segue.identifier == "autoshow") {
            let svc = segue.destinationViewController as! examensTableViewController
            let mycell = (sender as! examgroupTableViewCell)
            svc.categorie = mycell.examen!.categorie!
            svc.navigationController?.title = svc.categorie!.nomUI()
            //  sender?.row
            //  svc.listePatients = Donnees.listePatient
            
        } else if (segue.identifier == "selectionSegue") {
            
            let svc = segue.destinationViewController as! selectionTexteTableViewController
            let mycell = (sender as! selectionTableViewCell)
            // let tab:[String]=(["Cholecystectomie","Appendicectomie","IDM"]).sort()
            examenSelected=mycell.examen
            svc.textes = Donnees.selectiontextDict[examenSelected!.tag]!
            svc.delegate=self
            
            //  sender?.row
            //  svc.listePatients = Donnees.listePatient
            
        } else {// if (segue.identifier == "selectionSegue") {
            print(segue.identifier)
            NSLog(segue.identifier!)
        }
        
        
    }
    func pancarteSelected(sender:pancarteViewController, pancarteStr:String) {
        if (ExamTaped != nil) {
            ExamTaped?.value=pancarteStr
        }
        tableView.reloadData()
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
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        doubleTap.delaysTouchesBegan = !editing
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
            if !examen1.tag.isEmpty {cell2.texteReponsecourte.textColor=UIColor.blueColor()}
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
        } else
            
            if examen1.type==Examen.ExamenEnum.group {
                let cell3 = tableView.dequeueReusableCellWithIdentifier("examgroup", forIndexPath: indexPath) as! examgroupTableViewCell
                cell3.intitule.text = categorieExamen.Categorie.removeHtml(examen1.intitule)
                cell3.examen=examen1
                if let namedImage = examen1.categorie?.namedImage
                {
                    cell3.monImage.image=UIImage(named: namedImage)
                }
                
                cell3.details.text=examen1.categorie?.UIString()
                cell3.intitule.hidden = !examen1.categorie!.showNom && !(cell3.details.text?.isEmpty)!
                return cell3
            } else
                if examen1.type==Examen.ExamenEnum.selection {
                    let cell3 = tableView.dequeueReusableCellWithIdentifier("selectionCell", forIndexPath: indexPath) as! selectionTableViewCell
                    
                    if examen1.value.isEmpty {
                        cell3.questionSelection.text = examen1.intitule
                        //cell3.questionSelection.enabled=false
                    } else {
                        cell3.questionSelection.text=examen1.value
                        // cell3.questionSelection.enabled=true
                    }
                    
                    cell3.examen=examen1
                    
                    
                    
                    return cell3
                } else if examen1.type==Examen.ExamenEnum.addinfo {
                    let cell3 = tableView.dequeueReusableCellWithIdentifier("addCell", forIndexPath: indexPath) as! AjoutInformationTableViewCell
                    cell3.delegate=self
                    //cell3.ajoutInfoBtn.titleLabel?.text="Ajouter \(examen1.tag)"
                    cell3.examen=examen1
                    return cell3
                } /*else if examen1.type == Examen.ExamenEnum.datastr {
                     
                     var dd:[String]=[]
                     
                     for t in Donnees.selectiontextDict[examen1.tag]! {
                     dd.append(t)
                     }
                     dropdown.anchorView=self.view
                     dropdown.dataSource=dd
                     //  dropdown.topOffset = CGPoint(x: 0, y:-sender.plainView.bounds.height)
                     dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                     examen1.value=item
                     self.tableView.reloadData()
                     
                     }
                     
                     dropdown.show()
                 }*/else if examen1.type == Examen.ExamenEnum.datastr || examen1.type == Examen.ExamenEnum.multirowdatastr {
                    let cell3 = tableView.dequeueReusableCellWithIdentifier("pickSelectCell", forIndexPath: indexPath) as! pickSelectTableViewCell
                    cell3.intituleLabel.text=examen1.intitule
                    cell3.valueTextField.text=examen1.value
                    cell3.intituleLabel.textColor=UIColor.redColor()
                    cell3.examen=examen1
                    return cell3
                } else if examen1.type == Examen.ExamenEnum.imagefilename {
                    
                    let cell3 = tableView.dequeueReusableCellWithIdentifier("imageSelectCell", forIndexPath: indexPath) as! imageSelectTableViewCell
                    if examen1.value.isEmpty {
                        cell3.imageLabel.text = "Aucun document"
                    } else {
                        cell3.imageLabel.text =  examen1.value
                        cell3.theImageView.image=UIImage(contentsOfFile: fileInDocumentsDirectory(examen1.value))
                    }
                    
                    cell3.delegate=self
                    cell3.examen=examen1
                    
                    
                    
                    
        }
        
        // Configure the cell...
        return cell
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        let examen1 = categorie.examens[indexPath.row]
        if examen1.type == Examen.ExamenEnum.addinfo {return false}
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //    super.tableView(<#T##tableView: UITableView##UITableView#>, commitEditingStyle: <#T##UITableViewCellEditingStyle#>, forRowAtIndexPath: <#T##NSIndexPath#>)
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            categorie.examens.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        if fromIndexPath == toIndexPath {return }
        
        swap(&categorie.examens[fromIndexPath.row],&categorie.examens[toIndexPath.row])
        
    }
    
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    
}
