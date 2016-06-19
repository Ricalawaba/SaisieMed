//
//  selectionTexteTableViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 17/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
protocol textSelectedDelegate {
    func textSelected(sender:selectionTexteTableViewController, text:String)
    func textDeleted(sender:selectionTexteTableViewController, text:String)
}
class selectionTexteTableViewController: UITableViewController, UISearchBarDelegate {
    // MARK: Properties
    var textes = [String]()
    var searchActive : Bool = false
    var filtered: [String] = []
    var delegate:textSelectedDelegate?
    
    // MARK; IBOutlet
    @IBOutlet weak var Cell: UITableViewCell!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        searchBar.delegate=self
        
        //searchBar.
    }
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("selectionTextCell", forIndexPath: indexPath)
//        searchBar.text=cell.textLabel?.text
//    }
    // MARK: Selection Delegate
    func returnText(text: String?){
        if let del=delegate  {
            if (text != nil) {del.textSelected(self, text: text!)}
            
        }
        self.navigationController?.popViewControllerAnimated(true)

    }
    // MARK: UISearchBarDelegate
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        returnText("")
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if searchBar.text != nil {
            returnText(searchBar.text!)
            
        }

        searchActive = false;
    }
    func searchBarBookmarkButtonClicked(searchBar: UISearchBar) {
        if searchBar.text != nil {
            returnText(searchBar.text!)
            
        }
        searchActive=false
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = textes.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("selectionTextCell", forIndexPath: indexPath)
        let mytext:String!
      
        if(searchActive){
            mytext = filtered[indexPath.row]
        } else {
            mytext=textes[indexPath.row]
        }
        returnText(mytext)
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(searchActive) {
            return filtered.count
        }
        return textes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("selectionTextCell", forIndexPath: indexPath)
          cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont(name: "System", size: 10)
        if(searchActive){
            cell.textLabel?.text = filtered[indexPath.row]
        } else {
        cell.textLabel?.text=textes[indexPath.row]
        }
        // Configure the cell...

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
            
            delegate?.textDeleted(self,text: textes[indexPath.row])
            textes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
