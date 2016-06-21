//
//  categorieExamen.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation


class categorieExamen : NSObject , NSCoding {
    var categories = [ Categorie]()
    
    class Categorie : NSObject,NSCoding{
        var examens = [ Examen]()
        var nom: String
        var namedImage : String
        var showNom : Bool = true
        required convenience init?(coder decoder: NSCoder) {
            guard let nom = decoder.decodeObjectForKey("nom") as? String,
                let namedImage = decoder.decodeObjectForKey("namedImage") as? String,
                let examens = decoder.decodeObjectForKey("examens") as? [Examen]
                else { return nil }
            
            self.init(nom: nom, namedImage: namedImage)
            self.examens=examens
            self.showNom = decoder.decodeBoolForKey("shownom")
            
            }
            
        func encodeWithCoder(coder: NSCoder) {
            coder.encodeObject(self.nom, forKey: "nom")
            coder.encodeObject(self.namedImage, forKey: "namedImage")
            coder.encodeObject(self.examens, forKey: "examens")
            coder.encodeBool(self.showNom, forKey: "shownom")
        }
        

      override init(){
        
            nom=""
            namedImage=""
        super.init()
            
        }
        
        init(nom:String, namedImage:String, showNom: Bool){
            self.nom=nom
            self.namedImage=namedImage
            self.showNom=showNom
        }
        init(nom:String, namedImage:String){
            self.nom=nom
            self.namedImage=namedImage
            
        }

        func formattedDetaiString() -> String {
            var str: String = ""
            for  index in 0..<examens.count {
                let examen=examens[index]
                if !examen.value.isEmpty {
                    if examen.type ==  .ouinon || examen.type == .check {
                        if examen.value == "0" {
                            str += "\(examen.intitule), "
                        } else if examen.value == "1" {
                            let vowels: [Character] = ["a","e","i","o","u","h"]
                            if vowels.contains(examen.intitule.lowercaseString.characters.first!) {
                                
                                str += "Pas d'\(examen.intitule), "}
                            else {
                                str += "Pas de \(examen.intitule), "}
                        }
                    }
                    
                    if  examen.type ==  .reponsecourte || examen.type == .selection{
                        str += "\(examen.value), "
                    }
                    if examen.type ==  .donnee {
                        str += "\(examen.intitule)=\(examen.value), "
                    }
                    
                }else if examen.type ==  .group {
                    let str2=examen.categorie?.detailString()
                    if !(str2?.isEmpty)! {
                        str += "<p>"
                        if ((examen.categorie!.showNom) ) {
                            str += "\(examen.intitule): "
                        }
                        str += "\(examen.categorie!.detailString())\(examen.info) "
                    }
                }
            }
            if !str.isEmpty {str.removeAtIndex(str.endIndex.predecessor())
            //    str.removeAtIndex(str.endIndex.predecessor())
            }
            return str

        }
        func detailString() -> String {
                var str: String = ""
                for  index in 0..<examens.count {
                    let examen=examens[index]
                    if !examen.value.isEmpty {
                        if examen.type ==  .ouinon || examen.type == .check {
                            if examen.value == "0" {
                                str += "\(examen.intitule), "
                            } else if examen.value == "1" {
                                let vowels: [Character] = ["a","e","i","o","u","h"]
                                if vowels.contains(examen.intitule.lowercaseString.characters.first!) {
                                    
                                    str += "Pas d'\(examen.intitule), "}
                                else {
                                    str += "Pas de \(examen.intitule), "}
                            }
                        }
                        
                        if  examen.type ==  .reponsecourte || examen.type == .selection{
                            str += "\(examen.value), "
                        }
                        if examen.type ==  .donnee {
                            str += "\(examen.intitule)=\(examen.value), "
                        }
                        
                    }else if examen.type ==  .group {
                        let str2=examen.categorie?.detailString()
                        if !(str2?.isEmpty)! {
                            if ((examen.categorie!.showNom) ) {
                                str += "\(examen.intitule):"
                            }
                        str += "\(examen.categorie!.detailString())\(examen.info) "
                        }
                    }
                }
                if !str.isEmpty {str.removeAtIndex(str.endIndex.predecessor())
                str.removeAtIndex(str.endIndex.predecessor())}
                return str
            }
    }

