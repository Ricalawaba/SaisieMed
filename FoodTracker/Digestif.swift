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
        let catDigestifFonctionnel = categorieExamen.Categorie(nom:"<br>Fonctionnel",namedImage: "tete_icon.png",showNom: true)
        //catDigestifFonctionnel.startLI()
        let examCatDigestifFonctionnel : [Examen] = [
            OuiNon("Anorexie"),
            OuiNon("Nausée/Vomissements"),
            Examen(intitule: "type vomissements", datastr: ["vomissement alimentaire","vomissement de suc gastrique(incolore)","vomissement bileux (jaune)","vomissement fécaloïde","vomissement sanglant","vomissement noirâtre"].sort() ),
            OuiNon("Vomissement en jet"),
            OuiNon("Ballonement"),
            OuiNon("Trouble de l'apétit"),
            OuiNon("Trouble du transit"),
            OuiNon("Diarrhée"),
            OuiNon("Constipation"),
            Check("Alternance diarrhée / constipation"),
            Examen(intitule: "dernier repas", type:  .donnee,tag: "date" ),
            Examen(intitule: "dernières selles", type:  .donnee,tag: "date" ),
            Examen(intitule: "consistance selles", datastr: ["","\"normales\"","Selles moulées","Selles dures","Selles liquides","Selles molles","Selles glaireuses"].sort() ),
            Examen(intitule: "coloration selles", datastr: ["de couleur \"normale\"","de couleur foncée","de couleur claire","de couleur noirâtre (méléna)","de couleur rougeatres","sanglantes (rectorragie)"].sort() ),
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
            OuiNon("signe de Murphy"),
            
            ]
        catDigestifDouleur.subitems.append("locabdo")
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
            Check("Abdomen souple et dépressible"),
             Check("Pas de défense"),
             Check("Silence auscultatoire"),
            OuiNon("Bruits hydroaériques audibles"),
            OuiNon("borborygmes"),
            OuiNon("Météorisme"),
            OuiNon("exacerbation des flatulences"),
            
            Check("B.H.A. +++"),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
           
            
            
            
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