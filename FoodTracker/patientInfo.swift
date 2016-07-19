//
//  patientInfo.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

func stringFromTimeInterval(interval: NSTimeInterval) -> String {
    let interval = Int(interval)
    _ = interval % 60
    let minutes = (interval / 60) % 60
    let hours = (interval / 3600)
    return String(format: "%02d:%02d", hours, minutes)
}

class patients :  NSObject,NSCoding {
    
    class patient :  NSObject,NSCoding {
        // MARK: Properties
        var timestamp=NSDate()
        var waitingStr: String {
            get {
                return stringFromTimeInterval(NSDate().timeIntervalSinceDate(timestamp))
                
            }
        }
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
                return Int(examen.categories[0].examens[2].value) ?? 0
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
                return examen.categories[0].examens[4].categorie!.UIString()

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
        func getDocuments() -> [String] {
            var documents: [String]=[]
            for cat in self.examen.categories {
                documents.appendContentsOf(cat.getDocuments())
            }
            return documents
        }
        var examen=categorieExamen()
        
        // MARK: Autodescription
        func DetailedString()-> String {
            var retStr = ""
            retStr = "<H2>\(self.nomPrenom), \(self.age) ans</H2>"
            for  cat in self.examen.categories
            {
                if cat.nom == "Administratif" {
                    var AdminStr=""
                    var sexe:String!
                    let nom:String = cat.examens[0].value
                    if self.masculin { sexe="Homme" }
                                else {sexe="Femme"}
                    
                    AdminStr += "<h2>Synthèse médicale</h2><p>\(nom), \(sexe),\(self.age) ans"
                    //let motif=cat.examens[4].categorie!.detailString()
                    if !motif.isEmpty { AdminStr += "<li><b><u>Motif:</u></b> <b>\(motif)</b>" }
                    
                    let medTraitant=cat.examens[5].value
                    if !medTraitant.isEmpty { AdminStr += "<li><u>Médecin traitant:</u> \(medTraitant)" }
                    
                    let modevie=cat.examens[7].categorie!.formattedDetaiString()
                    if !modevie.isEmpty {
                        AdminStr += "<li><u>Mode de vie:</u> \(modevie)"
                    }
                    let modeentree=cat.examens[6].categorie!.formattedDetaiString()
                    if !modeentree.isEmpty {
                        AdminStr += "<li><u>Mode d'entrée:</u> \(modeentree)"
                    }
                    let connuProfession=cat.examens[8].value
                    if !connuProfession.isEmpty {
                        AdminStr += "<li><u>Profession:</u> \(connuProfession)"
                    }
                    let connuClinique=cat.examens[9].categorie!.formattedDetaiString()
                    if !connuClinique.isEmpty {
                        AdminStr += "<li><u>Connu de la clinique:</u> \(connuClinique)"
                    }
                    
                    retStr += AdminStr
                } else {
                    let detailstr = cat.formattedDetaiString()
                    if !detailstr.isEmpty {
                        retStr += "<p><b><u>\(cat.nom)</u></b>\(detailstr)"
                    }
                }
            }
          
            return retStr
        }
        // MARK: NSCoding
        required convenience init?(coder decoder: NSCoder) {
            guard let examen = decoder.decodeObjectForKey("examen") as? categorieExamen,
                    aDate=decoder.decodeObjectForKey("timestamp") as? NSDate
                                else { return nil }
            self.init(examen1: examen)
            self.timestamp=aDate
        }
        func encodeWithCoder(coder: NSCoder) {
            coder.encodeObject(self.nomPrenom, forKey: "nomprenom")
            coder.encodeObject(self.age, forKey: "age")
            coder.encodeObject(self.localisation, forKey: "localisation")
            coder.encodeObject(self.timestamp, forKey: "timestamp")
            
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
        var examenCliniqueCat:categorieExamen.Categorie {
            return examen.categories[5]
        }
        var documentsCat:categorieExamen.Categorie {
            return examen.categories[9]
        }
        var suiviCat:categorieExamen.Categorie {
            return examen.categories[7]
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
 //       let patient2 = patient(nomPrenom: "SALAS Karine",age: 38, localisation: "Box2",motif: "Cervicalgie",masculin: false)
//        let patient3 = patient(nomPrenom: "RICALENS Tom",age: 13, localisation: "Suture",motif: "Plaie lèvre",masculin: true)
        let patient4 = patient(nomPrenom: "Fructus fabrice",age: 47, localisation: "Degrav",motif: "Douleur Epaule",masculin: true)
        patients += [patient1,patient4]//,patient3,patient4]
    }
    
}

