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
        var examens = [Examen]()
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
        let Categorie1 = Categorie(nom: "Administratif",namedImage: "administratif_icon.png")
        let examcat1 = [Examen(intitule: "Nom", type: Examen.typeenum.reponsecourte,value: ""),
                        Examen(intitule: "Prénom", type: Examen.typeenum.reponsecourte,value: ""),
                        Examen(intitule: "Masculin", type: Examen.typeenum.ouinon,value: ""),
                        Examen(intitule: "Age", type: Examen.typeenum.reponsecourte,value: ""),
                        Examen(intitule: "Localisation", type: Examen.typeenum.reponsecourte,value: ""),
                        Examen(intitule: "Motif", type: Examen.typeenum.reponsecourte,value: "")]
        Categorie1.examens = examcat1
        
        let Categorie2 = Categorie(nom: "Contexte/Antécédent",namedImage: "nurse_icon.png")
        let Categorie3 = Categorie(nom: "Plaintes",namedImage: "tete_icon.png")
        let Categorie4 = Categorie(nom: "Neurologie",namedImage: "neuro_icon.png")
        let Categorie5 = Categorie(nom: "Cardiovasculaire",namedImage: "cardio2_icon.png")
        let Categorie6 = Categorie(nom: "Respiratoire",namedImage: "pneumo_icon.png")
        let Categorie7 = Categorie(nom: "Digestif",namedImage: "digestif_icon.png")
        let Categorie8 = Categorie(nom: "Locomoteur",namedImage: "os_icon.png")
        categories += [Categorie1,Categorie2,Categorie3,Categorie4,Categorie5,Categorie6,Categorie7,Categorie8]
    }
    
    
}