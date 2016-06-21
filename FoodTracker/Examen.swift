//
//  examen.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 17/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation
protocol NSCodableEnum {func int() -> Int;init?(rawValue:Int);init(defaultValue:Any)}

extension NSCoder {func encodeEnum( e:Examen.ExamenEnum, forKey:String) {self.encodeInteger(e.int(), forKey: forKey)};func decodeEnum(forKey:String) -> Examen.ExamenEnum {if let t = Examen.ExamenEnum(rawValue:self.decodeIntegerForKey(forKey)) {return t} else {return Examen.ExamenEnum(defaultValue:0)}}}


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
        func int()->Int {
            return self.rawValue
        }
        init(defaultValue:Any) {
            self = .nothing
        }
    }

    
    
    // MARK: NSCoding
    required convenience init?(coder decoder: NSCoder) {
        guard let intitule = decoder.decodeObjectForKey("intitule") as? String,
            let info = decoder.decodeObjectForKey("info") as? String,
            let tag = decoder.decodeObjectForKey("tag") as? String,
            let value = decoder.decodeObjectForKey("value") as? String
            else { return nil }
        
        
        self.init(intitule: intitule,type: .ouinonreponse)
        self.info=info
        self.tag=tag
        self.value=value
        
        let type = ExamenEnum(rawValue: (decoder.decodeObjectForKey("type") as! Int))
        self.type=type!
        
        if self.type == .group {
            self.categorie = decoder.decodeObjectForKey("categorie") as? categorieExamen.Categorie
        }
   
    }
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.intitule, forKey: "intitule")
        coder.encodeObject(self.info, forKey: "info")
        coder.encodeObject(self.tag, forKey: "tag")
        coder.encodeObject(self.type.rawValue, forKey: "type")
        coder.encodeObject(self.value, forKey: "value")
        if self.type == .group {
            coder.encodeObject(self.categorie, forKey: "categorie")
        }
  
    }
    // MARK: Initialisations
    init(categorie:categorieExamen.Categorie) {
        self.categorie=categorie
        self.intitule=categorie.nom
        self.type = .group
        
    }
    init(intitule: String,type:  ExamenEnum) {
        self.type=type
        self.intitule=intitule
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
}
