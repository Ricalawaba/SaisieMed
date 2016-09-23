//
//  saisieTableViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
import DropDown
class saisieTableViewController: UITableViewController {
    
    var patient : patients.patient? {
        didSet {
            Donnees.patientEnCours=patient
            print(patient?.nomPrenom)
            
        }
    }
    var dropdown = DropDown()
    @IBAction func compteRenduAction(_ sender: UIBarButtonItem) {
         let svc =  self.storyboard?.instantiateViewController(withIdentifier: "rapportControlerID") as! rapportViewController
        svc.patient=self.patient!
        self.navigationController!.pushViewController(svc,animated: true)
    }
    
    @IBAction func saveTabBarButtonAction(_ sender: UIBarButtonItem) {
        DataSave.saveDataFiles()
        //sender.enabled=false
        
    }
    
    @IBOutlet weak var ajoutExamBarButton: UIBarButtonItem!
    @IBAction func ajoutExamButtonAction(_ sender: AnyObject) {
        dropdown.anchorView=ajoutExamBarButton
        dropdown.dataSource=["Documents","Evenement","Examen Clinique","Alarmes.."]
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            switch index {
            case 0:
                let exam=ExamTree.Document.asExamen()
                self.patient!.documentsCat.examens.append(exam)
                let svc =  self.storyboard?.instantiateViewController(withIdentifier: "examensTVID") as! examensTableViewController
                svc.categorie = exam.categorie
                svc.navigationController?.title = svc.categorie!.nomUI()
                self.navigationController!.pushViewController(svc,animated: true)
               // self.patient.examenCliniqueCat.examens.append(ExamTree.Neurologie.asExamen())
            case 1:
                let exam = ExamTree.evenement.asExamen()
                self.patient!.suiviCat.examens.append(exam)
                let svc =  self.storyboard?.instantiateViewController(withIdentifier: "examensTVID") as! examensTableViewController
                svc.categorie = exam.categorie
                svc.navigationController?.title = svc.categorie!.nomUI()
                self.navigationController!.pushViewController(svc,animated: true)
            case 2:
                let exam = ExamTree.ExamenClinique.asExamen()
                self.patient!.suiviCat.examens.append(exam)
                let svc =  self.storyboard?.instantiateViewController(withIdentifier: "examensTVID") as! examensTableViewController
                svc.categorie = exam.categorie
                svc.navigationController?.title = svc.categorie!.nomUI()
                self.navigationController!.pushViewController(svc,animated: true)

           
            default:
                break
            }
        }
        
        dropdown.show()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //self.tableView.registerClass(patientTableViewCell.self, forCellReuseIdentifier: "CategorieExamen")
    }
    var rapportCat: categorieExamen.Categorie?
    
    @IBAction func LongPush(_ sender: UILongPressGestureRecognizer) {
        let location : CGPoint = sender.location(in: self.tableView)
        let swipedIndexPath:IndexPath = self.tableView.indexPathForRow(at: location)!
        rapportCat = patient!.examen.categories[(swipedIndexPath as NSIndexPath).row]
        //let swipedcell:patientTableViewCell = self.tableView.cellForRowAtIndexPath(swipedIndexPath)!
        //do your stuff here
//        longpushPatient = Donnees.listePatient.patients[swipedIndexPath.row]
//        performSegueWithIdentifier("showrapportSegue", sender: self)
//
        let svc =  self.storyboard?.instantiateViewController(withIdentifier: "rapportControlerID") as! rapportViewController
        svc.uneCategorie=rapportCat

        
        //self.presentViewController(svc, animated: true, completion: nil)
        self.navigationController!.pushViewController(svc,animated: true)

        
        //print("refresh long push")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //DataSave.lastPatientVC=segue.de
        if (segue.identifier == "showexamen") {
            
            let svc = segue.destination as! examensTableViewController
            let selectedIndex = self.tableView.indexPath(for: sender as! UITableViewCell)
            svc.categorie = patient!.examen.categories[(selectedIndex! as NSIndexPath).row]
            svc.navigationController?.title = svc.categorie!.nom
           
            
            //  sender?.row
            //  svc.listePatients = Donnees.listePatient
            
        }

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return patient!.examen.categories.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategorieExamen", for: indexPath) as! saisieTableViewCell

        // Configure the cell...
        let categorie=patient!.examen.categories[(indexPath as NSIndexPath).row]
        cell.imageCategorie.image = UIImage(named: categorie.namedImage)
        cell.nomCategorie.text = categorie.nomUI()
        
        cell.detailCategorie.text = categorie.UIString()
        if categorie.subitems.count==0 {
//            switch categorie.nomUI() {
//            case <#pattern#>:
//                <#code#>
//            default:
//                <#code#>
//            }
      }
        cell.tag=(indexPath as NSIndexPath).row
        return cell
    }
    

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

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
