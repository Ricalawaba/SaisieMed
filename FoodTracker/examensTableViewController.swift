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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "autoshow") {
            
            let svc = segue.destinationViewController as! examensTableViewController
            let mycell = (sender as! examgroupTableViewCell)
            svc.categorie = mycell.examen!.categorie!
            svc.navigationController?.title = svc.categorie.nom
            //  sender?.row
            //  svc.listePatients = Donnees.listePatient
            
        }
        
    }

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
        if examen1.type==Examen.examenEnum.reponsecourte || examen1.type==Examen.examenEnum.donnee{
         let cell2 = tableView.dequeueReusableCellWithIdentifier("reponsecourteCell", forIndexPath: indexPath) as! reponsecourteTableViewCell
            cell2.texteReponsecourte.text=examen1.intitule
            if examen1.value != "" {
                cell2.valeurReponseCourte.text = examen1.value
            }
            cell2.examen=examen1
            return cell2
        } else
        if examen1.type==Examen.examenEnum.ouinon {
            let cell3 = tableView.dequeueReusableCellWithIdentifier("questionOuiNonCell", forIndexPath: indexPath) as! questionOuiNonTableViewCell
            cell3.texteQuestion.text = examen1.intitule
            if examen1.value == "0" {
                cell3.reponseSegmentedControl.selectedSegmentIndex=0
            } else if examen1.value == "1" {
                cell3.reponseSegmentedControl.selectedSegmentIndex=1
                
            }
            cell3.examen=examen1
            return cell3
        }
        if examen1.type==Examen.examenEnum.check {
            let cell3 = tableView.dequeueReusableCellWithIdentifier("checkCell", forIndexPath: indexPath) as! checkTableViewCell
            cell3.questionCheckLabel.text = examen1.intitule
            if examen1.value == "0" {
                cell3.checkSegment.selectedSegmentIndex=0
            } else  {
                cell3.checkSegment.selectedSegmentIndex=1
                
            }
            cell3.examen=examen1
            return cell3
        }

        if examen1.type==Examen.examenEnum.group {
            let cell3 = tableView.dequeueReusableCellWithIdentifier("examgroup", forIndexPath: indexPath) as! examgroupTableViewCell
            cell3.intitule.text = examen1.intitule
                        cell3.examen=examen1
            if let namedImage = examen1.categorie?.namedImage
            {
                cell3.monImage.image=UIImage(named: namedImage)
            }
            
            cell3.details.text=examen1.categorie?.detailString()
            return cell3
        }
        if examen1.type==Examen.examenEnum.selection {
            let cell3 = tableView.dequeueReusableCellWithIdentifier("selectionCell", forIndexPath: indexPath) as! selectionTableViewCell
            cell3.questionSelection.text = examen1.intitule
            cell3.examen=examen1

            

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
