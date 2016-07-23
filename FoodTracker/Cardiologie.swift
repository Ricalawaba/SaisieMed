
//
//  Cardiologie.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 11/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

extension ExamTree {
    
    // MARK: Cardiologie Principal
    static var cardioPouls:categorieExamen.Categorie {
        let catcardioPouls = categorieExamen.Categorie(nom:"Pouls",namedImage: "cardio_icon.png",showNom: true)
        catcardioPouls.startLI()
        let examCatcardioPouls :   [Examen] = [
            Check("fémoral présent symétrique"),
            Check("fémoraux assymétriques"),
            Check("radial présent symétrique"),
            Check("radial assymétriques"),
            Check("poplité présent symétrique"),
            Check("poplité assymétrique"),
            Check("pédieux présent symétrique"),
            Check("tibial postérieur symétrique"),
            
            ]
        catcardioPouls.examens=examCatcardioPouls
        return catcardioPouls
    }
    
    static var Cardiovasculaire:categorieExamen.Categorie {
        let catCardiovasculaire = categorieExamen.Categorie(nom:"<br>Appareil cardiovasculaire",namedImage: "cardio2_icon.png",showNom: true)
        catCardiovasculaire.startNewLine()
        let examCatCardiovasculaire : [Examen] = [
            Check("Examen Normal"),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            ExamTree.CardioFonctionnel.asExamen(),
            ExamTree.CardioAuscultation.asExamen(),
            ExamTree.cardioPouls.asExamen(),
            OuiNon("Turgescence jugulaire"),
            OuiNon("Oedème des Mb inférieurs"),
            Check("Hyperpigmentation en chaussettes (dermite ocre)"),
            Check("Mollets souples et indolore"),
            //self.libre,
        ]
        catCardiovasculaire.examens=examCatCardiovasculaire
        return catCardiovasculaire
    }
    static var CardioAuscultation:categorieExamen.Categorie {
        let catCardioAuscultation = categorieExamen.Categorie(nom:"<br>auscultation",namedImage: "cardio2_icon.png",showNom: true)
        catCardioAuscultation.startLI()
        let examCatCardioAuscultation   : [Examen] = [
            Check("BDC régulier"),
            Check("BDC irrégulier"),
            Check("Pas de souffle cardiaque"),
            Examen(intitule: "Souffle cardiaque", type:  .donnee ),
            OuiNon("Souffle carotidien"),
            OuiNon("Souffle abdominal"),
            OuiNon("Souffle fémoral"),
            OuiNon("Souffle carotidien"),
            Check("Pas de crépitants"),
            Check("Rales crépitants aux bases"),
            Check("Rales crépitants étendues"),
            ]
        catCardioAuscultation.examens=examCatCardioAuscultation
        return catCardioAuscultation
    }
    static var typeDouleurThoracique:categorieExamen.Categorie {
        let cattypeDouleurThoracique = categorieExamen.Categorie(nom:"typeDouleurThoracique",namedImage: "cardio2_icon.png",showNom: false)
        cattypeDouleurThoracique.formatPreString=""
        let examCattypeDouleurThoracique   : [Examen] = [
            Examen(intitule: "loc. douleur thoracique", datastr: ["épigastrique","basithoracique","latérothoracique","rétrosternale haute","précordiale","antérieure","postérieure"].sort() ),
            
            Examen(intitule: "type douleur thoracique", datastr: ["en barre","en étau","en coup de poignard","en pointe","type brulure","type oppression"].sort() ),
            typeDouleur.asExamen(),
            Check("isolée, sans irradiation \"coronarienne\""),
            Check("Irradiation membre supérieur gauche"),
            Check("Irradiation membre supérieur droit"),
            Check("Irradiation dans le cou"),
            Check("transfixiante"),
            Check("fixe"),
            Check("mobile dans le temps"),
            OuiNon("épisode de douleur similaire dans le passé"),
            
            Examen(intitule: "Détail", type:  .reponsecourte ),
            
            ]
        cattypeDouleurThoracique.examens=examCattypeDouleurThoracique
        return cattypeDouleurThoracique
    }
    
    static var CardioFonctionnel:categorieExamen.Categorie {
        let catCardioFonctionnel = categorieExamen.Categorie(nom:"Fonctionnel",namedImage: "cardio_icon.png",showNom: true)
        catCardioFonctionnel.startLI()
        let examCatCardioFonctionnel   : [Examen] = [
            OuiNon("Douleur thoracique"),
            typeDouleurThoracique.asExamen(),
            OuiNon("Palpitations"),
            OuiNon("Dyspnée"),
            OuiNon("Dyspnée de décubitus (orthopnée)"),
            Examen(intitule: "Classification NYHA ", datastr: ["NYHA 1 (Aucune gène fonctionnelle)","NYHA 2 (gène à l'effort seulement)","NYHA 3 (gène à l'effort modérée)","NYHA 4 (gène au moindre effort)"].sort() ),
            OuiNon("Claudication intermittente"),
            Examen(intitule: "toux", datastr:
                [ "Pas de toux","toux productive","toux irritative","toux rauque","toux quinteuse","toux dyspnéisante"
                ]),
            Examen(intitule: "expectorations", datastr:
                ["Pas d'expectorations","Expectorations glaireuses","Expectorations sanguinolantes","expectorations aérées mousseuse","expectorations sales nauséabondes"])
            ]
        catCardioFonctionnel.examens=examCatCardioFonctionnel
        return catCardioFonctionnel
    }
}