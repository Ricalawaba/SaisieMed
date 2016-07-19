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
    
    var patient = patients.patient()
    var dropdown = DropDown()
    @IBAction func compteRenduAction(sender: UIBarButtonItem) {
         let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("rapportControlerID") as! rapportViewController
        svc.patient=self.patient
        self.navigationController!.pushViewController(svc,animated: true)
    }
    
    @IBAction func saveTabBarButtonAction(sender: UIBarButtonItem) {
        DataSave.saveDataFiles()
        //sender.enabled=false
        
    }
    
    @IBOutlet weak var ajoutExamBarButton: UIBarButtonItem!
    @IBAction func ajoutExamButtonAction(sender: AnyObject) {
        dropdown.anchorView=ajoutExamBarButton
        dropdown.dataSource=["Documents","Evenement","Examen Clinique","Alarmes.."]
        dropdown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            switch index {
            case 0:
                let exam=ExamTree.Document.asExamen()
                self.patient.documentsCat.examens.append(exam)
                let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("examensTVID") as! examensTableViewController
                svc.categorie = exam.categorie
                svc.navigationController?.title = svc.categorie!.nomUI()
                self.navigationController!.pushViewController(svc,animated: true)
               // self.patient.examenCliniqueCat.examens.append(ExamTree.Neurologie.asExamen())
            case 1:
                let exam = ExamTree.evenement.asExamen()
                self.patient.suiviCat.examens.append(exam)
                let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("examensTVID") as! examensTableViewController
                svc.categorie = exam.categorie
                svc.navigationController?.title = svc.categorie!.nomUI()
                self.navigationController!.pushViewController(svc,animated: true)
            case 2:
                let exam = ExamTree.ExamenClinique.asExamen()
                self.patient.suiviCat.examens.append(exam)
                let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("examensTVID") as! examensTableViewController
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
    
    @IBAction func LongPush(sender: UILongPressGestureRecognizer) {
        let location : CGPoint = sender.locationInView(self.tableView)
        let swipedIndexPath:NSIndexPath = self.tableView.indexPathForRowAtPoint(location)!
        rapportCat = patient.examen.categories[swipedIndexPath.row]
        //let swipedcell:patientTableViewCell = self.tableView.cellForRowAtIndexPath(swipedIndexPath)!
        //do your stuff here
//        longpushPatient = Donnees.listePatient.patients[swipedIndexPath.row]
//        performSegueWithIdentifier("showrapportSegue", sender: self)
//
        let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("rapportControlerID") as! rapportViewController
        svc.uneCategorie=rapportCat

        
        //self.presentViewController(svc, animated: true, completion: nil)
        self.navigationController!.pushViewController(svc,animated: true)

        
        //print("refresh long push")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         //DataSave.lastPatientVC=segue.de
        if (segue.identifier == "showexamen") {
            
            let svc = segue.destinationViewController as! examensTableViewController
            let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)
            svc.categorie = patient.examen.categories[selectedIndex!.row]
            svc.navigationController?.title = svc.categorie!.nom
           
            
            //  sender?.row
            //  svc.listePatients = Donnees.listePatient
            
        }

    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return patient.examen.categories.count
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CategorieExamen", forIndexPath: indexPath) as! saisieTableViewCell

        // Configure the cell...
        let categorie=patient.examen.categories[indexPath.row]
        cell.imageCategorie.image = UIImage(named: categorie.namedImage)
        cell.nomCategorie.text = categorie.nomUI()
        
        cell.detailCategorie.text = categorie.UIString()
        cell.tag=indexPath.row
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
