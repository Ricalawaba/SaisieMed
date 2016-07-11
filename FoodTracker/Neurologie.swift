//
//  Neurologie.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 10/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

extension ExamTree {
    
        // MARK: Neurologie Principal
    static var Neurologie:categorieExamen.Categorie {
        let catNeurologie = categorieExamen.Categorie(nom:"<br>Examen neurologique",namedImage: "neuro_icon.png",showNom: true)
        catNeurologie.startLI()
        let examCatNeurologie = [
            Check("Examen Normal"),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            ExamTree.neuroFonctionnel.asExamen(),
            ExamTree.neuroReflexes.asExamen(),
            Check("Pas de signe de localisation"),
            //self.libre,
        ]
        catNeurologie.examens=examCatNeurologie
        return catNeurologie
    }
        // MARK: Neurologie Fonctionnels
    static var neuroFonctionnel:categorieExamen.Categorie {
        let catneuroFonctionnel = categorieExamen.Categorie(nom:"Fonctionnels",namedImage: "tete_icon.png",showNom: true)
        // catneuroFonctionnel.startLI()
        let examCatneuroFonctionnel = [
            Check("Communication normale" ),
            Check("Pas de communication" ),
            Check("Communication altérée" ),
            Check("Compréhension difficile" ),
            Check("Conscient" ),
            Check("Orienté" ),
            Check("Ralentissement psychomoteur" ),
            Examen(intitule: "Glasgow", type:  .donnee , tag: "glasgow"),
            OuiNon("D.T.S."),
            OuiNon("Confusion"),
            OuiNon("Céphallée"),
            OuiNon("Troubles du langage"),
            OuiNon("Photophobie"),
            OuiNon("Troubles de la marche"),
            
            OuiNon("Troubles visuels"),
            OuiNon("Troubles Cognitifs"),
            OuiNon("Vertiges"),
            //self.libre,
            // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
            
        ]
        catneuroFonctionnel.examens=examCatneuroFonctionnel
        return catneuroFonctionnel
    }
     static var neuroMusculaire:categorieExamen.Categorie {
        let catneuroMusculaire = categorieExamen.Categorie(nom:"neuroMusculaire",namedImage: "neuro_icon.png",showNom: false)
        let examCatneuroMusculaire = [
            OuiNon("Amyotrophie"),
            LocAnat.asExamen(),
            regionAnat,
            
            Examen(intitule: "libre", type:  .reponsecourte ),
            Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catneuroMusculaire.examens=examCatneuroMusculaire
        return catneuroMusculaire
    }

    
      // MARK: Neurologie Examen clinique
     static var Occulomotricite:categorieExamen.Categorie {
        let catOcculomotricite = categorieExamen.Categorie(nom:"Occulomotricite",namedImage: "<#image#>",showNom: false)
        let examCatOcculomotricite = [
            Check("Occulomotricité normale"),
            Check("Nystagmus droit"),
            Check("Nystagmus gauche"),
            Check("Convergence occulaire normale"),
            Check("Paralysie abduction oeil droit"),
            Check("Paralysie abduction oeil gauche"),
            Check("Paralysie adduction oeil droit"),
            Check("Paralysie adduction oeil gauche"),
            OuiNon("Diplopie"),
           
            Check("Anisocorie"),
            Check("Pupilles intermédiaires"),
            Check("Pupilles en Myosis"),
            Check("Pupilles en Mydriase"),
            Check("réactives"),
            Check("Réflexes photomoteurs présents"),

            
        ]
        catOcculomotricite.examens=examCatOcculomotricite
        return catOcculomotricite
    }

    static var neuroReflexes:categorieExamen.Categorie {
        let catneuroReflexes = categorieExamen.Categorie(nom:"<br>clinique:",namedImage: "neuro_icon.png",showNom: true)
        //catneuroReflexes.startLI()
        let examCatneuroReflexes = [
            Check("ROT symétriques"),
            detailROT("Réflexe rotulien"),
            detailROT("Réflexe bicipital"),
            detailROT("Réflexe achilléen"),
            detailROT("Réflexe tricipital"),
            detailROT("Réflexe radial"),
            Check("Hyporéflexie"),
            Check("Hyperréflexie"),
            Check("Réflexes cutanés plantaires en flexion"),
            Check("Réflexes cutanés plantaires indifférents"),
            
            Check("Babinski"),
            LocAnat.asExamen(),
            Occulomotricite.asExamen(),
           

            LocAnat.asExamen(),
            OuiNon("Dysmétrie (epreuve doigt-nez)"),
            OuiNon("Ataxie statique (Romberg)"),
            
            
            OuiNon("Ataxie (marche yeux fermés)"),
            OuiNon("Déficit sensitivomoteur"),
            //self.libre,
            //  Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catneuroReflexes.examens=examCatneuroReflexes
        return catneuroReflexes
    }
    
    static func detailROT(intitule: String = "Détail")-> Examen {
        
        Donnees.selectiontextDict["dataStrdetailROT"]=[
            " symétrique","assymétrique","hypotonique à gauche", "aboli à gauche","hypotonique à droite", "aboli à droite",
            "hyperrefléxie gauche","hyperrefléxie droite","polycinétique à gauche", "polycinétique à droite","pendulaire",
            " vif symétrique"
            ].sort()
        
        return Examen(intitule: intitule, type: .datastr, tag: "dataStrdetailROT")
    }

}