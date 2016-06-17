//
//  examen.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 17/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

class Examen {
    var intitule : String
    var info : String = ""
    var tag : String = ""
    
    var categorie: categorieExamen.Categorie?
    
    enum  examenEnum {
        case ouinon
        case reponsecourte
        case donnee
        case ouinonreponse
        case group
        case check
        case selection
    }
    var type: examenEnum
    var value: String=""
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
