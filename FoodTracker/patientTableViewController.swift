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
    
    @IBAction func ajoutPatientButtonAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ajoutPatient", sender: self)
    }
    @IBAction func refreshButtonAction(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    
    @IBAction func showRapport(_ sender: UILongPressGestureRecognizer) {
        if tableView.isEditing {return}
        let location : CGPoint = sender.location(in: self.tableView)
        let swipedIndexPath:IndexPath = self.tableView.indexPathForRow(at: location)!
        //let swipedcell:patientTableViewCell = self.tableView.cellForRowAtIndexPath(swipedIndexPath)!
        //do your stuff here
        longpushPatient = Donnees.listePatient.patients[(swipedIndexPath as NSIndexPath).row]
        performSegue(withIdentifier: "showrapportSegue", sender: self)
    }
    
    @IBAction func savePatients(_ sender: UIBarButtonItem) {
       // UIApplication.sharedApplication().dele
        DataSave.saveDataFiles()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
       // self.tableView.registerClass(patientTableViewCell.self, forCellReuseIdentifier: "MenuCell")

        self.tableView.remembersLastFocusedIndexPath=true
        configMenuItem.title = "\u{2699}\u{0000FE0E}"
        
        Donnees.mainView=self
        
    }
    fileprivate var havepatient: Bool = false
    func patientAdded(_ sender: AjoutPatientViewController, patient: patients.patient) {
        Donnees.listePatient.patients.append(patient)
         tableView.reloadData()
        havepatient=true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        if havepatient {
            let rowToSelect:IndexPath = IndexPath(row: Donnees.listePatient.patients.count-1, section: 0)
            // NSIndexPath(
            self.tableView.selectRow(at: rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.middle)
            havepatient=false
            //self.tableView(self.tableView, didSelectRowAtIndexPath: rowToSelect)
            self.performSegue(withIdentifier: "showsaisie", sender: self.tableView.cellForRow(at: rowToSelect));
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
     
        if (segue.identifier == "ajoutPatient") {
            let svc = segue.destination as! AjoutPatientViewController
             svc.delegate=self
            //  svc.listePatients = Donnees.listePatient
            
        }
        if (segue.identifier == "showsaisie") {
                
                let svc = segue.destination as! saisieTableViewController
                let selectedIndex = self.tableView.indexPath(for: sender as! UITableViewCell)
                svc.patient = Donnees.listePatient.patients[(selectedIndex! as NSIndexPath).row]
                svc.title=svc.patient!.nomPrenom
                DataSave.lastPatientVC = svc
                //svc.
          //  print("\(), \(), row \(selectedIndex!.row)")
                //  sender?.row
                //  svc.listePatients = Donnees.listePatient
                
            }
        if segue.identifier == "showrapportSegue" {
            let svc = segue.destination as! rapportViewController
            
                       svc.patient = longpushPatient
            
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Donnees.listePatient.patients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! patientTableViewCell

        // Configure the cell...
        let patient = Donnees.listePatient.patients[(indexPath as NSIndexPath).row]
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
            cell.image2.backgroundColor = UIColor.green
        }
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            Donnees.listePatient.patients.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        if (fromIndexPath as NSIndexPath).row == (toIndexPath as NSIndexPath).row {return }
        swap(&Donnees.listePatient.patients[(fromIndexPath as NSIndexPath).row],&Donnees.listePatient.patients[(toIndexPath as NSIndexPath).row])
        
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
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
