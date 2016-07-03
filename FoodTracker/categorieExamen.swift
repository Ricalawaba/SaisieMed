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
        func asExamen() -> Examen {
            return Examen(categorie: self)
        }
        func formattedDetaiString(catSeparator:String="<p>") -> String {
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
                    if examen.type ==  .donnee  || examen.type == .datastr || examen.type == Examen.ExamenEnum.multirowdatastr {
                        str += "\(examen.intitule): \(examen.value)\(examen.info) "
                    }
                    
                }else if examen.type ==  .group  {
                    let str2=examen.categorie?.formattedDetaiString()
                    if !(str2?.isEmpty)! {
                        str += catSeparator
                        if ((examen.categorie!.showNom) ) {
                            str += "<u>\(examen.intitule)</u>: "
                        }
                        str += "\(str2!)\(examen.info) "
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
            var str2: String = ""
                for  index in 0..<examens.count {
                    str2=str
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
                        if examen.type ==  .donnee || examen.type == .datastr || examen.type == Examen.ExamenEnum.multirowdatastr{
                            str += "\(examen.intitule)=\(examen.value), "
                        }
                        
                    }else if examen.type ==  .group {
                        let str2=examen.categorie?.detailString()
                        if !(str2?.isEmpty)! {
                            if ((examen.categorie!.showNom) ) {
                                str += "\(examen.intitule):"
                            }
                           
                        str += "\(examen.categorie!.detailString())\(examen.info) "
                       // str = "<br>\(str)"
                        }
                    }
                    // if !str.isEmpty
                     if str2 != str  &&
                     ( self.nom.containsString("de la clinique") || self.nom.containsString("comoteur")
                     ){str = "<br>\(str)" }
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
        let Categorie1 = ExamTree.administratif
        
        // MARK: Comorbidité / antécédent
        let Categorie2 = ExamTree.Comorbidite
        

        // MARK: Traitement
        
        
        let Categorie21 = ExamTree.Traitement
        // MARK: Plaintes/Anamnese
        let Categorie3 =  ExamTree.PlainteAnamnèse
        // MARK: Pancarte
        let Categorie31 = ExamTree.Pancartes
        
        // Examen(intitule: "Motif", type:  .reponsecourte )
//        
//        // MARK: Neurologie
//        let Categorie4 = ExamTree.Neurologie
//        
//        // MARK: Cardiovasculaire
//        let CategorieCardiovasculaire = ExamTree.Cardiovasculaire
//        
//        // MARK: Respiratoire
//        let Categorie6 = ExamTree.Respiratoire
//        
//        // MARK: Digestif
//        let Categorie7 = ExamTree.Digestif
//        
//        // MARK: Urologie
//        let Categorie8 = ExamTree.Urologie
//        // MARK: ORL
//        let Categorie9 = ExamTree.ORL
//        
//        // MARK: Locomoteur
//        let Categorie20 = ExamTree.Locomoteur
        // MARK: Electrocardiogramme
        let CatECG = Categorie(nom: "ECG",namedImage: "cardio_icon.png")
        let catECGConclusion = Categorie(nom: "Conclusion",namedImage: "cardio_icon.png")
        let examCatConclusion = [
            Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre"),
            Examen(intitule: "ECG Normal", type: .check),
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
        
        let catECG1 = Categorie(nom: "Paramètres Tracé",namedImage: "cardio_icon.png")
        let examcatECG1 = [
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
             Examen(intitule: "QTc", type:  .donnee )
        ]
        catECG1.examens = examcatECG1
        
        
        let CatECG2 = Categorie(nom: "Rythme/P/PR",namedImage: "cardio_icon.png")
        let examCatECG2=[
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
                Examen(intitule: "BAV1", type: .check),
                Examen(intitule: "BAV2", type: .check),
                Examen(intitule: "BAV3", type: .check),

                
                
        ]
        CatECG2.examens=examCatECG2
        let CatECG3 = Categorie(nom: "QRS",namedImage: "cardio_icon.png")
        let examCatECG3 = [
            Examen(intitule: "Libre", type:  .reponsecourte,tag: "libre" ),
            Examen(intitule: "QRS fins", type: .check),

            Examen(intitule: "QRS Larges", type: .check),
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
            Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre"),
            Examen(intitule: "ST isoélectrique", type: .check),
            Examen(intitule: "ST sus-décalé", type: .donnee),
            Examen(intitule: "ST sous-decalé", type: .donnee),
            Examen(intitule: "Discordance de repolarisation 'approprié'", type: .check),
        ]
        CatECG4.examens=examCatECG4
        
        let CatECG5 = Categorie(nom: "T/U ",namedImage: "cardio_icon.png")
        let examCatECG5 = [
            Examen(intitule: "Libre", type:  .reponsecourte,tag: "libre" ),
            Examen(intitule: "Ondes T normales", type: .check),
            Examen(intitule: "Ondes T aplatis", type: .donnee),
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
            
            
        ]

        
        
        // MARK: Examens paracliniques
        let catParaclinique = Categorie(nom: "Examens Paracliniques",namedImage: "imagerie_icon.png")
        var examCatParaclinique = [
            Examen(categorie: CatECG)]
        
        
        
        
        //MARK: Biologie
        
        let catBiologie = ExamTree.Biologie
        
        
        examCatParaclinique += [ Examen(categorie: catBiologie),
                    ExamTree.Gazometrie.asExamen(),
            ]
        let catBandelette = Categorie(nom: "Bandelette Urinaire",namedImage: "nurse_icon.png")
        let examCatBandelette = [
            Examen(intitule: "normale", type: .check),
            Examen(intitule: "Sang", type: .donnee),
            Examen(intitule: "Leucocytes", type: .donnee),
            Examen(intitule: "Nitrites", type: .donnee),
            Examen(intitule: "Corps cétoniques", type: .donnee),
            Examen(intitule: "ECBU demandé", type: .check),
            Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre"),
            
            ]
        catBandelette.examens=examCatBandelette
        examCatParaclinique += [ Examen(categorie: catBandelette),
            ExamTree.Imagerie.asExamen(),
            Examen(intitule: "Ajout Radiologie",type: .addinfo,tag: "radiologie")
            ]
        
        // MARK: Imagerie

        catParaclinique.examens=examCatParaclinique

        let catEvolution=ExamTree.SuiviEvolution
        
       
        
        
        
        // MARK: Categories
        categories += [Categorie1, Categorie3,Categorie2,Categorie21,Categorie31,ExamTree.ExamenClinique,catParaclinique,catEvolution,ExamTree.Conclusion]
    }
    
    
}