//
//  categorieExamen.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 13/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

class categorieExamen {
    var categories = [Categorie]()
    
    class Categorie {
        var nom: String
        var namedImage : String
        init(){
            nom=""
            namedImage=""
            
        }
        init(nom:String, namedImage:String){
            self.nom=nom
            self.namedImage=namedImage
        }
    }
    init(){
        let Categorie1 = Categorie(nom: "Administratif",namedImage: "femme.png")
        let Categorie2 = Categorie(nom: "Contexte/Antécédent",namedImage: "femme.png")
        let Categorie3 = Categorie(nom: "Plaintes",namedImage: "femme.png")
        let Categorie4 = Categorie(nom: "Neurologie",namedImage: "neuro_icon.png")
        let Categorie5 = Categorie(nom: "Cardiovasculaire",namedImage: "cardio2_icon.png")
        let Categorie6 = Categorie(nom: "Respiratoire",namedImage: "pneumo_icon.png")
        let Categorie7 = Categorie(nom: "Digestif",namedImage: "femme.png")
        let Categorie8 = Categorie(nom: "Locomoteur",namedImage: "femme.png")
        categories += [Categorie1,Categorie2,Categorie3,Categorie4,Categorie5,Categorie6,Categorie7,Categorie8]
    }
    
    
}