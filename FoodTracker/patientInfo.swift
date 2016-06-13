//
//  patientInfo.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation
class patients {
    // MARK: Test
    class patient {
        var nomPrenom : String
        var age : Int
        var localisation : String
        var motif : String
        var masculin: Bool
        
        init() {
            nomPrenom=""
            age=0
            localisation=""
            motif=""
            masculin=false
        }
        init (nomPrenom : String,age:Int,localisation:String,motif:String, masculin:Bool){
            self.nomPrenom=nomPrenom
            self.age=age
            self.localisation=localisation
            self.motif=motif
            self.masculin=masculin
        }
    }
    var patients = [patient]()
    init() {
        let patient1 = patient(nomPrenom: "RICALENS Eric",age: 46, localisation: "Salle d'attente",motif: "Douleur thoracique",masculin: true)
        let patient2 = patient(nomPrenom: "SALAS Karine",age: 38, localisation: "Box2",motif: "Cervicalgie",masculin: false)
        let patient3 = patient(nomPrenom: "RICALENS Tom",age: 13, localisation: "Suture",motif: "Plaie lèvre",masculin: true)
        let patient4 = patient(nomPrenom: "Fructus fabrice",age: 47, localisation: "Degrav",motif: "Douleur Epaule",masculin: true)
        patients += [patient1,patient2,patient3,patient4]
    }
}

