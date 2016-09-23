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
            guard let nom = decoder.decodeObject(forKey: "nom") as? String,
                let namedImage = decoder.decodeObject(forKey: "namedImage") as? String,
                let examens = decoder.decodeObject(forKey: "examens") as? [Examen],
                let formatPreString = decoder.decodeObject(forKey: "formatPreString") as? String,
                let formatPostString = decoder.decodeObject(forKey: "formatPostString") as? String
                
                else { return nil }
            
            self.init(nom: nom, namedImage: namedImage,showNom: decoder.decodeBool(forKey: "shownom"), formatPreString: formatPreString,formatPostString: formatPostString)
            self.examens=examens
            if let subitems=decoder.decodeObject(forKey: "subitems") as? [String] {
                self.subitems=subitems             }
            //            self.showNom = decoder.decodeBoolForKey("shownom")
            //            self.formatPostString=formatPostString
            //            self.formatPreString=formatPreString
            
        }
        func startNewLine() {
            formatPreString="<br>"
        }
        func startLI() {
            formatPreString="<li>"
            formatPostString="</li>"
        }
        func encode(with coder: NSCoder) {
            coder.encode(self.nom, forKey: "nom")
            coder.encode(self.namedImage, forKey: "namedImage")
            coder.encode(self.formatPreString, forKey: "formatPreString")
            coder.encode(self.formatPostString, forKey: "formatPostString")
            coder.encode(self.examens, forKey: "examens")
            
            coder.encode(self.showNom, forKey: "shownom")
            coder.encode(self.subitems, forKey: "subitems")
        }
        
        
        override init(){
            
            nom=""
            namedImage=""
            super.init()
            
        }
        var subitems: [String]=[]
        // var subItemDel: Selector?
        
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
        static func removeHtml(_ originalString: String)->String {
            var removeHtmlStr = originalString
            let subStr=["<br>","</br>","<u>","</u>","<p>","</p>","<li>","</li>","<ul>","<ol>","<b>","</b>","<section>","</section>"]
            
            for str in subStr {
                removeHtmlStr=removeHtmlStr.replacingOccurrences(of: str, with: "", options: NSString.CompareOptions.caseInsensitive)
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
                    
                    documents.append(contentsOf: ex.categorie!.getDocuments())
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
                
                if !examen.value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
                    if examen.type ==  .ouinon || examen.type == .check {
                        if examen.value == "0" {
                            str += "\(examen.intitule)"
                        } else if examen.value == "1" {
                            let vowels: [Character] = ["a","e","i","o","u","é","h"]
                            if vowels.contains(examen.intitule.lowercased().characters.first!) {
                                
                                str += "Pas d'\(examen.intitule)"}
                            else {
                                str += "Pas de \(examen.intitule)"}
                        }
                    } else if  examen.type ==  .reponsecourte || examen.type == .selection || examen.type == .datastr {
                        str += "\(examen.value)"
                    } else if examen.type ==  .donnee   || examen.type == Examen.ExamenEnum.multirowdatastr {
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
            
            if str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {return ""}
            return "\(formatPreString)\(str)\(formatPostString)"
            
        }
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let categories = decoder.decodeObject(forKey: "categories") as? [Categorie]
            else { return nil }
        
        
        self.init(categories: categories)
        
    }
    func encode(with coder: NSCoder) {
        coder.encode(self.categories, forKey: "categories")
    }
    
    init (categories: [Categorie]){
        self.categories=categories
    }
    override init(){
        
        categories.append(ExamTree.administratif)
        categories.append(ExamTree.PlainteAnamnèse)
        categories.append(ExamTree.Comorbidite)
        categories.append( ExamTree.Traitement)
        categories.append( ExamTree.Pancartes)
        categories.append( ExamTree.ExamenClinique)
        categories.append( ExamTree.Paraclinique)
        categories.append( ExamTree.SuiviEvolution)
        categories.append( ExamTree.Conclusion)
        categories.append( ExamTree.Documents)
        

    }
    
    
}
