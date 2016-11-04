//
//  ECG.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 11/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

extension ExamTree {
    static var ECG : categorieExamen.Categorie {
    let CatECG = categorieExamen.Categorie(nom: "<br>ECG",namedImage: "cardio_icon.png")
    let catECGConclusion = categorieExamen.Categorie(nom: "Conclusion",namedImage: "cardio_icon.png")
    let examCatConclusion : [Examen] = [
        Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre"),
        Examen(intitule: "ECG Normal", type: .check),
        Check("ECG Anormal: trouble du rythme"),
        Check("ECG Anormal: Signes d'insufisance coronarienne"),
        Check("ECG Anormal: Insufisance coronarienne aigüe"),
        Check("ECG d'interprétation délicate, avis spécialisé souhaitable"),
        Examen(intitule: "modification électrique en comparaison au précédent", type: .ouinon),
        Examen(intitule: "Pas de troubles de la conduction ou de repolarisation", type: .check),
        Examen(intitule: "Pas de troubles du rythme", type: .check),
        Examen(intitule: "AC/FA", type: .check),
        Examen(intitule: "Extrasystolie ventriculaire", type: .check),
        Examen(intitule: "Extrasystolie auriculaire", type: .check),
        Examen(intitule: "Tachycardie sinusale", type: .check),
        Examen(intitule: "Tachycardie supraventriculaire", type: .check),
        Examen(intitule: "Bradycardie", type: .check),
        Examen(intitule: "BBG", type: .check),
        Examen(intitule: "BBD", type: .check),
        Examen(intitule: "BBD", type: .check),
        Examen(intitule: "HBAG", type: .check),
        Examen(intitule: "HBPG", type: .check),
        Examen(intitule: "Courant de lésion", type: .donnee),
        Examen(intitule: "Ischémie", type: .donnee),
        
        ]
    catECGConclusion.examens=examCatConclusion
    
    let catECG1 = categorieExamen.Categorie(nom: "Paramètres Tracé",namedImage: "cardio_icon.png")
    let examcatECG1 : [Examen] = [
        Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre"),
        Examen(intitule: "Qualité correcte", type:  .check ),
        Examen(intitule: "Tracé parasité", type:  .check ),
        Examen(intitule: "Microvoltage", type:  .check ),
        Examen(intitule: "Ligne de base instable", type:  .check ),
        Examen(intitule: "FC", type:  .donnee ),
        
        Examen(intitule: "P (mm)", type:  .donnee ),
        Examen(intitule: "P (ms)", type:  .donnee ),
        Examen(intitule: "PR (ms)", type:  .donnee ),
        Examen(intitule: "QRS (ms)", type:  .donnee ),
        Examen(intitule: "aQRS", type:  .donnee ),
        Examen(intitule: "QT", type:  .donnee ),
        Examen(intitule: "QT théorique", type:  .donnee ),
        Examen(intitule: "QTc", type:  .donnee )
    ]
    catECG1.examens = examcatECG1
    
    
    let CatECG2 = categorieExamen.Categorie(nom: "Rythme/P/PR",namedImage: "cardio_icon.png")
    let examCatECG2 : [Examen] = [
        Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre"),
        Examen(intitule: "Rythme régulier sinusal", type: .check),
        Examen(intitule: "Rythme irrégulier", type: .check),
        Examen(intitule: "non sinusal", type: .check),
        Examen(intitule: "FA (P=0)", type: .check),
        Examen(intitule: "Axe Normal (aVF et D1>0)", type: .check),
        Examen(intitule: "Axe Gauche (aVF<0 et D1>0)", type: .check),
        Examen(intitule: "Axe Droit (aVF>0 et D1<0)", type: .check),
        
        Examen(intitule: "Pas d'hypertrophie auriculaire", type: .check),
        Examen(intitule: "PR constant", type: .check),
        Examen(intitule: "PR allongé", type: .donnee),
        Examen(intitule: "PR court", type: .donnee),
        Examen(intitule: "PR et BAV", datastr:
            ["Pas de BAV","BAV 1","BAV 2 type I","BAV 2 type 2","BAV 3"]),
        
        
        
        
        ]
    CatECG2.examens=examCatECG2
    let CatECG3 = categorieExamen.Categorie(nom: "QRS",namedImage: "cardio_icon.png")
    let examCatECG3 : [Examen] = [
        Examen(intitule: "Libre", type:  .reponsecourte,tag: "libre" ),
        Examen(intitule: "QRS fins", type: .check),
        
        Examen(intitule: "Croissance R normale en précordial V1rS,V6qR", type: .check),
         Examen(intitule: "Décroissance S normale à partir de V2", type: .check),
        Examen(intitule: "QRS Larges", type: .check),
        Examen(intitule: "HVG  (SV1>23)", type: .check),
        Examen(intitule: "HVG  (SV2>25)", type: .check),
        Examen(intitule: "HVG  (RV5>33)", type: .check),
        Examen(intitule: "HVG  (R+S>35)", type: .check),


        Examen(intitule: "HVG  (RD1+SD3>25)", type: .check),
        Examen(intitule: "HVG Cornell (RV1+SV3>28H,21F)", type: .check),
        Examen(intitule: "Pas d'hypertrophie ventriculaire", type: .check),
        Examen(intitule: "BBD (aspect rsr' V1)", type: .check),
        Examen(intitule: "BBG (aspect QS V1)", type: .check),
        Examen(intitule: "HBAG (D2<0)", type: .check),
        Examen(intitule: "HBPG (D1<0)", type: .check),
        Examen(intitule: "QRS fragmentés", type: .donnee),
        Examen(intitule: "Pas d'Ondes Q suspectes", type: .check),
        Examen(intitule: "Ondes Q", type: .donnee),
        
        ]
    CatECG3.examens=examCatECG3
    
    let CatECG4 = categorieExamen.Categorie(nom: "ST",namedImage: "cardio_icon.png")
    let examCatECG4 : [Examen] = [
        Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre"),
        Examen(intitule: "ST isoélectrique", type: .check),
        Examen(intitule: "ST sus-décalé", type: .donnee),
        Examen(intitule: "Aspect de repolarisation 'masculine'", type: .check),
        Examen(intitule: "(T amples <75% QRS , sus dec precordial gauche, croissance R normale, pas d'ondes Q, V1 Normal)", type: .check),
        Examen(intitule: "Aspect de repolarisation 'précoce'", type: .check),
        Examen(intitule: "Crochetage de R de V4 a V6 (Ondes J), ST en hamac précordiales moyenne", type: .check),


        Examen(intitule: "ST sous-decalé", type: .donnee),
        Examen(intitule: "Discordance de repolarisation 'approprié'", type: .check),
        ]
    CatECG4.examens=examCatECG4
    
    let CatECG5 = categorieExamen.Categorie(nom: "T/U ",namedImage: "cardio_icon.png")
    let examCatECG5 : [Examen] = [
        Examen(intitule: "Libre", type:  .reponsecourte,tag: "libre" ),
        Examen(intitule: "Ondes T normales", type: .check),
        Examen(intitule: "Ondes T amples (>2/3 QRS)", type: .donnee),
        Examen(intitule: "Ondes T aplatis (<10% R)", type: .donnee),
        Examen(intitule: "Ondes T pointues assymétriques", type: .donnee),
        Examen(intitule: "Ondes T négative", type: .donnee),
        Examen(intitule: "Ondes U", type: .ouinon),
        ]
    CatECG5.examens=examCatECG5
    
    CatECG.examens = [
    Examen(intitule: "horodatage", type:  .reponsecourte,tag: "date" ),
    Examen(intitule: "Douleur thoracique au moment de l'examen", type: .ouinon),
    Examen(intitule: "ECG de contrôle", type: .check),
    Examen(categorie: catECGConclusion),
    Examen(intitule: "libre", type: .reponsecourte,tag: "libre"),
    Examen(categorie: catECG1),
    Examen(categorie: CatECG2),
    Examen(categorie: CatECG3),
    Examen(categorie: CatECG4),
    Examen(categorie: CatECG5),
    ExamTree.Document.asExamen(),
    
    
    ]
    return CatECG
    }
}
