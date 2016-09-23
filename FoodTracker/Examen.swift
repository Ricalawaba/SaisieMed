//
//  examen.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 17/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation
protocol NSCodableEnum {func int() -> Int;init?(rawValue:Int);init(defaultValue:Any)}

extension NSCoder {func encodeEnum( _ e:Examen.ExamenEnum, forKey:String) {self.encode(e.int(), forKey: forKey)};func decodeEnum(_ forKey:String) -> Examen.ExamenEnum {if let t = Examen.ExamenEnum(rawValue:self.decodeInteger(forKey: forKey)) {return t} else {return Examen.ExamenEnum(defaultValue:0)}}}


class Examen : NSObject,NSCoding{
    var intitule : String
    var info : String = ","
    var tag : String = ""
    var categorie: categorieExamen.Categorie?
    var type: ExamenEnum
    var value: String=""
    
    enum  ExamenEnum : Int, NSCodableEnum{
        case nothing = 0
        case ouinon
        case reponsecourte
        case donnee
        case ouinonreponse
        case group
        case check
        case selection
        
        case addinfo
        case datastr
        case multirowdatastr
        case imagefilename
        case documentinfo
        func int()->Int {
            return self.rawValue
        }
        init(defaultValue:Any) {
            self = .nothing
        }
    }

    var formatPreString:String = ""
    var formatPostString:String = ", "
    
    // MARK: NSCoding
    required convenience init?(coder decoder: NSCoder) {
        guard let intitule = decoder.decodeObject(forKey: "intitule") as? String,
            let info = decoder.decodeObject(forKey: "info") as? String,
            let tag = decoder.decodeObject(forKey: "tag") as? String,
            let formatPreString = decoder.decodeObject(forKey: "formatPreString") as? String,
            let formatPostString = decoder.decodeObject(forKey: "formatPostString") as? String,
        let value = decoder.decodeObject(forKey: "value") as? String
            else { return nil }
        
        
        self.init(intitule: intitule,type: .ouinonreponse)
        self.info=info
        self.tag=tag
        self.value=value
        self.formatPreString=formatPreString
        self.formatPostString=formatPostString
        if let typeint = (decoder.decodeObject(forKey: "type") )  {
            print("typint:",typeint)
        let type = ExamenEnum(rawValue: (decoder.decodeObject(forKey: "type") as! Int))
        self.type=type!
        }
        
        if self.type == .group {
            self.categorie = decoder.decodeObject(forKey: "categorie") as? categorieExamen.Categorie
        }
   
    }
    func encode(with coder: NSCoder) {
        coder.encode(self.intitule, forKey: "intitule")
        coder.encode(self.info, forKey: "info")
        coder.encode(self.tag, forKey: "tag")
        coder.encode(self.type.rawValue, forKey: "type")
        print("rawtype:",self.type.rawValue)
   //     NSLog(<#T##format: String##String#>, <#T##args: CVarArg...##CVarArg#>)
        coder.encode(self.formatPreString, forKey: "formatPreString")
        coder.encode(self.formatPostString, forKey: "formatPostString")
        
        coder.encode(self.value, forKey: "value")
        if self.type == .group {
            coder.encode(self.categorie, forKey: "categorie")
        }
  
    }
    
    // MARK: Initialisations
    init(intitule: String,datastr: [String]){
        self.type = .datastr
        self.intitule=intitule
        self.tag="dataStr\(intitule)"
        Donnees.selectiontextDict[tag]=datastr
    }
    init(categorie:categorieExamen.Categorie) {
        self.categorie=categorie
        self.intitule=categorie.nom
        self.type = .group
        
    }
    init(intitule: String,type:  ExamenEnum) {
        self.type=type
        self.intitule=intitule
    }
    init(intitule: String,type:  ExamenEnum,  formatPreString: String? , formatPostString: String?) {
        self.type=type
        self.intitule=intitule
        if (formatPreString != nil) {
            self.formatPreString=formatPreString!
        }
        if (formatPostString != nil) {
            self.formatPostString=formatPostString!
        }
    }
    init(intitule: String,type:  ExamenEnum, tag: String) {
        self.type=type
        self.intitule=intitule
        self.tag=tag
    }
    init(intitule: String,type:  ExamenEnum, info:String) {
        self.type=type
        self.intitule=intitule
        self.info=info
    }
    init(intitule: String,type:  ExamenEnum, tag: String , info:String) {
        self.type=type
        self.intitule=intitule
        self.info=info
        self.tag=tag
    }
    init (intitule: String,type:  ExamenEnum, value:String){
        
        self.type=type
        self.intitule=intitule
        self.value=value
        
    }
    init (intitule: String, imageName: String)
    {
        self.type = .documentinfo
        self.value=imageName
        self.intitule=intitule
    }
    
}
