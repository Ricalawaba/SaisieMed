
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
        let catcardioPouls = categorieExamen.Categorie(nom:"<br>Pouls",namedImage: "cardio_icon.png",showNom: true)
        catcardioPouls.startLI()
        let examCatcardioPouls :   [Examen] = [
            Check("Pouls filant"),
            Check("Pouls bien tapés"),
            Check("Pouls fémoraux et tibiaux présents symétriques"),
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
    static var cardioVeine:categorieExamen.Categorie {
        let catcardioVeine = categorieExamen.Categorie(nom:"Etat veineux",namedImage: "nurse_icon.png",showNom: true)
        let examCatcardioVeine = [
            Check("Etat veineux satisfaisant"),
            Examen(intitule: "Mollets", datastr: [
                "Mollets souples et indolore","Dimininution du ballant du mollet à gauche","Diminution du ballant du mollet à droite"
                ].sort() ),
            Check("Homans positif"),
            Check("Homans négatif"),
            Check("Douleur localisée oedématié"),
            //Check(),
            
            Check("Etat veineux et cutané précaire"),
            Check("Dilatations variqueuses"),
            Check("Phlébectasies de stase"),
            Check("Hyperpigmentation en chaussettes (dermite ocre)"),
            Check("Hypodermite de stase"),
            Check("Placard inflammatoire algique compatible avec une thrombophlébite superficielle"),
            Check("Atrophie blanche de Millian"),
            Check("Lésions eczémateuses"),
            Check("Pas d'ulcère"),
            Check("Ulcère variqueux (indolore)"),
            Check("Ulcère artériel"),
            ]
        catcardioVeine.examens=examCatcardioVeine
        return catcardioVeine
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
            ExamTree.cardioVeine.asExamen(),
            OuiNon("Turgescence jugulaire spontannée en position demi assise"),
            OuiNon("Reflux hépato-jugulaire"),
            OuiNon("Oedème des Mb inférieurs"),
            Check("Frémissement palpatoire xyphoïdien (Signe de harzer, HVD?)"),
            
            
            
            //self.libre,
        ]
        catCardiovasculaire.examens=examCatCardiovasculaire
        return catCardiovasculaire
    }
    static var CardioAuscultation:categorieExamen.Categorie {
        let catCardioAuscultation = categorieExamen.Categorie(nom:"<br>auscultation",namedImage: "cardio2_icon.png",showNom: true)
        //catCardioAuscultation.startLI()
       // let anexamen=Examen(intitule: "doc souffle", type: Examen.ExamenEnum.documentinfo)
     //   anexamen.value="Souffle cardiaque - Arbre décisionnel.png"
       // anexamen.value="fracture_femur.png"
        let examCatCardioAuscultation   : [Examen] = [
            Examen(intitule: "doc souffle", imageName: "Souffle cardiaque - Arbre décisionnel.png"),
            Check("BDC régulier"),
            Check("BDC irrégulier"),
            Examen(intitule: "souffle", datastr: [
                "Pas de souffle cardiaque audible",
                "Souffle systolique",
                "Souffle diastolique",
                "Souffle mésosystolique",
                "Souffle mésodiastolique",
                "Souffle holosystolique",
                "Souffle holodiastolique",
                "Souffle télésystolique",
                "Souffle télédiastolique",
                ].sort() ),
            Examen(intitule: "intensité souffle", datastr: [
                "1/6",
                "2/6",
                "3/6",
                "4/6",
                "5/6",
                "6/6",
                ].sort() ),
            Examen(intitule: "foyer auscultatoire", datastr: [
                "Foyer aortique",
                "Foyer mitral",
                "Foyer tricuspidien",
                "Foyer pulmonaire",
                
                ].sort() ),
            Examen(intitule: "Irradiation", datastr: [
                "sans irradiation",
                "irradiation carotidienne",
                "irradiation en rayon de roue",
                "irradiation bord gauche du sternum",
                "irradiation axillaire",
                "",
                ].sort() ),

            
            OuiNon("Souffle carotidien"),
            OuiNon("Souffle abdominal"),
            OuiNon("Souffle fémoral"),
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