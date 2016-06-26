//
//  ExamenTree.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 24/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

struct ExamTree {
    
    // MARK: administratif
    // TODO: séparer catégorie
    static var administratif: categorieExamen.Categorie {
        let Categorie1 = categorieExamen.Categorie(nom: "Administratif",namedImage: "administratif_icon.png")
        
        let catModeVie = categorieExamen.Categorie(nom: "Mode de vie",namedImage: "administratif_icon.png")
        let excamCatModeVie = [
            Examen(intitule: "à son domicile", type:  .check ),
            Examen(intitule: "en institution", type:  .check ),
            Examen(intitule: "en maison de retraite", type:  .check ),
            Examen(intitule: "en maison médicalisée", type:  .check ),
            Examen(intitule: "avec sa famille", type:  .check ),
            Examen(intitule: "seul", type:  .check ),
            Examen(intitule: "en couple", type:  .check ),
            Examen(intitule: "Veuf(ve)", type:  .check ),
            Examen(intitule: "Pas d'enfants", type:  .check ),
            Examen(intitule: "enfants:", type:  .donnee ),
            Examen(intitule: "Libre", type:  .reponsecourte )
        ]
        catModeVie.examens=excamCatModeVie
        let catModeEntree = categorieExamen.Categorie(nom: "Mode d'entrée",namedImage: "administratif_icon.png")
        let excamCatModeEntree = [
            Examen(intitule: "adressé par le centre 15", type:  .check ),
            Examen(intitule: "adressé par", type:  .check ),
            Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"),
            Examen(intitule: "se présente spontanément", type:  .check ),
            Examen(intitule: "n'a pas vu de médecin avant sa venue aux urgences", type:  .check ),
            Examen(intitule: "a contacté son médecin avant sa venue aux urgences", type:  .check ),
            Examen(intitule: "médicalisé par le SMUR", type:  .check ),
            Examen(intitule: "Médecin SMUR", type:  .selection ,tag: "medecin"),
            Examen(intitule: "Transporté par les Pompiers", type:  .check ),
            Examen(intitule: "Transporté par ambulance", type:  .check ),
             Examen(intitule: "non médicalisé", type:  .check ),
            Examen(intitule: "Amené par la Famille", type:  .ouinon ),
            ]
        catModeEntree.examens=excamCatModeEntree
        
        
        let catConnu = categorieExamen.Categorie(nom: "Connu de la clinique:",namedImage: "Homme.png")
        let examCatConnu = [
            Examen(intitule: "Non", type:  .check ),
            Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"),
            Examen(intitule: "Ajout médecin",type: .addinfo,tag: "medecin"),
            Examen(intitule: "Libre", type:  .reponsecourte )
        ]
        catConnu.examens=examCatConnu
        
        
        let examcat1 = [
            Examen(intitule: "Nom Prénom", type:  .reponsecourte),
            Examen(intitule: "Masculin", type:  .ouinon),
            Examen(intitule: "Age", type:  .donnee),
            Examen(intitule: "Localisation", type:  .selection, tag: "localisation"),
            Examen(categorie: ExamTree.motif),
            Examen(intitule: "Méd.Trait.", type:  .selection ,tag: "medecin"),
            Examen(categorie: catModeEntree),
            Examen(categorie: catModeVie),
            Examen(intitule: "Profession", type:  .selection ,tag: "profession"),
            Examen(categorie: catConnu),
            Examen(intitule: "Libre", type:  .reponsecourte )
            
        ]
        Categorie1.examens = examcat1
        return Categorie1
    }
    
