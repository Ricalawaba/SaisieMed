//
//  Documents.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 16/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation


extension ExamTree {
    static var Documents:categorieExamen.Categorie {
        let catDocuments = categorieExamen.Categorie(nom:"Documents",namedImage: "dossier.png",showNom: true)
        let examCatDocuments : [Examen] = [
            self.Document.asExamen(),
        //    Examen(intitule: "Ajout document",type: .addinfo,tag: "document")
        ]
        catDocuments.subitems.append("document")
        catDocuments.examens=examCatDocuments
        return catDocuments
    }
    static var typeDocument:Examen {
        Donnees.selectiontextDict["dataStrtypecourrier"]=[
            "Courrier de demande de prise en charge",
            "Courrier de sortie d'hospitalisation",
            "Courrier CR de consultation",
            "Résultat biologique",
            "Electrocardiogramme",
            "Résultat Imagerie",
            "Résultat Scanner",
            "Résultat Echographie",
            "Ordonnance Médecin traitant",
            "Ordonnance Spécialiste",
            "Photographie lésion",
            "Compte rendu Imagerie",
            "Photographie patient",
            "Document administratif",
            "Document manuscrit donné au patient",
            "Document médical personnel du patient",
            "Autre document" ,
        ]
        return Examen(intitule: "Type", type: .datastr, tag: "dataStrtypecourrier")
        // return catOMS
    }
    
    static var Document:categorieExamen.Categorie {
        let catDocumentConsulte = categorieExamen.Categorie(nom:"Document ",namedImage: "dossier.png",showNom: false)
        catDocumentConsulte.startLI()
        let examCatDocumentConsulte : [Examen] = [
                 Examen(intitule: "Date", type:  .reponsecourte, tag: "date" ),
            self.typeDocument,
            Examen(intitule: "de qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "resume", type:  .reponsecourte,tag: "libre" ),
            Examen(intitule: "(image)", type:  .imagefilename ),
          //  Examen(intitule: "Ajout page",type: .addinfo,tag: "page"),
            
        ]
        catDocumentConsulte.subitems.append("page")
        catDocumentConsulte.examens=examCatDocumentConsulte
        return catDocumentConsulte
    }


}