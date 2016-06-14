//
//  categorieExamen.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

class Examen {
    var intitule : String
    enum typeenum {
        case ouinon
        case reponsecourte
        case donnee
        case ouinonreponse
    }
    var type:typeenum
    var value: String
    init (intitule: String,type: typeenum, value:String){
        self.type=type
        self.intitule=intitule
        self.value=value
        
    }
}

class categorieExamen {
    var categories = [ Categorie]()
    
    class Categorie {
        var examens = [ Examen]()
        var nom: String
        var namedImage : String
        init(){
            nom=""
            namedImage=""
            
        }
        init(nom:String, namedImage:String){
            self.nom=nom
            self.namedImage=namedImage
        }
        func detailString() -> String {
            var str: String = ""
            for var index in 0..<examens.count {
                let examen=examens[index]
                if !examen.value.isEmpty {
                    if examen.type == Examen.typeenum.ouinon {
                        if examen.value == "0" {
                            str += "\(examen.intitule), "
                        } else if examen.value == "1" {
                            str += "\(examen.intitule)=0, "
                        }
                        
                        
                    }
                    if  examen.type == Examen.typeenum.reponsecourte {
                        str += "\(examen.value), "
                    }
                    if examen.type == Examen.typeenum.donnee {
                        str += "\(examen.intitule)=\(examen.value), "
                    }
                }
                
            }
            if !str.isEmpty {str.removeAtIndex(str.endIndex.predecessor())
                str.removeAtIndex(str.endIndex.predecessor())}
            return str
     
        }
    }
    
    init(){
        let Categorie1 = Categorie(nom: "Administratif",namedImage: "administratif_icon.png")
        let examcat1 = [
            Examen(intitule: "Nom Prénom", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Masculin", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Age", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "Localisation", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Motif", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Médecin Traitant", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Vit en institution", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Célibataire", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "En couple", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Veuf(ve)", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Dirigé par le centre 15", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "adressé par", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Médecin envoyeur", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Transport SMUR", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Transport Pompiers", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Transport Famille", type: Examen.typeenum.ouinon,value: "")
            
            ]
        Categorie1.examens = examcat1
        
        let Categorie2 = Categorie(nom: "Contexte/Antécédent",namedImage: "nurse_icon.png")
        let examcat2 = [
            Examen(intitule: "Pas d'antécédents notables", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "atcd1", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "atcd2", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "atcd3", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "atcd4", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "atcd5", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "atcd6", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "atcd7", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Commentaire", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "HTA", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Dyslipémie", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Diabète", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Obesité", type: Examen.typeenum.ouinon,value: ""),
             Examen(intitule: "Surcharge pondérale", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Tabagisme", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Tabagisme sevré", type: Examen.typeenum.ouinon,value: "")
        ]
        Categorie2.examens = examcat2
        
        let Categorie3 = Categorie(nom: "Plaintes/Anamnèse",namedImage: "tete_icon.png")
        let examcat3 = [
            Examen(intitule: "Commentaire", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Douleur abdominale", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Asthénie", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Douleur thoracique", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Bilan de traumatisme", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Fièvre", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Symptomes respiratoires", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Troubles digestifs", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Malaise", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Vertige", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Anxiété", type: Examen.typeenum.ouinon,value: "")
        ]
        Categorie3.examens=examcat3
        let Categorie31 = Categorie(nom: "Pancarte",namedImage: "pancarte_icon.png")
        let examcat31 = [
            Examen(intitule: "Commentaire", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Poids", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "TA", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "TA bras droit", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "TA bras gauche", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "FC", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "T°", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "Fr. Resp", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "SaO2%", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "EVA", type: Examen.typeenum.donnee,value: "")
        ]
        Categorie31.examens=examcat31
        
        // Examen(intitule: "Motif", type: Examen.typeenum.reponsecourte,value: "")
        let Categorie4 = Categorie(nom: "Neurologie",namedImage: "neuro_icon.png")
        let examcat4 = [
            Examen(intitule: "Examen Normal", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Commentaire", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Glasgow", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "D.T.S.", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Céphallée", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "ROT symétriques", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "RCP en flexion", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Occulomotricité normale", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "RPM positifs", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Troubles Cognitifs", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Photophobie", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Troubles visuels", type: Examen.typeenum.ouinon,value: "")
        ]
        Categorie4.examens = examcat4
        let Categorie5 = Categorie(nom: "Cardiovasculaire",namedImage: "cardio2_icon.png")
        let examcat5 = [
            Examen(intitule: "Examen Normal", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Commentaire", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Douleur thoracique", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Détail", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Dyspnée", type: Examen.typeenum.ouinon,value: ""),
             Examen(intitule: "Détail", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "BDC regulier", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "BDC irregulier", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Souffle cardiaque", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Pouls fémoraux présents", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Pouls pédieux présents", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Souffle carotidien", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Pas de crépitants", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Rales crépitants aux bases", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Rales crépitants étendues", type: Examen.typeenum.ouinon,value: "")
        ]
        Categorie5.examens = examcat5
        
        let Categorie6 = Categorie(nom: "Respiratoire",namedImage: "pneumo_icon.png")
        let examcat6 = [
            Examen(intitule: "Examen Normal", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Commentaire", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Sibilants", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Dyspnée", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Cyanose labiale", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Tirage", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Difficulté à l'élocution", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Oxygenothérapie à domicile", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Ronchopathie", type: Examen.typeenum.ouinon,value: "")
        ]
        Categorie6.examens = examcat6
        
        let Categorie7 = Categorie(nom: "Digestif",namedImage: "digestif_icon.png")
        let examcat7 = [
            Examen(intitule: "Examen Normal", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Commentaire", type: Examen.typeenum.reponsecourte,value: ""),
            Examen(intitule: "Anorexie", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Nausée/Vomissements", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Diarrhée", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Constipation", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Douleur epigastrique", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Douleur flanc gauche", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Douleur flanc droit", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Douleur hypochondre gauche", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Douleur hypochondre droit", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Selles", type: Examen.typeenum.donnee,value: ""),
            Examen(intitule: "Selles molles", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Méléna", type: Examen.typeenum.ouinon,value: ""),
            Examen(intitule: "Rectorragie", type: Examen.typeenum.ouinon,value: "")
        ]
        Categorie7.examens = examcat7
        let Categorie8 = Categorie(nom: "Locomoteur",namedImage: "os_icon.png")
        categories += [Categorie1,Categorie2,Categorie3,Categorie31,Categorie4,Categorie5,Categorie6,Categorie7,Categorie8]
    }
    
    
}