//
//  dataSave.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 20/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
extension String {
    
    func stringByAppendingPathComponent(_ path: String) -> String {
        
        let nsSt = self as NSString
        //nsSt.st
        return nsSt.appendingPathComponent(path)
    }
    func stringByAppendingPathExtension(_ ext:String) -> String {
        let nsSt = self as NSString
        //nsSt.st
        return nsSt.appendingPathExtension(ext)!
    }
}

struct Donnees {
    static var listePatient = patients()
    static var listeCategorie = categorieExamen()
    static var selectiontextDict = [String: [String] ]()
    static var multiColumnPickerDataStr = [String: [([String])] ]()
    static var userdefault: UserDefaults = UserDefaults.standard
    static var patientEnCours:patients.patient?
    static var mainView:UIViewController!
    static var imagesMap:[String:MappedImage]=[:]
}

// MARK: Structure statiques d'accès aux fichiers de données
struct DataSave {
    static var lastPatientVC: saisieTableViewController!
    
    static func saveDataFiles(){


        saveSelectionDictionary()
        saveFilePatients()
        
    }
    static func loadDataFiles(){

        loadFileSelectionDictionary()
  
        loadFilePatients()
            }
    
    static func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    static var filePathPatients : String {
        var filename:String="patients.dat"
        if let patientdat=Donnees.userdefault.string(forKey: "patientdat") {
            filename=patientdat
        }
        
        filename = getDocumentsDirectory().stringByAppendingPathComponent(filename)
        return filename
        
    }

    static var filePathSelectionDictionary : String {
        let filename = getDocumentsDirectory().stringByAppendingPathComponent("saisiemed-dynamic.dat")
        return filename
        
    }

    // MARK: Sauvegarde des fichiers de données
    
    static func saveSelectionDictionary() {
        NSKeyedArchiver.archiveRootObject(Donnees.selectiontextDict, toFile: filePathSelectionDictionary)
    }

    static func saveFilePatients() {
        NSKeyedArchiver.archiveRootObject(Donnees.listePatient, toFile: filePathPatients)
    }
    // MARK: Chargement des fichiers de données
    
    
    static func loadFileSelectionDictionary() {
        if let array = NSKeyedUnarchiver.unarchiveObject(withFile: filePathSelectionDictionary) as? [String :([String]) ]{
            Donnees.selectiontextDict  = array
        }    }



    
    // MARK: - Lecture fichier patient
    static func loadFilePatients() {
        if let listpatient=NSKeyedUnarchiver.unarchiveObject(withFile: filePathPatients) as? patients{
            Donnees.listePatient=listpatient
        }
    }


    static func ListDirectory() {
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory( at: documentsUrl, includingPropertiesForKeys: nil, options: [])
            print(directoryContents)
            
            // if you want to filter the directory contents you can do like this:
            print("directory contents:",directoryContents)
            let mp3Files = directoryContents.filter{ $0.pathExtension == "dat" }
            print("jpg urls:",mp3Files)
            let mp3FileNames = mp3Files.flatMap({$0.deletingPathExtension().lastPathComponent})
            print("jpg list:", mp3FileNames)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

