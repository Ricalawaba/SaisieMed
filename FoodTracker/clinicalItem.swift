//
//  clinicalItem.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 12/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

class clinicalItem {
    var description : String = ""
    var identifier : String = ""
    var parent : clinicalItem?
    var value : AnyClass?
    var _estUnChapitre : Int = 0
    
    func estUnChapitre() -> Int {
        return self._estUnChapitre
    }
    
    
}