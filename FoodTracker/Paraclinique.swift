//
//  Paraclinique.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 19/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

extension ExamTree {
    
    
    static var Paraclinique:categorieExamen.Categorie {
        let catParaclinique = categorieExamen.Categorie(nom: "Examens Paracliniques",namedImage: "imagerie_icon.png")
        let examCatParaclinique : [Examen] = [
            
            //Examen(intitule: "Ajout Radiologie",type: .addinfo,tag: "radiologie")
        ]
        
        
        catParaclinique.subitems=["ECG"]
        catParaclinique.subitems.append("Biologie")
        catParaclinique.subitems.append("Gazometrie")
        catParaclinique.subitems.append("Bandelette")
        catParaclinique.subitems.append("Imagerie")
        catParaclinique.examens=examCatParaclinique

        return catParaclinique
    }
 static var Bandelette:categorieExamen.Categorie {
        let catBandelette = categorieExamen.Categorie(nom:"Bandelette Urinaire",namedImage: "nurse_icon.png",showNom: true)
        let examCatBandelette = [
            Check("En cours"),
            Examen(intitule: "normale", type: .check),
            Examen(intitule: "Sang", type: .donnee),
            Examen(intitule: "Leucocytes", type: .donnee),
            Examen(intitule: "Nitrites", type: .donnee),
            Examen(intitule: "Corps cétoniques", type: .donnee),
            Examen(intitule: "ECBU demandé", type: .check),
        ]
        catBandelette.examens=examCatBandelette
        return catBandelette
    }
    static var Biologie:categorieExamen.Categorie {
        let catBiologie = categorieExamen.Categorie(nom:"Biologie",namedImage: "piqure_icon.png",showNom: true)
        catBiologie.startNewLine()
        let examCatBiologie : [Examen] = [
            Check("En cours"),
            Check("Bilan normal"),
            Check("Hémogramme normal"),
            Examen(intitule: "Hémoglobine", type: .donnee),
            Examen(intitule: "Leucocytes", type: .donnee),
            Examen(intitule: "Plaquettes", type: .donnee),
            OuiNon("Insuffisance rénale"),
            Examen(intitule: "Créatinémie", type: .donnee),
            Examen(intitule: "Clairance", type: .donnee),
            Examen(intitule: "Sodium (Na)", type: .donnee),
            Examen(intitule: "Potassium (K)", type: .donnee),
            OuiNon("Syndrome inflammatoire"),
            Examen(intitule: "Proteine C Réactive (CRP)", type: .donnee),
            Examen(intitule: "Fibrinogène", type: .donnee),
            Examen(intitule: "Procalcitonine", type: .donnee),
            Check("Bilan hépatique normal"),
            OuiNon("Cytolyse"),
            Examen(intitule: "ASAT (TGO)", type: .donnee),
            Examen(intitule: "ALAT (TGP)", type: .donnee),
            
            OuiNon("Cholestase"),
            Examen(intitule: "Bilirubine", type: .donnee),
            Examen(intitule: "Phosphatases Alcalines", type: .donnee),
            Examen(intitule: "ɣGT", type: .donnee),
            
            Check("Enzymes cardiaques normales"),
            Examen(intitule: "Troponine", type: .donnee),
            Examen(intitule: "Pro-BNP", type: .donnee),
            Examen(intitule: "BNP", type: .donnee),
            Examen(intitule: "D-Dimères", type: .donnee),
            Examen(intitule: "Myoglobine", type: .donnee),
            
            Check("Euthyroïdie"),
            Examen(intitule: "TSH", type: .donnee),
            Examen(intitule: "T4L", type: .donnee),
            Examen(intitule: "T3", type: .donnee),
            
            
            // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catBiologie.examens=examCatBiologie
        return catBiologie
    }
}