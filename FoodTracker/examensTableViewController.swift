//
//  examensTableViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class examensTableViewController: UITableViewController {
    var categorie = categorieExamen.Categorie()
    
    //var examen = [Examen]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //examen=Donnees.listeCategorie.categories.first!.examens
        self.title=categorie.nom
        // print(examen.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categorie.examens.count
    }

    @IBAction func EnregistrerModif(sender: UIBarButtonItem) {
        
        //get section of interest i.e: first section (0)
        for row in 0 ..< tableView.numberOfRowsInSection(0)
        {
            
            let indexPath = NSIndexPath(forRow: row, inSection: 0)
            
           
            //following line of code is for invisible cells
            self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: false)
            
            
            //get cell for current row as my custom cell i.e :roomCell
            let examen = categorie.examens[row]
            if examen.type == Examen.typeenum.donnee {
                let cell  = self.tableView.cellForRowAtIndexPath(indexPath)! as! reponsecourteTableViewCell
                if cell.texteReponsecourte.text != examen.value {
                    examen.value = cell.valeurReponseCourte.text!
                }
                
            }else if examen.type == Examen.typeenum.ouinon {
                let cell  = self.tableView.cellForRowAtIndexPath(indexPath)! as! questionOuiNonTableViewCell
                if cell.reponseSegmentedControl.selectedSegmentIndex==0 {
                    examen.value="0"
                    
                } else if cell.reponseSegmentedControl.selectedSegmentIndex==1 {
                    examen.value="1"
                } else {
                    examen.value=""
                    
                }
            
            }
            else if examen.type == Examen.typeenum.reponsecourte {
                let cell  = self.tableView.cellForRowAtIndexPath(indexPath)! as! reponsecourteTableViewCell
                if cell.texteReponsecourte.text != examen.value {
                    examen.value = cell.valeurReponseCourte.text!
                }
            
            
            
            
                }
    }
         self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let examen1 = categorie.examens[indexPath.row]
        
        //var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("reponsecourteCell", forIndexPath: indexPath) as! reponsecourteTableViewCell
        //cell.textequestion
        let cell = UITableViewCell()
        if examen1.type==Examen.typeenum.reponsecourte {
         let cell2 = tableView.dequeueReusableCellWithIdentifier("reponsecourteCell", forIndexPath: indexPath) as! reponsecourteTableViewCell
            cell2.texteReponsecourte.text=examen1.intitule
            if examen1.value != "" {
                cell2.valeurReponseCourte.text = examen1.value
            }
            return cell2
        } else
        if examen1.type==Examen.typeenum.ouinon {
            let cell3 = tableView.dequeueReusableCellWithIdentifier("questionOuiNonCell", forIndexPath: indexPath) as! questionOuiNonTableViewCell
            cell3.texteQuestion.text = examen1.intitule
            if examen1.value == "0" {
                cell3.reponseSegmentedControl.selectedSegmentIndex=0
            } else if examen1.value == "1" {
                cell3.reponseSegmentedControl.selectedSegmentIndex=1
                
            }
            return cell3
        }
        // Configure the cell...
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