    // MARK: atcd
    static var atcd:categorieExamen.Categorie {
        let catATCD = categorieExamen.Categorie(nom:"atcd",namedImage: "nurse_icon.png",showNom: false)
        let examCatATCD = [
            Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            Examen(intitule: "bilatéral(e)", type:  .check ),
            Examen(intitule: "droit(e)", type:  .check ),
            Examen(intitule: "gauche", type:  .check ),
            Examen(intitule: "récidivant(e)s", type:  .check ),
            Examen(intitule: "probable", type:  .check ),
            Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
            Examen(intitule: "ou ?", type:  .selection,tag: "etablissement" ),
            Examen(intitule: "pas de suivi spécialisé", type:  .check ),
            Examen(intitule: "qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "Commentaire", type:  .reponsecourte )
        ]
        catATCD.examens=examCatATCD
        return catATCD
    }

     static var TTT:categorieExamen.Categorie {
        let catTTT = categorieExamen.Categorie(nom:"Traitement",namedImage: "medoc_icon.png",showNom: false)
        let examCatTTT = [
            Examen(intitule: "Nom", type:  .selection,tag: "medicament" ),
            Examen(intitule: "Posologie", type:  .selection,tag: "posologie" ),
            Examen(intitule: "depuis quand ?", type:  .reponsecourte,tag: "date" ),
            Examen(intitule: "par qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "pour", type:  .selection,tag: "atcd" ),

            Examen(intitule: "libre", type:  .reponsecourte )
        ]
        catTTT.examens=examCatTTT
        return catTTT
    }
 static var LocAnat:categorieExamen.Categorie {
        let catLocAnat = categorieExamen.Categorie(nom:"Loc.  anatomique",namedImage: "os_icon.png",showNom: false)
        let examCatLocAnat = [
            Examen(intitule: "inférieur", type:  .check ),
            Examen(intitule: "supérieur", type:  .check ),
            Examen(intitule: "droit(e)", type:  .check ),
            Examen(intitule: "gauche", type:  .check ),
            Examen(intitule: "bilatéral(e)", type:  .check ),
        ]
        catLocAnat.examens=examCatLocAnat
        return catLocAnat
    }
    static var motif:categorieExamen.Categorie {
        let catMotif = categorieExamen.Categorie(nom:"Motif(s)",namedImage: "tete_icon.png",showNom: false)
        let examCatMotif = [
            Examen(intitule: "motif", type:  .selection,tag: "motif" ),
            Examen(categorie: self.LocAnat),
            Examen(intitule: "Libre", type: .reponsecourte),
            
            Examen(intitule: "Ajout motif",type: .addinfo,tag: "motif"),
        ]
        catMotif.examens=examCatMotif
        return catMotif
    }
 
 static var Plainte:categorieExamen.Categorie {
        let catPlainte = categorieExamen.Categorie(nom:"Plainte",namedImage: "tete_icon.png",showNom: false)
        let examCatPlainte = [
            Examen(intitule: "Signe", type:  .selection,tag: "motif" ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(categorie: LocAnat),
            Examen(intitule: "aigüe", type:  .check ),
            Examen(intitule: "sub-aigüe", type:  .check ),
            Examen(intitule: "intense", type:  .check ),
            Examen(intitule: "persistante", type:  .check ),
            Examen(intitule: "d'évolution progressive", type:  .check ),
            Examen(intitule: "avec crises paroxystiques", type:  .check ),
            Examen(intitule: "début le", type:  .donnee,tag: "date" ),
            Examen(intitule: "Libre", type:  .reponsecourte ),

        ]
        catPlainte.examens=examCatPlainte
        return catPlainte
    }
 static var FRCV:categorieExamen.Categorie {
        let catFRCV = categorieExamen.Categorie(nom:"Facteurs de risques CV",namedImage: "cardio_icon.png",showNom: false)
        let examCatFRCV = [
            Examen(intitule: "HTA", type:  .ouinon ),
            Examen(intitule: "Dyslipémie", type:  .ouinon ),
            Examen(intitule: "Diabète", type:  .ouinon ),
            Examen(intitule: "Obesité", type:  .ouinon ),
            Examen(intitule: "Surcharge pondérale", type:  .ouinon ),
            Examen(intitule: "Tabagisme", type:  .ouinon ),
            Examen(intitule: "Tabagisme sevré", type:  .check ),
            Examen(intitule: "Morbidité cardiovasculaire familiale", type:  .ouinon ),
            Examen(intitule: "Detail", type:  .reponsecourte ),
        ]
        catFRCV.examens=examCatFRCV
        return catFRCV
    }
    
 static var Comorbidite:categorieExamen.Categorie {
        let catComorbidite = categorieExamen.Categorie(nom:"Comorbidité/Antécédents",namedImage: "nurse_icon.png",showNom: true)
        let examCatComorbidite = [
            Examen(intitule: "Pas d'atcds notables", type:  .check ),
            Examen(intitule: "Pas sous anti-coagulant", type:  .check ),
            Examen(intitule: "Pas sous anti-agrégant", type:  .check ),
            Examen(categorie: ExamTree.FRCV),
            Examen(intitule: "Allergie connue", type:  .ouinon ),
            Examen(intitule: "Detail", type:  .reponsecourte ),
            Examen(categorie: ExamTree.atcd),
            Examen(intitule: "Ajout atcd",type: .addinfo,tag: "atcd")
        ]
        catComorbidite.examens=examCatComorbidite
        return catComorbidite
    }
 static var Traitement:categorieExamen.Categorie {
        let catTraitement = categorieExamen.Categorie(nom:"Traitement",namedImage: "medoc_icon.png",showNom: true)
        let examCatTraitement = [
            Examen(intitule: "Pas de traitement au long cours", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(categorie: ExamTree.TTT),
            Examen(intitule: "Ajout traitement",type: .addinfo,tag: "TTT")
        ]
        catTraitement.examens=examCatTraitement
        return catTraitement
    }
    
 static var Poids:categorieExamen.Categorie {
        let catPoids = categorieExamen.Categorie(nom:"Poids/Taille",namedImage: "nurse_icon.png",showNom: false)
        let examCatPoids = [
            Examen(intitule: "Taille", type:  .donnee, tag: "taille" ),
            Examen(intitule: "Poids (estimé)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Poids (mesuré)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Poids (indiqué par le patient)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Variation pondérale récente significative", type:  .ouinon ),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            ]
        catPoids.examens=examCatPoids
        return catPoids
    }

 static var TA:categorieExamen.Categorie {
        let catTA = categorieExamen.Categorie(nom:"Tension artérielle",namedImage: "nurse_icon.png",showNom: false)
        let examCatTA = [
            Examen(intitule: "TA", type:  .donnee ,tag :"tension"),
            Examen(intitule: "TA bras droit", type:  .donnee ,tag :"tension"),
            Examen(intitule: "TA bras gauche", type:  .donnee ,tag :"tension"),

        ]
        catTA.examens=examCatTA
        return catTA
    }

    
 static var Pancarte:categorieExamen.Categorie {
        let catPancarte = categorieExamen.Categorie(nom:"Pancarte",namedImage: "pancarte_icon.png",showNom: true)
        let examCatPancarte = [
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(categorie: self.TA),
            Examen(intitule: "FC", type:  .donnee,tag: "FC" ),
            Examen(intitule: "T°", type:  .donnee ),
            Examen(intitule: "EVA", type:  .donnee,tag: "EVA" ),
            Examen(intitule: "SaO2%", type:  .donnee, tag: "sao2" ),
            Examen(intitule: "Fr. Resp", type:  .donnee ,tag: "fresp"),
            Examen( categorie: self.Poids ),
            Examen(intitule: "Dernier repas", type:  .reponsecourte, tag: "date" ),
            ]
        
        
        catPancarte.examens=examCatPancarte
        return catPancarte
    }
    
}