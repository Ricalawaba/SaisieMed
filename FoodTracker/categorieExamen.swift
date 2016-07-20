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
            formatPostString="</li>"
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
        static func removeHtml(originalString: String)->String {
            var removeHtmlStr = originalString
            let subStr=["<br>","</br>","<u>","</u>","<p>","</p>","<li>","</li>","<ul>","<ol>","<b>","</b>","<section>","</section>"]
            
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
            
            if str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).isEmpty {return ""}
            return "\(formatPreString)\(str)\(formatPostString)"
            
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