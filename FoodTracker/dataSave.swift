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
// MARK: Structure statiques d'accès aux fichiers de données
struct DataSave {
    
    static func saveDataFiles(){
        saveFileatcd()
        saveFilemedecin()
        saveFilemedicament()
        saveFilelocalisation()
        saveFilemotif()
        saveFileetablissement()
        saveFileposologie()
        saveFilePatients()
        saveFileprofession()
        saveFileConclusionRx()
        
    }
    static func loadDataFiles(){
        loadFileatcd()
        loadFilemedecin()
        loadFilemedicament()
        loadFilelocalisation()
        loadFilemotif()
        loadFileetablissement()
        loadFileposologie()
        loadFileConclusionRx()
        loadFileprofession()

        // MARK: Uncomment to read patient data
        loadFilePatients()
            }
    
    static func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    // MARK: Construction des noms de fichiers de données
    
    static var filePathConclusionRx : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("ConclusionRx.dat")
        return filename
        
    }
    static var filePathProfession : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("profession.dat")
        return filename
        
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
    // MARK: Sauvegarde des fichiers de données
    
    static func saveFileConclusionRx() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["ConclusionRx"]!, toFile: filePathConclusionRx)
    }
    static func saveFileprofession() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["profession"]!, toFile: filePathProfession)
    }
    static func saveFileatcd() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["atcd"]!, toFile: filePathAtcd)
    }
    static func saveFilemedecin() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["medecin"]!, toFile: filePathMedecin)
    }
    static func saveFilemedicament() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["medicament"]!, toFile: filePathMedicament)
    }
    static func saveFilelocalisation() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["localisation"]!, toFile: filePathLocalisation)
    }
    static func saveFilemotif() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["motif"]!, toFile: filePathMotif)
    }
    static func saveFileetablissement() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["etablissement"]!, toFile: filePathetablissement)
    }
    static func saveFileposologie() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict["posologie"]!, toFile: filePathPosologie)
    }
    static func saveFilePatients() {
        NSKeyedArchiver.archiveRootObject(Donnees.listePatient, toFile: filePathPatients)
    }
    // MARK: Chargement des fichiers de données
    static func loadFileConclusionRx() {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathConclusionRx) as? [String] {
            Donnees.selectiontextDict["ConclusionRx"] = array
        }    }
    static func loadFileprofession() {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathProfession) as? [String] {
            Donnees.selectiontextDict["profession"] = array
        }    }
    static func loadFileatcd() {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathAtcd) as? [String] {
            Donnees.selectiontextDict["atcd"] = array
        }    }
    static func loadFilemedecin() {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathMedecin) as? [String] {
            Donnees.selectiontextDict["medecin"] = array
        }
    }
    static func loadFilemedicament() {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathMedicament) as? [String] {
            Donnees.selectiontextDict["medicament"] = array
        }
    }
    static func loadFilelocalisation() {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathLocalisation) as? [String] {
            Donnees.selectiontextDict["localisation"] = array
        }
    }
    static func loadFilemotif() {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathMotif) as? [String] {
            Donnees.selectiontextDict["motif"] = array
        }
    }
    static func loadFileetablissement() {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathetablissement) as? [String] {
            Donnees.selectiontextDict["etablissement"] = array
        }
    }
    static func loadFileposologie() {
        if let array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePathPosologie) as? [String] {
            Donnees.selectiontextDict["posologie"] = array
        }
    }
    // MARK: - Lecture fichier patient
    static func loadFilePatients() {
        if let listpatient=NSKeyedUnarchiver.unarchiveObjectWithFile(filePathPatients) as? patients{
            Donnees.listePatient=listpatient
        }
    }


    
}

