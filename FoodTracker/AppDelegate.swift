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
    
    func saveDataFiles(){
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["atcd"]!, toFile: filePathAtcd)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["medecin"]!, toFile: filePathMedecin)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["medicament"]!, toFile: filePathMedicament)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["localisation"]!, toFile: filePathLocalisation)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["motif"]!, toFile: filePathMotif)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["etablissement"]!, toFile: filePathetablissement)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["posologie"]!, toFile: filePathetablissement)
        NSKeyedArchiver.archiveRootObject(Donnees.listePatient, toFile: filePathPatients)
    }
    func loadDataFiles(){
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
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathetablissement) as? [String] {
            Donnees.selectiontextDict["etablissement"] = array
        }
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathPosologie) as? [String] {
            Donnees.selectiontextDict["posologie"] = array
        }

        // MARK: Uncomment to read patient data

//        /*
        if let listpatient=NSKeyedUnarchiver.unarchiveObjectWithFile(filePathPatients) as? patients{
            Donnees.listePatient=listpatient
        }
// */
    }
    func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    var filePathAtcd : String {
               let filename = getDocumentsDirectory().stringByAppendingPathComponent("atcd.dat")
        return filename
  
    }
    var filePathMedicament : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("medicament.dat")
        return filename
        
    }
    var filePathLocalisation : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("localisation.dat")
        return filename
        
    }
    var filePathMedecin : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("medecin.dat")
        return filename
        
    }
    var filePathMotif : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("motif.dat")
        return filename
        
    }
    var filePathetablissement : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("etablissements.dat")
        return filename
        
    }

    var filePathPatients : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("patients.dat")
        return filename
        
    }
    var filePathPosologie : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("posologie.dat")
        return filename
        
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Donnees.selectiontextDict["atcd"] = [
                "RGO","Néoplasie colique","Asthme","Pneumopathie","Infacrtus myocardique","Syndrome anxio-depressif","Occlusion","Appendicectomie",
                "Cholécystectomie","Colique néphrétique","Ulcère gastrique","Gastrite","Angor","Hypercholestérolémie","DNID","Diabète insulino requérant",
                "Diabète type I","Epilepsie","Bronchopneumopathie obstructive","Splénectomie","Prothèse de hanche","Prothèse de genou","Amygdalectomie","Thrombose veineuse profonde",
                "Embolie pulmonaire","Artérite", "Oedeme aigue du poumon", "Urticaire","Eczéma","Péritonite","Hypertension artérielle","Insufisance veineuse des membres inférieurs",
                "Fibrillation auriculaire","Insufisance cardiaque","Valvulopathie","Pace-Maker","Néoplasie pulmonaire","Néoplasique colique"
                ]
        Donnees.selectiontextDict["atcd"]=Donnees.selectiontextDict["atcd"]?.sort()
        Donnees.selectiontextDict["medicament"] = [
                "AVLOCARDYL 40","KARDEGIC 75","KARDEGIC 160", "AMLOR 5","AMIODARONE 200",
                "ESOMEPRAZOLE 20","ESOMEPRAZOLE 40","OMEPRAZOLE 20", "OMEPRAZOLE 10","CO-APROVEL 150/12.5",
                "DOLIPRANE 500","DOLIPRANE 1000","PLAVIX 75", "FUROSEMIDE 20","FUROSEMIDE 40",
                "PROPRANOLOL 40","AVLOCARDYL 40","AMLODIPINE 5","AMLODIPINE 10","BACLOFENE 10","ABILIFY 5","CYMBALTA 60",
                "METFORMINE 500","METFORMINE 850","METFORMINE 1000","LANTUS 100UI/ml","DIGOXINE 0,25",
                "PREVISCAN","COUMADINE 2","COUMADINE 5","IRBESARTAN 150","IRBESARTAN 300","PARACETAMOL 500","PARACETAMOL 1000",
                "TRAMADOL 50","TRAMADOL 100 LP","FLECAINE 100","LEVOTHYROXINE 25","LEVOTHYROXINE 50","LEVOTHYROXINE 75",
                "LEVOTHYROXINE 100","LEVOTHYROXINE 125","LEVOTHYROXINE 150",
                ].sort()
        Donnees.selectiontextDict["motif"] = [
                "Aucun","Douleur thoracique","Malaise","Douleur abdominale","Dyspnée","Vomissements","Diarrhée","Brulures urinaires","Hyperthermie","Céphallée","Sciatalgie",
                "Trauma main","Trauma epaule","Eruption cutanée","Chute par maladresse"
                ].sort()
        Donnees.selectiontextDict["localisation"] = ["Salle d'attente","Box 1","Box 2","Box 3","Box 4","Box 5","Box 6","Box 7","Box A","Box B","Box C","Box D","Box E", "Box F", "Bureau", "I.O.A","Degrav", "Suture"]
        Donnees.selectiontextDict["etablissement"] = [
                "Clin. Claude Bernard (Albi)","CH Albi","Clin. Sidobre (Castres)","CHU Rangueuil (Toulouse)","Clin. Toulouse-Lautrec (Albi)",
                "Clin. Union (Toulouse)","Clin. St-Jean Languedoc (Toulouse)","Clin. des Cèdres (Toulouse)", "CH Castres","CHU Toulouse",
                ].sort()
        Donnees.selectiontextDict["medecin"] = [
                " Pas de médecin traitant","Dr Chatillon B.", "Dr Paquié C.", "Dr Mariambourg G.", "Dr Moruzi M.", "Dr Moruzi S.",
                "Dr De la porte C.","Dr Fargues P.","Dr Bensoussan L-C.","Dr Arhire Andréi.","Dr Arhire Anca","Dr Louis C.",
                ""
                ].sort()
        Donnees.selectiontextDict["posologie"] = ["1/j","1x2/j", "1x3/j", "2x3/j", "½/j","½x2/j","½x3/j", "¼/j","¼x2/j","¼x3/j","1/j 5/7j"]
        // MARK: Uncomment to read data files
        
       //  self.loadDataFiles()
    /*
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
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathetablissement) as? [String] {
            Donnees.selectiontextDict["etablissement"] = array
        }
    */
        /*
        if let listpatient=NSKeyedUnarchiver.unarchiveObjectWithFile(filePathPatients) as? patients{
            Donnees.listePatient=listpatient
        }
    */
        
        /*var filemgr = NSFileManager.defaultManager()
        if filemgr.fileExistsAtPath(filePathPatients) {
            print("File exists")
            do {
                let readFile = try String(contentsOfFile: filePathPatients, encoding: NSASCIIStringEncoding)
                print("\(readFile)")
                // the above prints "some text"
            } catch let error as NSError {
                print("Error: \(error)")  
            }  
        }*/
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {

        saveDataFiles()
        
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

