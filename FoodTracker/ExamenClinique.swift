//
//  ExamenClinique.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 19/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

extension ExamTree {

    static var ExamenClinique:categorieExamen.Categorie {
        let catExamenClinique = categorieExamen.Categorie(nom:"<br>Examen Clinique",namedImage: "examenclinique.png",showNom: true)
        catExamenClinique.startLI()
        let examCatExamenClinique : [Examen] = [
            Examen(intitule: "horodatage", type:  .reponsecourte,tag: "date" ),
            self.ExamenGeneral.asExamen(),
            //self.Neurologie.asExamen(),
            self.Cardiovasculaire.asExamen(),
            self.Respiratoire.asExamen(),
            //self.Digestif.asExamen(),
            //self.Urologie.asExamen(),
            //self.ORL.asExamen(),
            //self.Locomoteur.asExamen(),
        ]
        catExamenClinique.subitems.append("Neurologie")
        catExamenClinique.subitems.append("Digestif")
        catExamenClinique.subitems.append("Urologie")
        catExamenClinique.subitems.append("ORL")
        catExamenClinique.subitems.append("Locomoteur")
        catExamenClinique.subitems.append("Cardiovasculaire")
        

        catExamenClinique.examens=examCatExamenClinique
        return catExamenClinique
    }
}