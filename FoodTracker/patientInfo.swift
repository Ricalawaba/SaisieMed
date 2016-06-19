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
        var nomPrenom : String
        var age : Int
        var localisation : String
        var motif : String
        var masculin: Bool
        var examen=categorieExamen()
        
        // MARK: NSCoding
        required convenience init?(coder decoder: NSCoder) {
            guard let nomPrenom = decoder.decodeObjectForKey("nomprenom") as? String,
                let age = decoder.decodeObjectForKey("age") as? Int,
                let localisation = decoder.decodeObjectForKey("localisation") as? String,
                let motif = decoder.decodeObjectForKey("motif") as? String
                                else { return nil }
            
            //let masculin = decoder.decodeBoolForKey("masculin")
            let examen = decoder.decodeObjectForKey("examen") as? categorieExamen
            let masc=false

            self.init(nomPrenom: nomPrenom,age: age,localisation: localisation,motif: motif, masculin: masc)
            self.examen=examen!
            
        }
        func encodeWithCoder(coder: NSCoder) {
            coder.encodeObject(self.nomPrenom, forKey: "nomprenom")
            coder.encodeObject(self.age, forKey: "age")
            coder.encodeObject(self.localisation, forKey: "localisation")
            coder.encodeObject(self.motif, forKey: "motif")
            //coder.encodeObject(self.masculin, forKey: "masculin")
            coder.encodeObject(self.examen, forKey: "examen")

            
        }

        override init() {
            
            nomPrenom=""
            age=0
            localisation=""
            motif=""
            masculin=false
            super.init()
        }
        init (nomPrenom : String,age:Int,localisation:String,motif:String, masculin:Bool){
            
            self.nomPrenom=nomPrenom
            self.age=age
            self.localisation=localisation
            self.motif=motif
            self.masculin=masculin
            self.examen.categories[0].examens[0].value=nomPrenom
            if masculin == true {
                examen.categories[0].examens[1].value="0"
            } else {
                examen.categories[0].examens[1].value="1"
            }
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

