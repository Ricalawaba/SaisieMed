//
//  selectionTexteTableViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 17/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
protocol textSelectedDelegate {
    func textSelected(_ sender:selectionTexteTableViewController, text:String)
    func textDeleted(_ sender:selectionTexteTableViewController, text:String)
}
class selectionTexteTableViewController: UITableViewController, UISearchBarDelegate {
    // MARK: Properties
    var textes = [String]()
    var searchActive : Bool = false
    var filtered: [String] = []
    var delegate:textSelectedDelegate?
    
    // MARK: IBOutlet
    @IBOutlet weak var Cell: UITableViewCell!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: UIView override
    override func viewDidAppear(_ animated: Bool) {
        searchBar.becomeFirstResponder()
        searchActive=false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        searchBar.delegate=self
       // searchBar.becomeFirstResponder()
    //    tableView!.reloadData()
        //searchBar.
    }
    //override func view
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("selectionTextCell", forIndexPath: indexPath)
//        searchBar.text=cell.textLabel?.text
//    }
    // MARK: Selection Delegate
    func returnText(_ text: String?){
        if let del=delegate  {
            if (text != nil) {del.textSelected(self, text: text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))}
            
        }
        _=self.navigationController?.popViewController(animated: true)

    }
    // MARK: UISearchBarDelegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        returnText("")
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != nil {
            returnText(searchBar.text!)
            
        }

        searchActive = false;
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != nil {
            returnText(searchBar.text!)
            
        }
        searchActive=false
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchActive=false
            self.tableView.reloadData()
            return
        }
        filtered = textes.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("selectionTextCell", forIndexPath: indexPath)
        let mytext:String!
      
        if(searchActive){
            mytext = filtered[(indexPath as NSIndexPath).row]
        } else {
            mytext=textes[(indexPath as NSIndexPath).row]
        }
        returnText(mytext)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(searchActive) {
            return filtered.count
        }
        return textes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectionTextCell", for: indexPath)
          cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont(name: "System", size: 10)
        if(searchActive){
            if filtered.count>0 {
            cell.textLabel?.text = filtered[(indexPath as NSIndexPath).row]
            } 
        } else {
        cell.textLabel?.text=textes[(indexPath as NSIndexPath).row]
        }
        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
        
    }
   

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if filtered.count>0 { return }
        if editingStyle == .delete {
            // Delete the row from the data source
            
            delegate?.textDeleted(self,text: textes[(indexPath as NSIndexPath).row])
            textes.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

//    
//    // Override to support rearranging the table view.
//    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//        if filtered.count>0
//        || fromIndexPath.row == toIndexPath.row
//            {return }
//        
//        swap(&textes[fromIndexPath.row],&textes[toIndexPath.row])
//    }
//    
//
//    
//    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return (filtered.count == 0 )
//        //return true
//    }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
