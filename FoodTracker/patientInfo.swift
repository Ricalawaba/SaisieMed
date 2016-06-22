//
//  patientInfo.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation
class patients :  NSObject,NSCoding {
    
    class patient :  NSObject,NSCoding {
        var nomPrenom : String {
            get {
                return examen.categories[0].examens[0].value
            }
            set {
               examen.categories[0].examens[0].value=newValue
            }
        }
        var age : Int {
            get {
                return Int(examen.categories[0].examens[2].value)!
            }
            set {
                examen.categories[0].examens[2].value="\(newValue)"
            }
        }
        var localisation : String {
            get {
                return examen.categories[0].examens[3].value
            }
            set {
                examen.categories[0].examens[3].value=newValue
            }
        }
        var motif : String {
            get {
                return examen.categories[0].examens[4].categorie!.detailString()

            }
            set {
               examen.categories[0].examens[4].value=newValue
            }
        }
        var masculin: Bool {
            get {
                if examen.categories[0].examens[1].value == "0"
                { return true }
                return false
            }
            set {
                if newValue {examen.categories[0].examens[1].value = "0"}
                else { examen.categories[0].examens[1].value = "1" }
            }
        }
        var examen=categorieExamen()
        
        // MARK: NSCoding
        required convenience init?(coder decoder: NSCoder) {
            guard let examen = decoder.decodeObjectForKey("examen") as? categorieExamen
                                else { return nil }
            self.init(examen1: examen)
           
        }
        func encodeWithCoder(coder: NSCoder) {
            coder.encodeObject(self.nomPrenom, forKey: "nomprenom")
            coder.encodeObject(self.age, forKey: "age")
            coder.encodeObject(self.localisation, forKey: "localisation")
            //coder.encodeObject(self.motif, forKey: "motif")
            coder.encodeObject(self.examen, forKey: "examen")
        }

        override init() {
            super.init()
        }
        
        init (examen1:categorieExamen) {
            examen = examen1
            //self.nomPrenom=examen1.categories[0].examens[0].value
            //self.age = Int(examen1.categories[0].examens[2].value)!
            super.init()
            
        }
        init (nomPrenom : String,age:Int,localisation:String,motif:String, masculin:Bool){
            super.init()        
            self.examen.categories[0].examens[0].value=nomPrenom
            self.masculin=masculin
            examen.categories[0].examens[2].value="\(age)"
            examen.categories[0].examens[3].value=localisation
            examen.categories[0].examens[4].value=motif
        }
    }
    var patients = [patient]()
    required convenience init?(coder decoder: NSCoder) {
        guard let patients = decoder.decodeObjectForKey("patients") as? [patient]
            else { return nil }
        
        
        
        self.init()
        self.patients=patients
        
    }
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.patients, forKey: "patients")        
        
    }

    override init() {
        let patient1 = patient(nomPrenom: "RICALENS Eric",age: 46, localisation: "Salle d'attente",motif: "Douleur thoracique",masculin: true)
        let patient2 = patient(nomPrenom: "SALAS Karine",age: 38, localisation: "Box2",motif: "Cervicalgie",masculin: false)
//        let patient3 = patient(nomPrenom: "RICALENS Tom",age: 13, localisation: "Suture",motif: "Plaie lèvre",masculin: true)
//        let patient4 = patient(nomPrenom: "Fructus fabrice",age: 47, localisation: "Degrav",motif: "Douleur Epaule",masculin: true)
        patients += [patient1,patient2]//,patient3,patient4]
    }
}

