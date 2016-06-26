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
                    if examen.type ==  .donnee {
                        str += "\(examen.intitule)=\(examen.value), "
                    }
                    
                }else if examen.type ==  .group {
                    let str2=examen.categorie?.detailString()
                    if !(str2?.isEmpty)! {
                        str += catSeparator
                        if ((examen.categorie!.showNom) ) {
                            str += "<u>\(examen.intitule)</u>:<br>"
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
        let Categorie1 = ExamTree.administratif
        
        // MARK: Comorbidité / antécédent
        let Categorie2 = ExamTree.Comorbidite
        

        // MARK: Traitement
        
        
        let Categorie21 = ExamTree.Traitement
        // MARK: Plaintes/Anamnese
              let Categorie3 = Categorie(nom: "Plaintes/Anamnèse",namedImage: "tete_icon.png")
        var examcat3:[Examen]=[]
        for _ in 0..<1 {
               examcat3 += [Examen(categorie: ExamTree.Plainte)]
        }
         examcat3 += [Examen(intitule: "Ajout plainte",type: .addinfo,tag: "Plainte")]
        examcat3 += [Examen(intitule: "Pas d'autres plaintes somatiques", type:  .check )]
        Categorie3.examens=examcat3
       
        

        
        
        // MARK: Pancarte
        let Categorie31 = ExamTree.Pancartes
        
        // Examen(intitule: "Motif", type:  .reponsecourte )
        
        // MARK: Neurologie
        let Categorie4 = Categorie(nom: "Examen neurologique",namedImage: "neuro_icon.png")
        let examcat4 = [
            Examen(intitule: "Examen Normal", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            ExamTree.neuroFonctionnel.asExamen(),
            ExamTree.neuroReflexes.asExamen(),
            Examen(intitule: "Pas de signe de localisation", type:  .check ),
            Examen(intitule: "Libre", type:  .reponsecourte )
        ]
        Categorie4.examens = examcat4
        
        // MARK: Cardiovasculaire
        let CategorieCardiovasculaire = Categorie(nom: "Appareil cardiovasculaire",namedImage: "cardio2_icon.png")
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
            Examen(intitule: "Souffle carotidien", type:  .ouinon ),
            Examen(intitule: "Souffle abdominal", type:  .ouinon ),

            Examen(intitule: "Pouls fémoraux présents", type:  .check ),
            Examen(intitule: "Souffle fémoral", type:  .ouinon ),
            Examen(intitule: "Pouls pédieux présents", type:  .check ),
            Examen(intitule: "Pouls tibial postérieur", type:  .check ),
            Examen(intitule: "Turgescence jugulaire", type:  .ouinon ),
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
        let Categorie6 = Categorie(nom: "Appareil respiratoire",namedImage: "pneumo_icon.png")
        let examcat6 = [
            Examen(intitule: "Examen Normal", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Dyspnée", type:  .ouinon ),
            Examen(intitule: "Toux", type:  .ouinon ),
            Examen(intitule: "Expectorations", type:  .ouinon ),
            Examen(intitule: "Hippocratisme digital", type:  .ouinon ),
            Examen(intitule: "MV + symétrique", type:  .check ),
            Examen(intitule: "Sibilants", type:  .ouinon ),
            Examen(intitule: "Crépitants", type:  .ouinon ),
            Examen(intitule: "Ronchis", type:  .ouinon ),
            Examen(intitule: "Stridor", type:  .ouinon ),
            Examen(intitule: "Frottement pleural", type:  .ouinon ),
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
        let Categorie7 = Categorie(nom: "Appareil Digestif",namedImage: "digestif_icon.png")
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
        let Categorie8 = Categorie(nom: "Appareil Urologique",namedImage: "rein_icon.png")
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
            Examen(intitule: "Libre", type:  .reponsecourte ),
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
        let catExamClinique = Categorie(nom: "Examen Clinique",namedImage: "stetho_icon.png")
        let examCatExamClinique = [
            Examen(intitule: "horodatage", type:  .reponsecourte,tag: "date" ),
            Examen(categorie: Categorie4),
            Examen(categorie: CategorieCardiovasculaire),
            Examen(categorie: Categorie6),
            Examen(categorie: Categorie7),
            Examen(categorie: Categorie8),
            Examen(categorie: Categorie9),
            Examen(categorie: Categorie20),
            
            ]
        catExamClinique.examens=examCatExamClinique
        
        
        // MARK: Examens paracliniques
        let catParaclinique = Categorie(nom: "Examens Paracliniques",namedImage: "imagerie_icon.png")
        var examCatParaclinique = [
            Examen(categorie: CatECG)]
        
        
        
        
        //MARK: Biologie
        
        let catBiologie = Categorie(nom: "Biologie",namedImage: "piqure_icon.png")
        let examCatBiologie = [
            Examen(intitule: "Bilan normal", type: .check),
            Examen(intitule: "Hémogramme normal", type: .check),
            Examen(intitule: "Hémoglobine", type: .donnee),
            Examen(intitule: "Leucocytes", type: .donnee),
            Examen(intitule: "Plaquettes", type: .donnee),
            Examen(intitule: "Insuffisance rénale", type: .ouinon),
            Examen(intitule: "Créatinémie", type: .donnee),
            Examen(intitule: "Clairance", type: .donnee),
            Examen(intitule: "Sodium (Na)", type: .donnee),
            Examen(intitule: "Potassium (K)", type: .donnee),
            Examen(intitule: "Syndrome inflammatoire", type: .ouinon),
            Examen(intitule: "Proteine C Réactive (CRP)", type: .donnee),
            Examen(intitule: "Fibrinogène", type: .donnee),
            Examen(intitule: "Procalcitonine", type: .donnee),
            Examen(intitule: "Bilan hépatique normal", type: .check),
            Examen(intitule: "Cytolyse", type: .ouinon),
            Examen(intitule: "ASAT (TGO)", type: .donnee),
            Examen(intitule: "ALAT (TGP)", type: .donnee),
            
            Examen(intitule: "Cholestase", type: .ouinon),
            Examen(intitule: "Bilirubine", type: .donnee),
            Examen(intitule: "Phosphatases Alcalines", type: .donnee),
            Examen(intitule: "ɣGT", type: .donnee),
            
            Examen(intitule: "Enzymes cardiaques normales", type: .check),
            Examen(intitule: "Troponine", type: .donnee),
            Examen(intitule: "Pro-BNP", type: .donnee),
            Examen(intitule: "BNP", type: .donnee),
            Examen(intitule: "D-Dimères", type: .donnee),
            Examen(intitule: "Myoglobine", type: .donnee),
            
            Examen(intitule: "Euthyroïdie", type: .check),
            Examen(intitule: "TSH", type: .donnee),
            Examen(intitule: "T4L", type: .donnee),
            Examen(intitule: "T3", type: .donnee),
            Examen(intitule: "Libre", type:  .reponsecourte ),
            Examen(intitule: "Libre", type:  .reponsecourte ),
            
            ]
        catBiologie.examens=examCatBiologie
        
        examCatParaclinique += [ Examen(categorie: catBiologie) ]
        let catBandelette = Categorie(nom: "Bandelette Urinaire",namedImage: "nurse_icon.png")
        let examCatBandelette = [
            Examen(intitule: "normale", type: .check),
            Examen(intitule: "Sang", type: .donnee),
            Examen(intitule: "Leucocytes", type: .donnee),
            Examen(intitule: "Nitrites", type: .donnee),
            Examen(intitule: "Corps cétoniques", type: .donnee),
            Examen(intitule: "ECBU demandé", type: .check),
            Examen(intitule: "Libre", type:  .reponsecourte ),
            
            ]
        catBandelette.examens=examCatBandelette
        examCatParaclinique += [ Examen(categorie: catBandelette) ]
        // MARK: Imagerie
        for _ in 0..<5 {
            let catImagerie = Categorie(nom: "Imagerie",namedImage: "imagerie_icon.png",showNom: false)
            let examCatImagerie = [
                Examen(intitule: "Radiographie", type: .check),
                Examen(intitule: "Rx pulmonaire", type: .check),
                Examen(intitule: "Rx Hanche", type: .check),
                Examen(intitule: "Echographie abdominale", type: .check),
                Examen(intitule: "Echographie doppler", type: .check),
                Examen(intitule: "Scanner", type: .check),
                Examen(intitule: "IRM", type: .check),
                Examen(intitule: "E.E.G.", type: .check),
                Examen(intitule: "EMG", type: .check),
                Examen(intitule: "(précision)", type: .reponsecourte),
                Examen(intitule: "en cours", type: .check),
                
                Examen(intitule: "(Interprétation radiologue)", type: .check),
                Examen(intitule: "conclusion:", type: .selection,tag: "ConclusionRx"),
                
                Examen(intitule: "sous reserve de confirmation par le radiologue", type: .check),
                Examen(intitule: "libre", type: .reponsecourte),
                ]
            
            catImagerie.examens=examCatImagerie
            examCatParaclinique += [ Examen(categorie: catImagerie) ]
        }
        
        catParaclinique.examens=examCatParaclinique
//        let catEvolution = Categorie(nom: "Suivi et Evolution",namedImage: "Homme.png")
//        let examCatEvolution = [
//            Examen(intitule: "Heure", type: .reponsecourte,tag: "date"),
//            Examen(intitule: "Evenement", type: .reponsecourte, tag:"Evenement"),
//            Examen(intitule: "Heure", type: .reponsecourte,tag: "date"),
//            Examen(intitule: "Evenement", type: .reponsecourte),
//            
//            Examen(intitule: "Heure", type: .reponsecourte,tag: "date"),
//            Examen(intitule: "Evenement", type: .reponsecourte),
//            
//            Examen(intitule: "Heure", type: .reponsecourte,tag: "date"),
//            Examen(intitule: "Evenement", type: .reponsecourte),
//            
//            Examen(intitule: "Heure", type: .reponsecourte,tag: "date"),
//            Examen(intitule: "Evenement", type: .reponsecourte),
//            
//            Examen(intitule: "Heure", type: .reponsecourte,tag: "date"),
//            Examen(intitule: "Evenement", type: .reponsecourte),
//            
//            ]
//        catEvolution.examens=examCatEvolution
        let catEvolution=ExamTree.SuiviEvolution
        
        let catConclusion = Categorie(nom: "Conclusion",namedImage: "stetho_icon.png")
        let examCatConclusionGenerale = [
            Examen(intitule: "Diagnostic", type: .selection,tag: "atcd"),
            Examen(intitule: "Libre", type: .reponsecourte),
            Examen(intitule: "hospitalisation", type: .check),
            Examen(intitule: "pris en charge par", type: .check),
            Examen(intitule: "médecin", type: .selection, tag: "medecin"),
            Examen(intitule: "Retour à domicile", type: .check),
            Examen(intitule: "Surveillance par le médecin traitant", type: .check),
            Examen(intitule: "Consultation spécialisé prévu", type: .check),
            Examen(intitule: "date", type: .reponsecourte,tag: "date"),
            Examen(intitule: "médecin", type: .selection, tag: "medecin"),
            Examen(intitule: "Consultation spécialisé à prévoir", type: .check),
            Examen(intitule: "sous", type: .reponsecourte),
            Examen(intitule: "Nouvelle consultation nécessaire si évolution péjorative", type: .check),
            Examen(intitule: "Libre", type: .reponsecourte),
            
            ]
        catConclusion.examens=examCatConclusionGenerale
        
        
        
        // MARK: Categories
        categories += [Categorie1, Categorie3,Categorie2,Categorie21,Categorie31,catExamClinique,catParaclinique,catEvolution,catConclusion]
    }
    
    
}