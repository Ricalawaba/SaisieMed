//
//  examen.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 17/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation
protocol NSCodableEnum {func int() -> Int;init?(rawValue:Int);init(defaultValue:Any)}

extension NSCoder {func encodeEnum( e:Examen.examenEnum, forKey:String) {self.encodeInteger(e.int(), forKey: forKey)};func decodeEnum(forKey:String) -> Examen.examenEnum {if let t = Examen.examenEnum(rawValue:self.decodeIntegerForKey(forKey)) {return t} else {return Examen.examenEnum(defaultValue:0)}}}


class Examen : NSObject,NSCoding{
    var intitule : String
    var info : String = ""
    var tag : String = ""
  //  var selectionnableText: [String] = []
    
    var categorie: categorieExamen.Categorie?
    
    enum  examenEnum : Int, NSCodableEnum{
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
    var type: examenEnum
    var value: String=""
    
    
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
        
        let type = examenEnum(rawValue: (decoder.decodeObjectForKey("type") as! Int))
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
    
    init(categorie:categorieExamen.Categorie) {
        self.categorie=categorie
        self.intitule=categorie.nom
        self.type = .group
        
    }
    init(intitule: String,type:  examenEnum) {
        self.type=type
        self.intitule=intitule
    }
    init(intitule: String,type:  examenEnum, tag: String) {
        self.type=type
        self.intitule=intitule
        self.tag=tag
    }
    init(intitule: String,type:  examenEnum, info:String) {
        self.type=type
        self.intitule=intitule
        self.info=info
    }
    init (intitule: String,type:  examenEnum, value:String){
        
        self.type=type
        self.intitule=intitule
        self.value=value
        
    }
}
