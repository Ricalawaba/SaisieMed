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
        var formatPreString:String = "<br>"
        var formatPostString:String = ""
        func nomUI()->String{
            return categorieExamen.Categorie.removeHtml(nom)
        }
        required convenience init?(coder decoder: NSCoder) {
            guard let nom = decoder.decodeObjectForKey("nom") as? String,
                let namedImage = decoder.decodeObjectForKey("namedImage") as? String,
                let examens = decoder.decodeObjectForKey("examens") as? [Examen],
                let formatPreString = decoder.decodeObjectForKey("formatPreString") as? String,
                let formatPostString = decoder.decodeObjectForKey("formatPostString") as? String
                
                else { return nil }
            
            self.init(nom: nom, namedImage: namedImage,showNom: decoder.decodeBoolForKey("shownom"), formatPreString: formatPreString,formatPostString: formatPostString)
            self.examens=examens
//            self.showNom = decoder.decodeBoolForKey("shownom")
//            self.formatPostString=formatPostString
//            self.formatPreString=formatPreString
            
        }
        func startNewLine() {
            formatPreString="<br>"
        }
        func startLI() {
            formatPreString="<li>"
        }
        func encodeWithCoder(coder: NSCoder) {
            coder.encodeObject(self.nom, forKey: "nom")
            coder.encodeObject(self.namedImage, forKey: "namedImage")
            coder.encodeObject(self.formatPreString, forKey: "formatPreString")
            coder.encodeObject(self.formatPostString, forKey: "formatPostString")
            coder.encodeObject(self.examens, forKey: "examens")
            coder.encodeBool(self.showNom, forKey: "shownom")
        }
        
        
        override init(){
            
            nom=""
            namedImage=""
            super.init()
            
        }
        init(nom:String, namedImage:String, showNom: Bool) {
            self.nom=nom
            self.namedImage=namedImage
            self.showNom=showNom
            
        }
        
        convenience init(nom:String, namedImage:String, showNom: Bool,formatPreString: String, formatPostString: String?){
            self.init(nom: nom,namedImage:namedImage,showNom: showNom)
            
            if (formatPostString != nil) {
                self.formatPostString=formatPostString!
            }
            
                self.formatPreString=formatPreString
            
        }
        init(nom:String, namedImage:String){
            self.nom=nom
            self.namedImage=namedImage
            
        }
        func asExamen() -> Examen {
            return Examen(categorie: self)
        }
        static func removeHtml(originalString: String)->String {
            var removeHtmlStr = originalString
            let subStr=["<br>","</br>","<u>","</u>","<p>","</p>","<li>","<ul>","<ol>","<b>","</b>","<section>","</section>"]
            
            for str in subStr {
                removeHtmlStr=removeHtmlStr.stringByReplacingOccurrencesOfString(str, withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch)
            }
            
            return removeHtmlStr
            
        }
        func UIString() -> String {           
            return Categorie.removeHtml(formattedDetaiString())
        }
        func getDocuments() -> [String] {
            var documents = [String]()
            for ex in examens {
                if ex.type == .imagefilename && !ex.value.isEmpty {
                    documents.append( ex.value)
                } else if ex.type == .group {
                    
                    documents.appendContentsOf(ex.categorie!.getDocuments())
                }
                
            }

            return documents
            
        }
        func formattedDetaiString() -> String {
            var str: String = ""
            var savedStr:String=""
            // Itération des examens de la catégorie
            for  index in 0..<examens.count {
                savedStr=str
                let examen=examens[index]
                
                if !examen.value.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).isEmpty {
                    if examen.type ==  .ouinon || examen.type == .check {
                        if examen.value == "0" {
                            str += "\(examen.intitule)"
                        } else if examen.value == "1" {
                            let vowels: [Character] = ["a","e","i","o","u","h"]
                            if vowels.contains(examen.intitule.lowercaseString.characters.first!) {
                                
                                str += "Pas d'\(examen.intitule)"}
                            else {
                                str += "Pas de \(examen.intitule)"}
                        }
                    } else if  examen.type ==  .reponsecourte || examen.type == .selection{
                        str += "\(examen.value)"
                    } else if examen.type ==  .donnee  || examen.type == .datastr || examen.type == Examen.ExamenEnum.multirowdatastr {
                        str += "\(examen.intitule): \(examen.value)"
                    } else if examen.type == .imagefilename {
                        str+="<img src=\"file:\(NSString(string: examen.value).lastPathComponent)\" max-width=100%>"
                    }
                    
                }else if examen.type ==  .group  {
                    let str2=examen.categorie!.formattedDetaiString()
                    if !(str2.isEmpty) {
                        //  str += catSeparator
                        if ((examen.categorie!.showNom) ) {
                            str += "<u>\(examen.intitule)</u>: "
                        }
                        str += "\(str2)"
                    }
                }
                while let lastchar=str.characters.last {
                    if [",", ".", "-", "?"," "].contains(lastchar) {
                        str = String(str.characters.dropLast())
                        //print(newstr)
                    } else {break}
                }

                if str != savedStr {
                    str = "\(examen.formatPreString)\(str)\(examen.formatPostString)"
                }
            }
            while let lastchar=str.characters.last {
                if [",", ".", "-", "?"," "].contains(lastchar) {
                    str = String(str.characters.dropLast())
                    //print(newstr)
                } else {break}
            }

            if str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).isEmpty {return ""}
            return "\(formatPreString)\(str)\(formatPostString)"
            
        }
        //        func detailString() -> String {
        //            var str: String = ""
        //            var str2: String = ""
        //            for  index in 0..<examens.count {
        //                str2=str
        //                let examen=examens[index]
        //                if !examen.value.isEmpty {
        //                    if examen.type ==  .ouinon || examen.type == .check {
        //                        if examen.value == "0" {
        //                            str += "\(examen.intitule), "
        //                        } else if examen.value == "1" {
        //                            let vowels: [Character] = ["a","e","i","o","u","h"]
        //                            if vowels.contains(examen.intitule.lowercaseString.characters.first!) {
        //
        //                                str += "Pas d'\(examen.intitule), "}
        //                            else {
        //                                str += "Pas de \(examen.intitule), "}
        //                        }
        //                    }
        //
        //                    if  examen.type ==  .reponsecourte || examen.type == .selection{
        //                        str += "\(examen.value), "
        //                    }
        //                    if examen.type ==  .donnee || examen.type == .datastr || examen.type == Examen.ExamenEnum.multirowdatastr{
        //                        str += "\(examen.intitule)=\(examen.value), "
        //                    }
        //
        //                }else if examen.type ==  .group {
        //                    let str2=examen.categorie?.detailString()
        //                    if !(str2?.isEmpty)! {
        //                        if ((examen.categorie!.showNom) ) {
        //                            str += "\(examen.intitule):"
        //                        }
        //
        //                        str += "\(examen.categorie!.detailString())\(examen.info) "
        //                        // str = "<br>\(str)"
        //                    }
        //                }
        //                // if !str.isEmpty
        //                if str2 != str  &&
        //                    ( self.nom.containsString("de la clinique") || self.nom.containsString("comoteur")
        //                    ){str = "<br>\(str)" }
        //            }
        //            if !str.isEmpty {str.removeAtIndex(str.endIndex.predecessor())
        //                str.removeAtIndex(str.endIndex.predecessor())}
        //            return str
        //        }
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
        
 
        
        
        // MARK: Examens paracliniques
        let catParaclinique = Categorie(nom: "Examens Paracliniques",namedImage: "imagerie_icon.png")
        var examCatParaclinique = [
             ExamTree.ECG.asExamen() ]
        
        
        
        
        //MARK: Biologie
        
        let catBiologie = ExamTree.Biologie
        
        
        examCatParaclinique += [ Examen(categorie: catBiologie),
                                 ExamTree.Gazometrie.asExamen(),
        ]
        let catBandelette = Categorie(nom: "Bandelette Urinaire",namedImage: "nurse_icon.png")
        let examCatBandelette : [Examen] = [
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
        
 
        
        catParaclinique.examens=examCatParaclinique
        
        let catEvolution=ExamTree.SuiviEvolution
        

        
        
        // MARK: Categories
        categories += [Categorie1, Categorie3,Categorie2,Categorie21,Categorie31,ExamTree.ExamenClinique,catParaclinique,catEvolution,ExamTree.Conclusion, ExamTree.Documents]
    }
    
    
}