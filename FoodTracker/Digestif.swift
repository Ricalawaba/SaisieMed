//
//  Digestif.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 17/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

extension ExamTree {
    static var DigestifFonctionnel:categorieExamen.Categorie {
        let catDigestifFonctionnel = categorieExamen.Categorie(nom:"Fonctionnel",namedImage: "tete_icon.png",showNom: true)
        catDigestifFonctionnel.startLI()
        let examCatDigestifFonctionnel : [Examen] = [
            OuiNon("Nausée/Vomissements"),
            OuiNon("Ballonement"),
            OuiNon("Diarrhée"),
            OuiNon("Constipation"),
            
            OuiNon("Trouble de l'apétit"),
            OuiNon("Trouble du transit"),
            Check("Alternance diarrhée / constipation"),
            Examen(intitule: "dernier repas", type:  .donnee,tag: "date" ),
            Examen(intitule: "dernières selles", type:  .donnee,tag: "date" ),
            Check("\"normale\""),
            Check("Selles moulées"),
            Check("Selles dures"),
            Check("Selles liquides"),
            Check("Selles molles"),
            Check("Selles glaireuses"),
            OuiNon("Méléna"),
            OuiNon("Rectorragie"),
            Check("coloration normale"),
            OuiNon("décoloration des selles"),
            OuiNon("Constipation"),
            OuiNon("Odeur inhabituelle"),
            
            
            ]
        catDigestifFonctionnel.examens=examCatDigestifFonctionnel
        return catDigestifFonctionnel
    }
    
    static var locAbdo:Examen {
        return Examen(intitule: "locabdo", datastr: ["épigastrique","hyponcondre droit","périombilicale","fosse iliaque droite","fosse iliaque gauche","flanc gauche","flanc droit",
            "fosse lombaire droite","fosse lombaire gauche", "lombaire", "inguinale droite", "inguinale gauche","transfixiante"].sort())

        
    }
    static var DigestifDouleur:categorieExamen.Categorie {
        let catDigestifDouleur = categorieExamen.Categorie(nom:"douleur abdominale",namedImage: "digestif_icon.png",showNom: false)
        catDigestifDouleur.startLI()
        let examCatDigestifDouleur : [Examen] = [
            Check("Abdomen globalement sensible"),
            Check("irradiation"),
            OuiNon("Douleur abdominale"),
            locAbdo,
            typeDouleur.asExamen(),
            OuiNon("irradiation"),
            locAbdo,
            locAbdo,
            locAbdo,
            OuiNon("signe de Murphy"),
            
            ]
        catDigestifDouleur.examens=examCatDigestifDouleur
        
        return catDigestifDouleur
    }
    static var Digestif:categorieExamen.Categorie {
        let catDigestif = categorieExamen.Categorie(nom:"<br>Appareil Digestif",namedImage: "digestif_icon.png",showNom: true)
        catDigestif.startNewLine()
        let examCatDigestif : [Examen] =  [
            OuiNon("Examen Normal"),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            
            ExamTree.DigestifDouleur.asExamen(),
            ExamTree.DigestifFonctionnel.asExamen(),
            Check("Abdomen souple et depressible"),
            OuiNon("Bruits hydroaériques audbles"),
            OuiNon("exacerbation des flatulences"),
            OuiNon("borborygmes"),
            Check("B.H.A. +++"),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Check("Pas de défense"),
            
            
            
            OuiNon("Ictère"),
            OuiNon("Orifices herniaires libres"),
            //self.libre,
            OuiNon("Astérixis/Flapping Tremor"),
            OuiNon("Circulation collatérale péri-ombilicale"),
            
            //self.libre,
        ]
        catDigestif.examens=examCatDigestif
        return catDigestif
    }

}