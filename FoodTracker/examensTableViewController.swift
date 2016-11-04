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
    @IBAction func ajouterChampLibre(_ sender: UIBarButtonItem) {
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
            let exam : Examen? = ExamTree.getExam(item)
            //      if let exam=
            if exam != nil {
                self.categorie.examens.append(exam!)
                
            }
            else {print("erreur examen non reconnu : \"\(item)\"");return}
            
            //                 let netExam=Examen(intitule: exam.intitule, type: exam.type)
            //                self.categorie.examens.append(self.categorie.subitems![item]!)
            
            self.tableView.reloadData()
            
            let rowToSelect:IndexPath = IndexPath(row: self.categorie.examens.count-1, section: 0)
            // NSIndexPath(
            self.tableView.selectRow(at: rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.bottom)
            // self.performSegueWithIdentifier("autoshow", sender: self.tableView.cellForRowAtIndexPath(rowToSelect));
            self.tableView.scrollToRow(at: rowToSelect, at: UITableViewScrollPosition.middle, animated: true)
            if exam!.categorie==nil {
                self.tableView.reloadData();
                
                return}
            self.performSegue(withIdentifier: "autoshow", sender: self.tableView.cellForRow(at: rowToSelect));
            self.tableView.reloadData()
            
        }
        
        _=dropdown.show()
        
        // categorie.examens.append(ExamTree.libre)
        
    }
    @IBAction func refreshButtonAction(_ sender: UIBarButtonItem) {
        tableView.reloadData()
        
    }
    
    var activeField: UITextField?
    func ajoutInformation(_ sender:AjoutInformationTableViewCell, examen: Examen) {
        let indextoInsert = categorie.examens.index(of: examen)!
        
        if examen.tag=="dupliquer" {
            let prevExamen=categorie.examens[indextoInsert-1]
            if prevExamen.intitule.contains("Main") {
                categorie.examens.insert(Examen(categorie: ExamTree.Main), at: indextoInsert)
            } else if prevExamen.intitule.contains("Doigt") {
                categorie.examens.insert(Examen(categorie: ExamTree.Doigt), at: indextoInsert)
            } else if prevExamen.intitule.contains("Hanche") {
                categorie.examens.insert(Examen(categorie: ExamTree.Hanche), at: indextoInsert)
            } else if prevExamen.intitule.contains("Coude") {
                categorie.examens.insert(Examen(categorie: ExamTree.Coude), at: indextoInsert)
            } else if prevExamen.intitule.contains("Genou") {
                categorie.examens.insert(Examen(categorie: ExamTree.Genou), at: indextoInsert)
            } else if prevExamen.intitule.contains("Epaule") {
                categorie.examens.insert(Examen(categorie: ExamTree.Epaule), at: indextoInsert)
            } else if prevExamen.intitule.contains("Cheville") {
                categorie.examens.insert(Examen(categorie: ExamTree.Cheville), at: indextoInsert)
            }
        }
        if examen.tag=="atcd" {
            categorie.examens.insert(Examen(categorie: ExamTree.atcd), at: indextoInsert)
        }
        if examen.tag=="TTT" {
            categorie.examens.insert(Examen(categorie: ExamTree.TTT), at: indextoInsert)
        }
        if examen.tag=="Plainte" {
            categorie.examens.insert(Examen(categorie: ExamTree.Plainte), at: indextoInsert)
        }
        if examen.tag=="motif" {
            categorie.examens.insert(Examen(categorie: ExamTree.motif), at: indextoInsert)
        }
        if examen.tag=="medecin" {
            categorie.examens.insert( Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"), at: indextoInsert)
        }
        if examen.tag=="pancarteV" {
            categorie.examens.insert(Examen(intitule: "<br>Pancarte", type: .donnee,tag: "pancarteView" ), at: indextoInsert)
            tableView.reloadData()
            return
        }
        if examen.tag=="evenementSuivi" {
            categorie.examens.insert( ExamTree.evenement.asExamen(), at: indextoInsert)
        }
        
        if examen.tag=="radiologie" {
            categorie.examens.insert( ExamTree.Imagerie.asExamen(), at: indextoInsert)
        }
        if examen.tag=="page" {
            categorie.examens.insert( Examen(intitule: "(image)", type:  .imagefilename ), at: indextoInsert)
        }
        if examen.tag=="document" {
            categorie.examens.insert( ExamTree.Document.asExamen(), at: indextoInsert)
        }
        if examen.tag=="clinique" {
            categorie.examens.insert( ExamTree.ExamenClinique.asExamen(), at: indextoInsert)
        }
        if examen.tag=="connuClinique" {
            categorie.examens.insert( ExamTree.ConnuClinique.asExamen(), at: indextoInsert)
        }
        if examen.tag=="libre" {
            categorie.examens.insert(Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre" ), at: indextoInsert)
        }
        
        //tableView.sel
        
        
        tableView.reloadData()
        let rowToSelect:IndexPath = IndexPath(row: indextoInsert, section: 0)
        // NSIndexPath(
        self.tableView.selectRow(at: rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.none)
        if examen.tag == "medecin" {
            self.performSegue(withIdentifier: "selectionSegue", sender: self.tableView.cellForRow(at: rowToSelect));
        } else if examen.tag != "libre" && examen.tag != "page" {
            
            self.performSegue(withIdentifier: "autoshow", sender: self.tableView.cellForRow(at: rowToSelect));
            
        }
        
    }
    func imageSelected(_ sender:UIView,image:UIImage, url:String) {
        let svc =  self.storyboard?.instantiateViewController(withIdentifier: "pluginFormID") as! pluginFormViewController
        _=svc.view
        svc.imageView.image=image
        svc.titreLabel.text="Document"
        
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
        self.navigationController!.pushViewController(svc,animated: true)
        //tableView.reloadData()
    }
    func numberSelected(_ sender:selectNumberViewController, number:String) {
        ExamTaped!.value=number
        tableView.reloadData()
    }
    @IBAction func GoAccueil(_ sender: UIBarButtonItem) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers ;
        for aViewController in viewControllers {
            if(aViewController is patientTableViewController){
                self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
    }
    @IBAction func documentPageTap(_ sender: UITapGestureRecognizer) {
        let location : CGPoint = sender.location(in: self.tableView)
        let indexPath:IndexPath? = self.tableView.indexPathForRow(at: location)
        if indexPath == nil {return }
        ExamTaped = categorie.examens[(indexPath! as NSIndexPath).row]
        
        if (ExamTaped!.type == .imagefilename ){
            //  image: loadImageFromPath(examen.value)! , url: examen.value)
            // performSegueWithIdentifier("autoshow", sender: self)
            //examensTableViewController
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "pluginFormID") as! pluginFormViewController
            _=svc.view
            svc.imageView.image = UIImage( contentsOfFile:fileInDocumentsDirectory(ExamTaped!.value))
            svc.titreLabel.text = categorie.examens[0].value
            
            
            //  svc.navigationController?.title = svc.categorie!.nom
            self.navigationController!.pushViewController(svc,animated: true)
            
        }
        
    }
    
    
    @IBAction func goPatient(_ sender: UIBarButtonItem) {
        self.navigationController!.popToViewController(DataSave.lastPatientVC!,animated: true)
    }
    @IBAction func apercuBarButtonAction(_ sender: UIBarButtonItem) {
        let svc =  self.storyboard?.instantiateViewController(withIdentifier: "rapportControlerID") as! rapportViewController
        svc.uneCategorie=self.categorie
        self.navigationController!.pushViewController(svc,animated: true)
    }
    func dateSelected(_ sender: UIViewController, text: String, date: Date) {
        
        ExamTaped!.value=text
        tableView.reloadData()
    }
    func nombreSelected(_ sender:SaisieNombreViewController, numberStr:String) {
        ExamTaped!.value=numberStr
        tableView.reloadData()
        
        
    }
    
    var ExamTaped:Examen?
    
    @IBOutlet var doubleTap: UITapGestureRecognizer!
    @IBOutlet var singleTap: UITapGestureRecognizer!
    @IBAction func editDidBegin(_ sender: UITextField) {
    }
    @IBAction func doubletapRepCourteAction(_ sender: UITapGestureRecognizer) {
        if tableView.isEditing {return}
        let location : CGPoint = sender.location(in: self.tableView)
        let indexPath:IndexPath = self.tableView.indexPathForRow(at: location)!
        ExamTaped = categorie.examens[(indexPath as NSIndexPath).row]
        NSLog("Double tap sur \(ExamTaped?.intitule)")
        if ExamTaped!.intitule.contains("Document") && ExamTaped!.type == .group {
            for ex in ExamTaped!.categorie!.examens where ex.type == .imagefilename {
                let svc =  self.storyboard?.instantiateViewController(withIdentifier: "pluginFormID") as! pluginFormViewController
                _=svc.view
                svc.imageView.image = UIImage( contentsOfFile: fileInDocumentsDirectory(ex.value))
                svc.titreLabel.text=categorie.UIString().replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                // svc.descriptionLabel.text = categorie.detailString()
                // svc.delegate=self
                self.navigationController!.pushViewController(svc,animated: true)
                break
            }
        } else  if ExamTaped!.tag == "image" {
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "pluginFormID") as! pluginFormViewController
            _=svc.view
            svc.imageView.image = UIImage( contentsOfFile: fileInDocumentsDirectory(ExamTaped!.value))
            svc.titreLabel.text=categorie.UIString().replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            
            // svc.descriptionLabel.text = categorie.detailString()
            // svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
        //    let aview = svc.view
        
        
        
        // EasyTipView.Pref
    }
    @IBAction func tapRepCourte(_ sender: UITapGestureRecognizer) {
        if tableView.isEditing {return}
        
        let location : CGPoint = sender.location(in: self.tableView)
        let indexPath:IndexPath? = self.tableView.indexPathForRow(at: location)
        if indexPath == nil {return }
        ExamTaped = categorie.examens[(indexPath! as NSIndexPath).row]
        if (ExamTaped!.type == Examen.ExamenEnum.documentinfo) {
           
                let svc =  self.storyboard?.instantiateViewController(withIdentifier: "documentViewID") as! imageDocumentViewController
            _=svc.view
            svc.imageMapped=MappedImage(contentsOfFile: ExamTaped!.value)
            svc.delegate=self
//            for reg in svc.imageMapped!.regionsMain {
//                // TODO: Non implémenté
//            }
            
            if let img = UIImage(named: ExamTaped!.value) {
                  svc.imageView.image = img
               // print(img.description)
                
            } else {print (ExamTaped!.value," not found") }
            //  =UIImage(named: (ExamTaped?.value)!)
            
                self.navigationController!.pushViewController(svc,animated: true)
            return
        }
        if (ExamTaped!.type == .group ){
            // performSegueWithIdentifier("autoshow", sender: self)
            //examensTableViewController
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "examensTVID") as! examensTableViewController
            //svc.delegate=self
            svc.categorie = ExamTaped!.categorie
            svc.navigationController?.title = svc.categorie!.nomUI()
            self.navigationController!.pushViewController(svc,animated: true)
            
        } else if (ExamTaped!.type == .selection ){
            if ExamTaped!.tag.isEmpty {return}
            let svc = self.storyboard?.instantiateViewController(withIdentifier: "selectionViewID") as! selectionTexteTableViewController
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
            dropdown.anchorView=self.view
                //self.editButtonItem()
           // dropdown.bottomOffset = CGPoint(x: 0, y:(dropdown.anchorView?.plainView.bounds.height)!)
            dropdown.dataSource=dd
            //  dropdown.topOffset = CGPoint(x: 0, y:-sender.plainView.bounds.height)
            dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.ExamTaped!.value=item
                self.tableView.reloadData()
                //self.valueTextField.text=item
                
                
            }
            
            _=dropdown.show()

        }
        
        if ExamTaped?.type != .addinfo &&   ExamTaped?.type != .datastr && (Donnees.selectiontextDict.index(forKey: (ExamTaped?.tag)!) != nil) {
            
            let svc = self.storyboard?.instantiateViewController(withIdentifier: "selectionViewID") as! selectionTexteTableViewController
            svc.textes = Donnees.selectiontextDict[ ExamTaped!.tag ]!
            examenSelected=ExamTaped
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
            return
        }
        
        
        if ExamTaped!.tag == "date" {
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "dateDureeViewID") as! dateDureeViewController
            
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
        if ExamTaped!.tag == "pancarteView" {
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "pancartViewRef") as! pancarteViewController
            
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
             if ExamTaped!.tag == "poids" {
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "saisieNombreID") as! SaisieNombreViewController
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
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "saisieNombreID") as! SaisieNombreViewController
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
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "saisieNombreID") as! SaisieNombreViewController
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
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "saisieNombreID") as! SaisieNombreViewController
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
                let svc =  self.storyboard?.instantiateViewController(withIdentifier: "pluginFormID") as! pluginFormViewController
                _=svc.view
                svc.imageView.image = UIImage( contentsOfFile:fileInDocumentsDirectory(ExamTaped!.value))
                svc.titreLabel.text = "" // categorie.examens[0].value
            }
            
            svc.delegate=self
            self.navigationController!.pushViewController(svc,animated: true)
        }
        
    }
    override func viewDidLoad() {
        singleTap.require(toFail: doubleTap)
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
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
            
            let dateFormatter=DateFormatter()
            //dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            //dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
            // dateFormatter.locale = NSLocale.currentLocale()
            dateFormatter.dateFormat="dd/MM/yyyy - HH:mm"
            let strDate = dateFormatter.string(from: Date())
            aExam.value=strDate
            
        }
        
        if aExam.type == .selection {
            let svc =  self.storyboard?.instantiateViewController(withIdentifier: "selectionViewID") as! selectionTexteTableViewController
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeField = nil
    }
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(examensTableViewController.keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(examensTableViewController.keyboardWillBeHidden(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(_ aNotification: Notification) {
        if activeField == nil {return}
        let info = (aNotification as NSNotification).userInfo as! [String: AnyObject],
        kbSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size,
        contentInsets = UIEdgeInsets(top: 90, left: 0, bottom: kbSize.height, right: 0)
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets
        
        // If active text field is hidden by keyboard, scroll it so it's visible
        // Your app might not need or want this behavior.
        var aRect = self.view.frame
        aRect.size.height -= kbSize.height
        
        if !aRect.contains(activeField!.frame.origin) {
            
            
            self.tableView.scrollRectToVisible(activeField!.frame, animated: true)
        }
    }
    
    func keyboardWillBeHidden(_ aNotification: Notification) {
        if activeField == nil {return}
        let contentInsets = UIEdgeInsets.zero
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets
    }
    // MARK: - Table view data source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender is examgroupTableViewCell &&  segue.identifier == "autoshow") {
            let svc = segue.destination as! examensTableViewController
            let mycell = (sender as! examgroupTableViewCell)
            svc.categorie = mycell.examen!.categorie!
            svc.navigationController?.title = svc.categorie!.nomUI()
            //  sender?.row
            //  svc.listePatients = Donnees.listePatient
            
        } else if (segue.identifier == "selectionSegue") {
            
            let svc = segue.destination as! selectionTexteTableViewController
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
    func pancarteSelected(_ sender:pancarteViewController, pancarteStr:String) {
        if (ExamTaped != nil) {
            ExamTaped?.value=pancarteStr
        }
        tableView.reloadData()
    }
    
    // MARK: Retour selection texte
    func textSelected(_ sender:selectionTexteTableViewController, text:String) {
        if (examenSelected != nil) {
            if  Donnees.selectiontextDict[examenSelected!.tag]!.index(of: text) == nil {
                Donnees.selectiontextDict[examenSelected!.tag]!.append(String(text))
                Donnees.selectiontextDict[examenSelected!.tag] = Donnees.selectiontextDict[examenSelected!.tag]?.sorted()
            }
            
            examenSelected?.value=text
        }
        
        tableView.reloadData()
    }
    // MARK: Suppression selection texte
    func textDeleted(_ sender: selectionTexteTableViewController, text: String) {
        if (examenSelected != nil) {
            if Donnees.selectiontextDict[examenSelected!.tag]!.index(of: text) != nil{
                Donnees.selectiontextDict[examenSelected!.tag]!.remove(at: Donnees.selectiontextDict[examenSelected!.tag]!.index(of: text)!)
            }
        }
    }
    // MARK: Tableview datasource et delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categorie.examens.count
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        doubleTap.delaysTouchesBegan = !editing
    }
    @IBAction func EnregistrerModif(_ sender: UIBarButtonItem) {
        
        
        _=self.navigationController?.popViewController(animated: true)
        /* let parent = self.parentViewController as! saisieTableViewController
         parent.tableView.reloadData()*/
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let examen1 = categorie.examens[(indexPath as NSIndexPath).row]
        
        //var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("reponsecourteCell", forIndexPath: indexPath) as! reponsecourteTableViewCell
        //cell.textequestion
        let cell = UITableViewCell()
        if examen1.type==Examen.ExamenEnum.reponsecourte || examen1.type==Examen.ExamenEnum.donnee{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "reponsecourteCell", for: indexPath) as! reponsecourteTableViewCell
            cell2.texteReponsecourte.text=categorieExamen.Categorie.removeHtml(examen1.intitule )
            if !examen1.tag.isEmpty {cell2.texteReponsecourte.textColor=UIColor.blue}
            if examen1.value != "" {
                cell2.valeurReponseCourte.text = categorieExamen.Categorie.removeHtml(examen1.value)
            }
            cell2.examen=examen1
            cell2.valeurReponseCourte.delegate=self
            return cell2
        } else
            if examen1.type==Examen.ExamenEnum.ouinon {
                let cell3 = tableView.dequeueReusableCell(withIdentifier: "questionOuiNonCell", for: indexPath) as! questionOuiNonTableViewCell
                cell3.texteQuestion.text = categorieExamen.Categorie.removeHtml(examen1.intitule)
                cell3.texteQuestion.isEnabled=true
                if examen1.value == "0" {
                    cell3.reponseSegmentedControl.selectedSegmentIndex=0
                } else if examen1.value == "1" {
                    cell3.reponseSegmentedControl.selectedSegmentIndex=1
                    
                }else if examen1.value == "" {
                    cell3.texteQuestion.isEnabled=false
                }
                cell3.examen=examen1
                return cell3
        }
        if examen1.type==Examen.ExamenEnum.check {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "checkCell", for: indexPath) as! checkTableViewCell
            cell3.questionCheckLabel.text = categorieExamen.Categorie.removeHtml(examen1.intitule)
            if examen1.value == "0" {
                cell3.questionCheckLabel.isEnabled=true
                cell3.checkSegment.selectedSegmentIndex=0
            } else  {
                cell3.questionCheckLabel.isEnabled=false
                cell3.checkSegment.selectedSegmentIndex=1
                
            }
            cell3.examen=examen1
            return cell3
        } else
            
            if examen1.type==Examen.ExamenEnum.group {
                let cell3 = tableView.dequeueReusableCell(withIdentifier: "examgroup", for: indexPath) as! examgroupTableViewCell
                cell3.intitule.text = categorieExamen.Categorie.removeHtml(examen1.intitule)
                cell3.examen=examen1
                if let namedImage = examen1.categorie?.namedImage
                {
                    cell3.monImage.image=UIImage(named: namedImage)
                }
                
                cell3.details.text=examen1.categorie?.UIString()
                cell3.intitule.isHidden = !examen1.categorie!.showNom && !(cell3.details.text?.isEmpty)!
                return cell3
            } else
                if examen1.type==Examen.ExamenEnum.selection {
                    let cell3 = tableView.dequeueReusableCell(withIdentifier: "selectionCell", for: indexPath) as! selectionTableViewCell
                    
                    if examen1.value.isEmpty {
                        cell3.questionSelection.text = categorieExamen.Categorie.removeHtml(examen1.intitule)
                        //cell3.questionSelection.enabled=false
                    } else {
                        cell3.questionSelection.text=examen1.value
                        // cell3.questionSelection.enabled=true
                    }
                    
                    cell3.examen=examen1
                    
                    
                    
                    return cell3
                } else if examen1.type==Examen.ExamenEnum.addinfo {
                    let cell3 = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath) as! AjoutInformationTableViewCell
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
                    let cell3 = tableView.dequeueReusableCell(withIdentifier: "pickSelectCell", for: indexPath) as! pickSelectTableViewCell
                    cell3.intituleLabel.text=categorieExamen.Categorie.removeHtml(examen1.intitule)
                    cell3.valueTextField.text=examen1.value
                    cell3.intituleLabel.textColor=UIColor.red
                    cell3.examen=examen1
                    return cell3
                } else if examen1.type == Examen.ExamenEnum.imagefilename {
                    
                    let cell3 = tableView.dequeueReusableCell(withIdentifier: "imageSelectCell", for: indexPath) as! imageSelectTableViewCell
                    if examen1.value.isEmpty {
                        cell3.imageLabel.text = "Aucun document"
                    } else {
                        cell3.imageLabel.text =  categorieExamen.Categorie.removeHtml(examen1.value)
                        cell3.theImageView.image=UIImage(contentsOfFile: fileInDocumentsDirectory(examen1.value))
                    }
                    
                    cell3.delegate=self
                    cell3.examen=examen1
                    return cell3
        } else if  examen1.type == Examen.ExamenEnum.documentinfo{
                        let cell3 = tableView.dequeueReusableCell(withIdentifier: "imageDocumentCell", for: indexPath) as! imageDocumentTableViewCell
                    cell3.examen=examen1
                    return cell3
                    
        }
        
        // Configure the cell...
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        let examen1 = categorie.examens[(indexPath as NSIndexPath).row]
        if examen1.type == Examen.ExamenEnum.addinfo {return false}
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //    super.tableView(<#T##tableView: UITableView##UITableView#>, commitEditingStyle: <#T##UITableViewCellEditingStyle#>, forRowAtIndexPath: <#T##NSIndexPath#>)
        if editingStyle == .delete {
            
            // Delete the row from the data source
            categorie.examens.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        if fromIndexPath == toIndexPath {return }
        
        swap(&categorie.examens[(fromIndexPath as NSIndexPath).row],&categorie.examens[(toIndexPath as NSIndexPath).row])
        
    }
    
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    
}
extension examensTableViewController : mappedImageDelegate {
    func regionSelected(_ sender:imageDocumentViewController,mapImg:MappedImage,region: MappedImage.region) {
        
    }
    //func actionSelected(sender:MappedImage,region:MappedImage.region,action:String)
    func selectionDone(_ sender:imageDocumentViewController,mapImg:MappedImage,fulltext:String) {
        let ex=ExamTree.libre
        ex.value=fulltext
        for exDoc:Examen in categorie.examens where exDoc.value==mapImg.loadedFromPathfilename {
             let insertAfter=categorie.examens.index(of: exDoc)
            categorie.examens.insert(ex, at: insertAfter!)
        }
       
       
      //  categorie.examens.append(ex)
        tableView.reloadData()
    }
    func zoneAdded(_ sender:imageDocumentViewController,mapImg:MappedImage,region:MappedImage.region) {
        
    }
}
