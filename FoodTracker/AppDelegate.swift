//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 08/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

extension String {
    
    func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathComponent(path)
    }
}

struct Donnees {
    static var listePatient = patients()
    static var listeCategorie = categorieExamen()
    static var selectiontextDict = [String: ([String]) ]()
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    var filePathAtcd : String {
               let filename = getDocumentsDirectory().stringByAppendingPathComponent("atcd.txt")
        return filename
  
    }
    var filePathMedicament : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("medicament.txt")
        return filename
        
    }
    var filePathLocalisation : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("localisation.txt")
        return filename
        
    }
    var filePathMedecin : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("medecin.txt")
        return filename
        
    }
    var filePathMotif : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("motif.txt")
        return filename
        
    }
    var filePathPatients : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("test3.txt")
        return filename
        
    }
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Donnees.selectiontextDict["atcd"] = ["RGO","Néoplasie colique","Asthme","Pneumopathie"].sort()
        Donnees.selectiontextDict["medicament"] = ["AVLOCARDYL 40: 1/2x2/j","KARDEGIC 75: 1/j","KARDEGIC 160: 1/j", "AMLOR 5: 1/j","AMIODARONE 200: 1/j","AMIODARONE 200: 1/j 5/7j"].sort()
        Donnees.selectiontextDict["motif"] = ["Aucun"]
        Donnees.selectiontextDict["localisation"] = ["Salle d'attente","Box 1","Box 2","Box 3","Box 4","Box 5","Box 6","Box 7","Box A","Box B","Box C","Box D","Box E", "Box F", "Bureau", "I.O.A","Degrav", "Suture"]
        Donnees.selectiontextDict["medecin"] = ["Pas de médecin traitant"]
//        let writePath = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent("instagram.igo")
//        let data = NSKeyedArchiver.archivedDataWithRootObject(self)
//        let filename = getDocumentsDirectory().stringByAppendingPathComponent("atcd.txt")
//        if let names = NSKeyedUnarchiver.unarchiveObjectWithFile(filename) as? [String] {
//            Donnees.selectiontextDict["atcd"] = names
//        }
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathAtcd) as? [String] {
            Donnees.selectiontextDict["atcd"] = array
        }
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathMedecin) as? [String] {
            Donnees.selectiontextDict["medecin"] = array
        }
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathMedicament) as? [String] {
            Donnees.selectiontextDict["medicament"] = array
        }
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathLocalisation) as? [String] {
            Donnees.selectiontextDict["localisation"] = array
        }
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathMotif) as? [String] {
            Donnees.selectiontextDict["motif"] = array
        }
        if let listpatient=NSKeyedUnarchiver.unarchiveObjectWithFile(filePathPatients) as? patients{
            Donnees.listePatient=listpatient
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {

        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["atcd"]!, toFile: filePathAtcd)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["medecin"]!, toFile: filePathMedecin)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["medicament"]!, toFile: filePathMedicament)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["localisation"]!, toFile: filePathLocalisation)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["motif"]!, toFile: filePathMotif)
        NSKeyedArchiver.archiveRootObject(Donnees.listePatient, toFile: filePathPatients)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

