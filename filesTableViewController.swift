//
//  filesTableViewController.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 13/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

func getDocumentsURL() -> NSURL {
    let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    return documentsURL
}

func fileInDocumentsDirectory(filename: String) -> String {
    
    let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
    return fileURL.path!
    
}


class filesTableViewController: UITableViewController {
    enum filesType {
        case unknown
        case dat
        case pdf
        case png
        case txt
        case patients
        case jpg
        case all
    }
    
    var fileNames: [String]=[]
    var type: filesType = .unknown {
        didSet {
            let documentsUrl =  NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
            var filesNamesList:[NSURL]=[]
            do {
                // Get the directory contents urls (including subfolders urls)
                filesNamesList = try NSFileManager.defaultManager().contentsOfDirectoryAtURL( documentsUrl, includingPropertiesForKeys: nil, options: [])
                
                
                // if you want to filter the directory contents you can do like this:
                //            for d in directoryContents {
                //                let svc =  self.storyboard?.instantiateViewControllerWithIdentifier("pluginFormID") as! pluginFormViewController
                //                let aview=svc.view
                //                svc.imageView.image = UIImage(contentsOfFile: d.absoluteString)
                //                svc.titreLabel.text=d.absoluteString
                //                // svc.descriptionLabel.text = categorie.detailString()
                //                // svc.delegate=self
                //                self.navigationController!.pushViewController(svc,animated: true)
                //            }
                //  print("directory contents:",directoryContents)
                //let filterFiles = filesNamesList.filter{ $0.pathExtension == "dat" }
                //print("dat urls:",mp3Files)
                // let mp3FileNames = filesNamesList.flatMap({$0.URLByDeletingPathExtension?.lastPathComponent})
                // print("dat list:", mp3FileNames)
                
                
                var filterFiles : [NSURL]=[]
                switch type {
                case .jpg:
                    filterFiles = filesNamesList.filter{ $0.pathExtension == "jpg" }
                case .dat:
                    filterFiles = filesNamesList.filter{ $0.pathExtension == "dat" }
                case .pdf:
                    filterFiles = filesNamesList.filter{ $0.pathExtension == "pdf" }
                case .png:
                    filterFiles = filesNamesList.filter{ $0.pathExtension == "png" }
                case .txt:
                    filterFiles = filesNamesList.filter{ $0.pathExtension == "txt" }
                case .patients:
                    tableView.rowHeight=48
                    filterFiles = filesNamesList.filter {$0.absoluteString.containsString("patients.dat")}
                default:
                    filterFiles = filesNamesList
                    break
                }
                fileNames.removeAll()
                for filteredFile in filterFiles {
                    fileNames.append(filteredFile.lastPathComponent!)
                }
                //fileNames = filterFiles.flatMap( {$0.URLByDeletingPathExtension?.lastPathComponent} )
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.rowHeight = 96
        //self.tableView.estimatedRowHeight = 90.0;
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
        return fileNames.count
    }
    
    @IBOutlet weak var filenameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func fileSizeFor(fullpathname: String) -> String {
        let MyUrl = NSURL(fileURLWithPath: fullpathname)
        let fileAttributes = try! NSFileManager.defaultManager().attributesOfItemAtPath(MyUrl.path!)
        let fileSizeNumber = fileAttributes[NSFileSize] as! NSNumber
        let fileSize = fileSizeNumber.longLongValue
        var sizeMB = Double(fileSize / 1024)
        sizeMB = Double(sizeMB / 1024)
        var sizestr=String(format: "%.2f", sizeMB) + " mo"
        if sizestr == "0.00 mo" {
            sizestr = String(fileSizeNumber.longLongValue) + " o"
            
        }
        return sizestr
 
    }
    
    func fileDateFor(fullpathname: String, format: String = "dd/MM/YYYY-kk:mm") ->String {
        do{
            let fileAttributes = try NSFileManager.defaultManager().attributesOfItemAtPath(fullpathname)
            let fileDate = fileAttributes[NSFileCreationDate] as? NSDate
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = format
            //let d = NSDate()
            let s = dateFormatter.stringFromDate(fileDate!)
            // println(s)
            return s
            
        }
        catch _ as NSError{
            //error handling
        }

       return ""
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellvide = UITableViewCell();
        let fullpathname = fileInDocumentsDirectory(fileNames[indexPath.row])
        if type != .patients {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("imagefileCell", forIndexPath: indexPath) as! imagefileTableViewCell
            cell.filenameImageView.image=UIImage(contentsOfFile: fullpathname)
            cell.filenameImageView.sizeToFit()
            cell.fileNameLabel.text=fileNames[indexPath.row]
            cell.descriptionLabel.text=fileSizeFor(fullpathname)
            cell.dateLabel.text=fileDateFor(fullpathname)
//            let MyUrl = NSURL(fileURLWithPath: fullpathname)
//            let fileAttributes = try! NSFileManager.defaultManager().attributesOfItemAtPath(MyUrl.path!)
//            let fileSizeNumber = fileAttributes[NSFileSize] as! NSNumber
//            let fileSize = fileSizeNumber.longLongValue
//            var sizeMB = Double(fileSize / 1024)
//            sizeMB = Double(sizeMB / 1024)
//            let sizestr=String(format: "%.2f", sizeMB) + " mo"
//            if sizestr == "0.00 mo" {
//                cell.descriptionLabel.text = String(fileSizeNumber.longLongValue) + " o"
//                
//            }else {
//                cell.descriptionLabel.text = sizestr
//            }
            
//            do{
//                let fileAttributes = try NSFileManager.defaultManager().attributesOfItemAtPath(fullpathname)
//                let fileDate = fileAttributes[NSFileCreationDate] as? NSDate
//                var dateFormatter = NSDateFormatter()
//                dateFormatter.dateFormat = "dd/MM/YYYY-kk:mm"
//                //let d = NSDate()
//                let s = dateFormatter.stringFromDate(fileDate!)
//                // println(s)
//                cell.dateLabel.text=s
//                
//            }
//            catch let err as NSError{
//                //error handling
//            }
//            // print(String(format: "%.2f", sizeMB) + " MB")
//            // Configure the cell...
            return cell
        } else {  // Type patient
            let cell = tableView.dequeueReusableCellWithIdentifier("patientFileCell", forIndexPath: indexPath) as! patientFileTableViewCell
            //cell.filenameImageView.image=UIImage(contentsOfFile: fullpathname)
            cell.filenameLabel.text=fileNames[indexPath.row]
            cell.dateLabel.text=fileDateFor(fullpathname)
            cell.descriptionLabel.text=fileSizeFor(fullpathname)

        }
        return cellvide
        
        
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showImageFromFileTableview" {
            let svc = segue.destinationViewController as! pluginFormViewController
            _ = svc.view
            let mycell = (sender as! imagefileTableViewCell)
            svc.imageView.image=mycell.filenameImageView.image!
            
            //let mycell = (sender as! selectionTableViewCell)
            // let tab:[String]=(["Cholecystectomie","Appendicectomie","IDM"]).sort()
            // examenSelected=mycell.examen
            // svc.textes = Donnees.selectiontextDict[examenSelected!.tag]!
            // svc.delegate=self
            
            //  sender?.row
            //  svc.listePatients = Donnees.listePatient
            
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      //  super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        if type == .patients {
            Donnees.userdefault.setObject(fileNames[indexPath.row], forKey: "patientdat")
            Donnees.listePatient.patients=[]
            DataSave.loadFilePatients()
            //Donnees.userdefault.setObject("\(s)patients.dat", forKey: "patientdat")
            let viewControllers: [UIViewController] = self.navigationController!.viewControllers ;
            for aViewController in viewControllers {
                if(aViewController is patientTableViewController){
                    self.navigationController!.popToViewController(aViewController, animated: true);
                }
            }


        }
    }
    
    
}
