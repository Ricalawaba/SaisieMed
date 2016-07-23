//
//  patientTableViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class patientTableViewController: UITableViewController,ajoutPatientDelegate {
    var longpushPatient = patients.patient()
    let backColors = RedColors()
    
    
    @IBOutlet weak var saveMenuItem: UIBarButtonItem!
    
    
    @IBOutlet weak var configMenuItem: UIBarButtonItem!
    
    @IBAction func ajoutPatientButtonAction(sender: UIBarButtonItem) {
        performSegueWithIdentifier("ajoutPatient", sender: self)
    }
    @IBAction func refreshButtonAction(sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    
    @IBAction func showRapport(sender: UILongPressGestureRecognizer) {
        if tableView.editing {return}
        let location : CGPoint = sender.locationInView(self.tableView)
        let swipedIndexPath:NSIndexPath = self.tableView.indexPathForRowAtPoint(location)!
        //let swipedcell:patientTableViewCell = self.tableView.cellForRowAtIndexPath(swipedIndexPath)!
        //do your stuff here
        longpushPatient = Donnees.listePatient.patients[swipedIndexPath.row]
        performSegueWithIdentifier("showrapportSegue", sender: self)
    }
    
    @IBAction func savePatients(sender: UIBarButtonItem) {
       // UIApplication.sharedApplication().dele
        DataSave.saveDataFiles()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
       // self.tableView.registerClass(patientTableViewCell.self, forCellReuseIdentifier: "MenuCell")

        self.tableView.remembersLastFocusedIndexPath=true
        configMenuItem.title = "\u{2699}\u{0000FE0E}"
        
        
    }
    private var havepatient: Bool = false
    func patientAdded(sender: AjoutPatientViewController, patient: patients.patient) {
        Donnees.listePatient.patients.append(patient)
         tableView.reloadData()
        havepatient=true
        
    }
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        if havepatient {
            let rowToSelect:NSIndexPath = NSIndexPath(forRow: Donnees.listePatient.patients.count-1, inSection: 0)
            // NSIndexPath(
            self.tableView.selectRowAtIndexPath(rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.Middle)
            havepatient=false
            //self.tableView(self.tableView, didSelectRowAtIndexPath: rowToSelect)
            self.performSegueWithIdentifier("showsaisie", sender: self.tableView.cellForRowAtIndexPath(rowToSelect));
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
     
        if (segue.identifier == "ajoutPatient") {
            let svc = segue.destinationViewController as! AjoutPatientViewController
             svc.delegate=self
            //  svc.listePatients = Donnees.listePatient
            
        }
        if (segue.identifier == "showsaisie") {
                
                let svc = segue.destinationViewController as! saisieTableViewController
                let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)
                svc.patient = Donnees.listePatient.patients[selectedIndex!.row]
                svc.title=svc.patient!.nomPrenom
                DataSave.lastPatientVC = svc
                //svc.
          //  print("\(), \(), row \(selectedIndex!.row)")
                //  sender?.row
                //  svc.listePatients = Donnees.listePatient
                
            }
        if segue.identifier == "showrapportSegue" {
            let svc = segue.destinationViewController as! rapportViewController
            
                       svc.patient = longpushPatient
            
        }

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Donnees.listePatient.patients.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! patientTableViewCell

        // Configure the cell...
        let patient = Donnees.listePatient.patients[indexPath.row]
        cell.localisation?.text = "\(patient.localisation) , \(patient.waitingStr)"
        cell.nomage?.text = "\(patient.nomPrenom) , \(patient.age) ans"
        cell.motif?.text = "\(patient.motif) [\(patient.DetailedString().characters.count)]"
        var imagesymbol: UIImage
        if patient.masculin {
             imagesymbol = UIImage(named:  "tete_icon.png")!
        } else
        {
            imagesymbol = UIImage(named:  "gyneco_icon.png")!
        }
        
        cell.imageSex.image=imagesymbol
        switch patient.DetailedString().characters.count {
        case 0..<300:
            cell.image2.backgroundColor = backColors.colors[9]
        case 300..<500:
            cell.image2.backgroundColor =  backColors.colors[8]
        case 500..<700:
            cell.image2.backgroundColor =  backColors.colors[7]

        case 700..<900:
            cell.image2.backgroundColor =  backColors.colors[6]

        case 900..<1100:
            cell.image2.backgroundColor =  backColors.colors[5]

        case 1100..<1400:
            cell.image2.backgroundColor =  backColors.colors[4]

        case 1400..<1600:
            cell.image2.backgroundColor =  backColors.colors[3]

        case 1600..<1800:
            cell.image2.backgroundColor =  backColors.colors[2]

        case 1800..<2000:
            cell.image2.backgroundColor =  backColors.colors[1]
        case 2000..<2200:
            cell.image2.backgroundColor =  backColors.colors[1]

        default:
            cell.image2.backgroundColor = UIColor.greenColor()
        }
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            Donnees.listePatient.patients.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        if fromIndexPath.row == toIndexPath.row {return }
        swap(&Donnees.listePatient.patients[fromIndexPath.row],&Donnees.listePatient.patients[toIndexPath.row])
        
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
