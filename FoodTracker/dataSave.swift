//
//  dataSave.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 20/06/2016.
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
struct DataSave {
    static func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    static var filePathAtcd : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("atcd.dat")
        return filename
        
    }
    static var filePathMedicament : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("medicament.dat")
        return filename
        
    }
    static var filePathLocalisation : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("localisation.dat")
        return filename
        
    }
    static var filePathMedecin : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("medecin.dat")
        return filename
        
    }
    static var filePathMotif : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("motif.dat")
        return filename
        
    }
    static var filePathetablissement : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("etablissements.dat")
        return filename
        
    }
    
    static var filePathPatients : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("patients.dat")
        return filename
        
    }
    static var filePathPosologie : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("posologie.dat")
        return filename
        
    }
    static func saveDataFiles(){
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["atcd"]!, toFile: filePathAtcd)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["medecin"]!, toFile: filePathMedecin)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["medicament"]!, toFile: filePathMedicament)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["localisation"]!, toFile: filePathLocalisation)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["motif"]!, toFile: filePathMotif)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["etablissement"]!, toFile: filePathetablissement)
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["posologie"]!, toFile: filePathPosologie)
        NSKeyedArchiver.archiveRootObject(Donnees.listePatient, toFile: filePathPatients)
    }
    static func loadDataFiles(){
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
        
//               /*
        if let listpatient=NSKeyedUnarchiver.unarchiveObjectWithFile(filePathPatients) as? patients{
            Donnees.listePatient=listpatient
        }
        // */
    }
    
}