    required convenience init?(coder decoder: NSCoder) {
        guard let categories = decoder.decodeObjectForKey("categories") as? [Categorie]
            else { return nil }
        
        
        self.init(categories: categories)
        
    }
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.categories, forKey: "categories")
    }

    init (categories: [Categorie]){
        self.categories=categories
    }
    override init(){
        // MARK: Administratif
        let Categorie1 = Categorie(nom: "Administratif",namedImage: "administratif_icon.png")
        let catModeVie = Categorie(nom: "Mode de vie",namedImage: "administratif_icon.png")
        let excamCatModeVie = [
            Examen(intitule: "à son domicile", type:  .check ),
            Examen(intitule: "en institution", type:  .check ),
            Examen(intitule: "en maison de retraite", type:  .check ),
            Examen(intitule: "en maison médicalisée", type:  .check ),
            Examen(intitule: "seul", type:  .check ),
            Examen(intitule: "en couple", type:  .check ),
            Examen(intitule: "Veuf(ve)", type:  .check ),
            Examen(intitule: "Pas d'enfants", type:  .check ),
            Examen(intitule: "enfants:", type:  .donnee ),
             Examen(intitule: "Libre", type:  .reponsecourte )
            ]
        catModeVie.examens=excamCatModeVie
        let catModeEntree = Categorie(nom: "Mode d'entrée",namedImage: "administratif_icon.png")
        let excamCatModeEntree = [
            Examen(intitule: "Dirigé par le centre 15", type:  .check ),
            Examen(intitule: "adressé par", type:  .check ),
            Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"),
            Examen(intitule: "se présente spontanément", type:  .check ),
            Examen(intitule: "Transporté par le SMUR", type:  .check ),
            Examen(intitule: "Transporté par les Pompiers", type:  .check ),
            Examen(intitule: "Transporté par ambulance", type:  .check ),
            Examen(intitule: "Amené par la Famille", type:  .ouinon ),
            ]
        catModeEntree.examens=excamCatModeEntree
        
        let examcat1 = [
            Examen(intitule: "Nom Prénom", type:  .reponsecourte),
            Examen(intitule: "Masculin", type:  .ouinon),
            Examen(intitule: "Age", type:  .donnee),
            Examen(intitule: "Localisation", type:  .selection, tag: "localisation"),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
            Examen(intitule: "Méd.Trait.", type:  .selection ,tag: "medecin"),
            Examen(categorie: catModeVie),
            Examen(categorie: catModeEntree),
            Examen(intitule: "Libre", type:  .reponsecourte )
            
            ]
                Categorie1.examens = examcat1
        // MARK: Comorbidité / antécédent
        let Categorie2 = Categorie(nom: "Comorbidité/Antécédents",namedImage: "nurse_icon.png")
        
        var examcat2 = [
            Examen(intitule: "Pas d'atcds notables", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte )
            ]
        let catFRCV = Categorie(nom: "Facteur de risques",namedImage: "cardio_icon.png")
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
        
        examcat2 += [
            Examen(categorie: catFRCV),
            Examen(intitule: "Allergie connue", type:  .ouinon ),
            Examen(intitule: "Detail", type:  .reponsecourte ),
            
        ]

        // MARK:  - Catégorie antécédent
        for _ in 0..<10 {
            let catATCD = Categorie(nom:"atcd",namedImage: "nurse_icon.png",showNom: false)
            let examCatATCD = [
               // Examen(intitule: "Xie", type:  .check ,info: " "),
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
                Examen(intitule: "ou ?", type:  .selection,tag: "etablissement" ),
               
              
                Examen(intitule: "Commentaire", type:  .reponsecourte )
                
            ]
            catATCD.examens=examCatATCD
            examcat2 += [Examen(categorie: catATCD)]
        }
                        Categorie2.examens = examcat2
        // MARK: Traitement
        let Categorie21 = Categorie(nom: "Traitement",namedImage: "medoc_icon.png")
        
        var examcat21 = [
            Examen(intitule: "Pas de traitement au long cours", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Sous anti-coagulant", type:  .check ),
            Examen(intitule: "Sous anti-agrégant", type:  .check )
            ]
        for _ in 0..<10 {
            let catTTT = Categorie(nom:"ttt",namedImage: "medoc_icon.png",showNom: false)
            let examCatTTT = [
                Examen(intitule: "nom", type:  .selection,tag: "medicament" ),
                Examen(intitule: "posologie", type:  .selection,tag: "posologie" ),
                Examen(intitule: "depuis quand ?", type:  .reponsecourte,tag: "date" ),
                Examen(intitule: "par qui ?", type:  .selection,tag: "medecin" ),
                Examen(intitule: "pour", type:  .selection,tag: "atcd" ),
                Examen(intitule: "Commentaire", type:  .reponsecourte )
            ]
            catTTT.examens=examCatTTT
            examcat21 += [Examen(categorie: catTTT)]
        }

        Categorie21.examens = examcat21
        // MARK: Plaintes/Anamnese
        let Categorie3 = Categorie(nom: "Plaintes/Anamnèse",namedImage: "tete_icon.png")
        let examcat3 = [
        //   Examen(categorie: Categorie21 ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
            Examen(intitule: "Motif", type:  .selection,tag: "motif" ),
  /*          Examen(intitule: "Douleur abdominale", type:  .check ),
            Examen(intitule: "Asthénie", type:  .ouinon ),
            Examen(intitule: "Douleur thoracique", type:  .ouinon ),
            Examen(intitule: "Bilan de traumatisme", type:  .ouinon ),
            Examen(intitule: "Fièvre", type:  .ouinon ),
            Examen(intitule: "Symptomes respiratoires", type:  .ouinon ),
            Examen(intitule: "Troubles digestifs", type:  .ouinon ),
            Examen(intitule: "Malaise", type:  .ouinon ),
            Examen(intitule: "Vertige", type:  .ouinon ),
            Examen(intitule: "Anxiété", type:  .ouinon ),*/
            Examen(intitule: "Libre", type:  .reponsecourte ),
            Examen(intitule: "Pas d'autres plaintes somatiques", type:  .check ),
            
        ]
        Categorie3.examens=examcat3
        
        // MARK: Pancarte
        let Categorie31 = Categorie(nom: "Pancarte",namedImage: "pancarte_icon.png")
        let examcat31 = [
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "TA", type:  .donnee ),
            Examen(intitule: "TA bras droit", type:  .donnee ),
            Examen(intitule: "TA bras gauche", type:  .donnee ),
            Examen(intitule: "FC", type:  .donnee ),
            Examen(intitule: "T°", type:  .donnee ),
            Examen(intitule: "EVA", type:  .donnee ),
            Examen(intitule: "SaO2%", type:  .donnee ),
            Examen(intitule: "Fr. Resp", type:  .donnee ),
            Examen(intitule: "Poids (estimé)", type:  .donnee ),
            Examen(intitule: "Poids (mesuré)", type:  .donnee ),
            Examen(intitule: "Poids (indiqué par le patient)", type:  .donnee ),
            Examen(intitule: "Variation pondérale récente significative", type:  .ouinon ),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            Examen(intitule: "Dernier repas", type:  .donnee ),
            Examen(intitule: "Taille", type:  .donnee )
        ]
        Categorie31.examens=examcat31
        
        // Examen(intitule: "Motif", type:  .reponsecourte )
        // MARK: Neurologie
        let Categorie4 = Categorie(nom: "Neurologie",namedImage: "neuro_icon.png")
        let examcat4 = [
            Examen(intitule: "Examen Normal", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Déficit sensitivomoteur", type:  .ouinon ),
            Examen(intitule: "Glasgow", type:  .donnee ),
            Examen(intitule: "D.T.S.", type:  .ouinon ),
            Examen(intitule: "Céphallée", type:  .ouinon ),
            Examen(intitule: "ROT symétriques", type:  .check ),
            Examen(intitule: "RCP en flexion", type:  .check ),
            Examen(intitule: "Babinski", type:  .donnee ),
            Examen(intitule: "Occulomotricité normale", type:  .check ),
            Examen(intitule: "RPM présents", type:  .check ),
            Examen(intitule: "Pas de signe de localisation", type:  .check ),
            Examen(intitule: "Troubles Cognitifs", type:  .ouinon ),
            Examen(intitule: "Photophobie", type:  .ouinon ),
            Examen(intitule: "Troubles visuels", type:  .ouinon ),
            Examen(intitule: "Libre", type:  .reponsecourte )
        ]
        Categorie4.examens = examcat4
        
        // MARK: Cardiovasculaire
        let CategorieCardiovasculaire = Categorie(nom: "Cardiovasculaire",namedImage: "cardio2_icon.png")
        let examcat5 = [
            Examen(intitule: "Examen Normal", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Douleur thoracique", type:  .ouinon ),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            Examen(intitule: "Dyspnée", type:  .ouinon ),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            Examen(intitule: "Palpitations", type:  .ouinon ),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            Examen(intitule: "BDC régulier", type:  .check ),
            Examen(intitule: "BDC irrégulier", type:  .check ),
            Examen(intitule: "Pas de souffle cardiaque", type:  .check ),
            Examen(intitule: "Souffle cardiaque", type:  .donnee ),
            Examen(intitule: "Pouls fémoraux présents", type:  .check ),
            Examen(intitule: "Souffle fémoral", type:  .ouinon ),
            Examen(intitule: "Pouls pédieux présents", type:  .check ),
            Examen(intitule: "Souffle carotidien", type:  .ouinon ),
            Examen(intitule: "Pas de crépitants", type:  .check ),
            Examen(intitule: "Rales crépitants aux bases", type:  .check ),
            Examen(intitule: "Rales crépitants étendues", type:  .check ),
            Examen(intitule: "Toux", type:  .ouinon ),
            Examen(intitule: "Expectorations aérées", type:  .check ),
            Examen(intitule: "O.M.I.", type:  .ouinon ),
            Examen(intitule: "Mollets souples et indolore", type:  .check ),
            
            Examen(intitule: "Libre", type:  .reponsecourte )
        ]
        CategorieCardiovasculaire.examens = examcat5
        
        // MARK: Respiratoire
        let Categorie6 = Categorie(nom: "Respiratoire",namedImage: "pneumo_icon.png")
        let examcat6 = [
            Examen(intitule: "Examen Normal", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Dyspnée", type:  .ouinon ),
            Examen(intitule: "MV + symétrique", type:  .check ),
            Examen(intitule: "Sibilants", type:  .ouinon ),
            Examen(intitule: "Crépitants", type:  .ouinon ),
            Examen(intitule: "Foyer auscultatoire", type:  .ouinon ),
            Examen(intitule: "Cyanose labiale", type:  .ouinon ),
            Examen(intitule: "Tirage", type:  .ouinon ),
            Examen(intitule: "Difficulté à l'élocution", type:  .ouinon ),
            Examen(intitule: "Oxygenothérapie à domicile", type:  .check ),
            Examen(intitule: "Ronchopathie", type:  .ouinon ),
            Examen(intitule: "SaO2%", type:  .donnee ),
            Examen(intitule: "Libre", type:  .reponsecourte )
        ]
        Categorie6.examens = examcat6
        
        // MARK: Digestif
        let Categorie7 = Categorie(nom: "Digestif",namedImage: "digestif_icon.png")
        let examcat7 = [
            Examen(intitule: "Examen Normal", type:  .ouinon ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Trouble de l'apétit", type:  .ouinon ),
            Examen(intitule: "Nausée/Vomissements", type:  .ouinon ),
            Examen(intitule: "Diarrhée", type:  .ouinon ),
            Examen(intitule: "Constipation", type:  .ouinon ),
            Examen(intitule: "Bruits hydroaériques", type:  .ouinon ),
            Examen(intitule: "Abdomen souple et depressible", type:  .check ),
            Examen(intitule: "Ballonement", type:  .ouinon ),
            Examen(intitule: "Douleur abdominale", type:  .ouinon ),
            Examen(intitule: "épigastrique", type:  .check ),
            Examen(intitule: "Irradiation dans le dos", type:  .ouinon ),
            Examen(intitule: "hypochondre droit", type:  .check ),
            Examen(intitule: "flanc droit", type:  .check ),
            Examen(intitule: "FI droite", type:  .check ),
            Examen(intitule: "hypochondre gauche", type:  .check ),
            Examen(intitule: "flanc gauche", type:  .check ),
            Examen(intitule: "FI gauche", type:  .check ),
            Examen(intitule: "périombilicale", type:  .check ),
            Examen(intitule: "hypogastrique", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Pas de défense", type:  .check ),
            Examen(intitule: "Selles", type:  .donnee ),
            Examen(intitule: "Selles molles", type:  .ouinon ),
            Examen(intitule: "Méléna", type:  .ouinon ),
            Examen(intitule: "Rectorragie", type:  .ouinon ),
            Examen(intitule: "Ictère", type:  .ouinon ),
            Examen(intitule: "Orifices herniaires libres", type:  .ouinon ),
            Examen(intitule: "Libre", type:  .reponsecourte )
        ]
        Categorie7.examens = examcat7
        
        // MARK: Urologie
        let Categorie8 = Categorie(nom: "Urologie",namedImage: "rein_icon.png")
        let examcat8 = [
            Examen(intitule: "Examen Normal", type:  .ouinon ),
            
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "BU Normale", type:  .check ),
            Examen(intitule: "BU Positive", type:  .donnee ),
            Examen(intitule: "Troubles fonctionnels urinaires", type:  .ouinon ),
            Examen(intitule: "Pollakiurie", type:  .ouinon ),
            Examen(intitule: "Brulure mictionnelle", type:  .ouinon ),
            Examen(intitule: "Hématurie", type:  .ouinon ),
            Examen(intitule: "Douleur lombaire", type:  .ouinon ),
            Examen(intitule: "Douleur fosse lombaire gauche", type:  .check ),
            Examen(intitule: "Douleur fosse lombaire droite", type:  .check ),
            Examen(intitule: "Douleur flanc gauche", type:  .check ),
            Examen(intitule: "Douleur flanc droit", type:  .check ),
            Examen(intitule: "Testicules normaux", type:  .check ),
            Examen(intitule: "Libre", type:  .reponsecourte )
        ]
        Categorie8.examens = examcat8
        // MARK: ORL
        let Categorie9 = Categorie(nom: "O.R.L.",namedImage: "nez_icon.png")
        let examcat9 = [
            Examen(intitule: "Examen Normal", type:  .ouinon ),
            
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Dysphagie", type:  .ouinon ),
            Examen(intitule: "Amygdales normales", type:  .ouinon ),
            Examen(intitule: "Rhinorhée", type:  .ouinon ),
            Examen(intitule: "Hypoaccousie", type:  .ouinon ),
            Examen(intitule: "Acouphènes", type:  .ouinon ),
            Examen(intitule: "Vertige", type:  .ouinon ),
            Examen(intitule: "Amygdalite", type:  .ouinon ),
            Examen(intitule: "Erythème pharyngé", type:  .ouinon ),
            Examen(intitule: "Adénopathie cervicale", type:  .ouinon ),
            Examen(intitule: "Adénopathie sous-maxillaire", type:  .ouinon ),
            Examen(intitule: "Epistaxis", type:  .donnee ),
            Examen(intitule: "Pas d'otalgie", type:  .ouinon ),
            Examen(intitule: "Otalgie droite", type:  .check ),
            Examen(intitule: "Otalgie gauche", type:  .check ),

            Examen(intitule: "Libre", type:  .reponsecourte )
        ]
        Categorie9.examens = examcat9
        
        // MARK: Locomoteur
        let Categorie20 = Categorie(nom: "Locomoteur",namedImage: "os_icon.png")
        
        // MARK: Electrocardiogramme
        let CatECG = Categorie(nom: "ECG",namedImage: "cardio_icon.png")
        let catECGConclusion = Categorie(nom: "Conclusion",namedImage: "cardio_icon.png")
        let examCatConclusion = [
            Examen(intitule: "Libre", type:  .reponsecourte ),
            Examen(intitule: "ECG Normal", type: .check),
            Examen(intitule: "AC/FA", type: .check),
            Examen(intitule: "Tachycardie sinusale", type: .check),
            Examen(intitule: "Bradycardie", type: .check),
            Examen(intitule: "BBG", type: .check),
            Examen(intitule: "BBD", type: .check),
            Examen(intitule: "BBD", type: .check),
            Examen(intitule: "HBAG", type: .check),
            Examen(intitule: "HBPG", type: .check),
            Examen(intitule: "Courant de lésion", type: .donnee),
            Examen(intitule: "Ischémie", type: .donnee),
            Examen(intitule: "Pas de troubles de la conduction ou de repolarisation", type: .check),
            ]
        catECGConclusion.examens=examCatConclusion
        
        let catECG1 = Categorie(nom: "Paramètres Tracé",namedImage: "cardio_icon.png")
        let examcatECG1 = [
             Examen(intitule: "Libre", type:  .reponsecourte ),
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
             Examen(intitule: "QTc", type:  .donnee )
        ]
        catECG1.examens = examcatECG1
        
        
        let CatECG2 = Categorie(nom: "Rythme/P/PR",namedImage: "cardio_icon.png")
        let examCatECG2=[
                Examen(intitule: "Libre", type:  .reponsecourte ),
                Examen(intitule: "Rythme regulier sinusal", type: .check),
                Examen(intitule: "Rythme irrégulier", type: .check),
                Examen(intitule: "FA (P=0)", type: .check),
                Examen(intitule: "Axe Normal (aVF et D1>0)", type: .check),
                Examen(intitule: "Axe Gauche (aVF<0 et D1>0)", type: .check),
                Examen(intitule: "Axe Droit (aVF>0 et D1<0)", type: .check),
                
                Examen(intitule: "Pas d'hypertrophie auriculaire", type: .check),
                Examen(intitule: "PR constant", type: .check),
                Examen(intitule: "PR allongé", type: .donnee),
                Examen(intitule: "PR court", type: .donnee),
                Examen(intitule: "BAV1", type: .check),
                Examen(intitule: "BAV2", type: .check),
                Examen(intitule: "BAV3", type: .check),
                Examen(intitule: "Pas de troubles de la conduction", type: .check),
                Examen(intitule: "Pas de troubles de la repolarisation", type: .check),
                
                
        ]
        CatECG2.examens=examCatECG2
        let CatECG3 = Categorie(nom: "QRS",namedImage: "cardio_icon.png")
        let examCatECG3 = [
            Examen(intitule: "Libre", type:  .reponsecourte ),
            Examen(intitule: "QRS Larges", type: .donnee),
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
        
        let CatECG4 = Categorie(nom: "ST",namedImage: "cardio_icon.png")
        let examCatECG4 = [
            Examen(intitule: "Libre", type:  .reponsecourte ),
            Examen(intitule: "ST isoélectrique", type: .check),
            Examen(intitule: "ST sus-décalé", type: .donnee),
            Examen(intitule: "ST sous-decalé", type: .donnee),
            Examen(intitule: "Discordance de repolarisation 'approprié'", type: .check),
        ]
        CatECG4.examens=examCatECG4
        
        let CatECG5 = Categorie(nom: "T/U ",namedImage: "cardio_icon.png")
        let examCatECG5 = [
            Examen(intitule: "Libre", type:  .reponsecourte ),
            Examen(intitule: "Ondes T normales", type: .check),
            Examen(intitule: "Ondes T aplatis", type: .donnee),
            Examen(intitule: "Ondes T pointues assymétriques", type: .donnee),
            Examen(intitule: "Ondes T négative", type: .donnee),
            Examen(intitule: "Ondes U", type: .ouinon),
            ]
        CatECG5.examens=examCatECG5

        CatECG.examens = [
            Examen(categorie: catECGConclusion),
            Examen(intitule: "libre", type: .reponsecourte),
            Examen(categorie: catECG1),
            Examen(categorie: CatECG2),
            Examen(categorie: CatECG3),
            Examen(categorie: CatECG4),
            Examen(categorie: CatECG5),
            
            
        ]
        
        // MARK: Categories
        categories += [Categorie1, Categorie3,Categorie2,Categorie21,Categorie31,Categorie4,CategorieCardiovasculaire,CatECG, Categorie6,Categorie7,Categorie8, Categorie9, Categorie20]
    }
    
    
}