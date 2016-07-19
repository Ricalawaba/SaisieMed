//
//  Locomoteur.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 18/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation
extension ExamTree {

    static var Locomoteur:categorieExamen.Categorie {
        let catLocomoteur = categorieExamen.Categorie(nom:"Locomoteur",namedImage: "os_icon.png",showNom: false)
        catLocomoteur.startNewLine()
        let examCatLocomoteur : [Examen] = [
            self.Document.asExamen(),
            Check("Pas sous anti-coagulant"),
            Check("Pas sous anti-agrégant"),            
        ]
        catLocomoteur.subitems=["Plaie"]
        catLocomoteur.subitems.append("Face")
        catLocomoteur.subitems.append("Epaule")
        catLocomoteur.subitems.append("Coude")
        catLocomoteur.subitems.append("AvantBras")
        catLocomoteur.subitems.append("Main")
        catLocomoteur.subitems.append("Doigt")
        catLocomoteur.subitems.append("Hanche")
        catLocomoteur.subitems.append("Genou")
        catLocomoteur.subitems.append("Jambe")
        catLocomoteur.subitems.append("Cheville")
       
//        catLocomoteur.subitems!["Epaule"] = ExamTree.Epaule.asExamen()
//        catLocomoteur.subitems!["Coude"] = ExamTree.Coude.asExamen()
//        catLocomoteur.subitems!["AvantBras"] = ExamTree.AvantBras.asExamen()
//        catLocomoteur.subitems!["Main"] = ExamTree.Main.asExamen()
//        catLocomoteur.subitems!["Doigt"] = ExamTree.Doigt.asExamen()
//        catLocomoteur.subitems!["RachisLombaire"] = ExamTree.RachisLombaire.asExamen()
//        catLocomoteur.subitems!["Hanche"] = ExamTree.Hanche.asExamen()
//        catLocomoteur.subitems!["Genou"] = ExamTree.Genou.asExamen()
//        catLocomoteur.subitems!["Jambe"] = ExamTree.Jambe.asExamen()
//        catLocomoteur.subitems!["Cheville"] = ExamTree.Cheville.asExamen()
////        catLocomoteur.subItemDel=#selector(ExamTree.subitemsLocomoteur)
        
        catLocomoteur.examens=examCatLocomoteur
        return catLocomoteur
    }
    static var TypeTrauma:categorieExamen.Categorie {
        let catTypeTrauma = categorieExamen.Categorie(nom:"Type Trauma",namedImage: "os_icon.png",showNom: true)
        catTypeTrauma.startLI()
        let examCatTypeTrauma : [Examen] = [
            Check("Trauma direct"),
            Check("Trauma indirect"),
            Check("Chute"),
            Check("Compression/Ecrasement"),
            Check("Torsion"),
            Check("Etirement"),
            Check("En sautant"),Check("En courant"),
            Check("en varus forcé"),
            Check("en valgus forcé"),
            Check("haute vélocité"),
            Check("faible vélocité"),
            
            
            ]
        catTypeTrauma.examens=examCatTypeTrauma
        return catTypeTrauma
    }
    static var LocoFonctionnel:categorieExamen.Categorie {
        let catLocoFonctionnel = categorieExamen.Categorie(nom:"LocoFonctionnel",namedImage: "os_icon.png",showNom: false)
        let examCatLocoFonctionnel : [Examen] = [
            OuiNon("Examen clinique dans les limites de la normale"),
            OuiNon("Gène significative de la mobilité active"),
            OuiNon("Gène significative de la mobilité passive"),
            OuiNon("Impotence fonctionnelle"),
            Check("Impotence fonctionnelle partielle"),
            Check("Examen des mobilités limité par la douleur"),
            Check("Examen des mobilités limité par la douleur et l'oedeme"),
            OuiNon("Déformation"),
            OuiNon("Tuméfaction"),
            Check("Contusion"),
            OuiNon("Oedeme péri-articulaire"),
            OuiNon("Oedeme péri-lésionel"),
            OuiNon("Gène à la mobilité articulaire"),
            Check("Flexion limitée"),
            Check("Extension limitée"),
            Check("Adduction limitée"),
            Check("Abduction limitée"),
            Check("Position antalgique"),
            Check("Position vicieuse"),
            OuiNon("déficit sensitif"),
            OuiNon("déficit moteur"),
            OuiNon("Amyotrophie"),
            OuiNon("Trouble vasculaire distal"),
            
            ]
        catLocoFonctionnel.examens=examCatLocoFonctionnel
        return catLocoFonctionnel
    }
    static var Main:categorieExamen.Categorie {
        let catMain = categorieExamen.Categorie(nom:"Main",namedImage: "main_icon.png",showNom: true)
        let examCatMain : [Examen] = [
            self.regionAnat,
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            ]
        catMain.examens=examCatMain
        return catMain
    }
    static var Poignet:categorieExamen.Categorie {
        let catPoignet = categorieExamen.Categorie(nom:"Poignet",namedImage: "os_icon.png",showNom: true)
        let examCatPoignet : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            ]
        catPoignet.examens=examCatPoignet
        return catPoignet
    }
    static var AvantBras:categorieExamen.Categorie {
        let catAvantBras = categorieExamen.Categorie(nom:"AvantBras",namedImage: "os_icon.png",showNom: true)
        let examCatAvantBras : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            ]
        catAvantBras.examens=examCatAvantBras
        return catAvantBras
    }
    static var Jambe:categorieExamen.Categorie {
        let catJambe = categorieExamen.Categorie(nom:"Jambe",namedImage: "os_icon.png",showNom: true)
        let examCatJambe : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            ]
        catJambe.examens=examCatJambe
        return catJambe
    }
    static var Bras:categorieExamen.Categorie {
        let catBras = categorieExamen.Categorie(nom:"Bras",namedImage: "os_icon.png",showNom: true)
        let examCatBras : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            
            ]
        catBras.examens=examCatBras
        return catBras
    }
    
    static var Doigt:categorieExamen.Categorie {
        let catDoigt = categorieExamen.Categorie(nom:"Doigt",namedImage: "main_icon.png",showNom: true)
        let examCatDoigt : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            
            ]
        catDoigt.examens=examCatDoigt
        return catDoigt
    }
    static var RachisCervical:categorieExamen.Categorie {
        let catRachisCervical = categorieExamen.Categorie(nom:"Rachis Cervical",namedImage: "os_icon.png",showNom: true)
        let examCatRachisCervical : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catRachisCervical.examens=examCatRachisCervical
        return catRachisCervical
    }
    static var RachisLombaire:categorieExamen.Categorie {
        let catRachisLombaire = categorieExamen.Categorie(nom:"Rachis Lombaire",namedImage: "os_icon.png",showNom: true)
        let examCatRachisLombaire : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            ]
        catRachisLombaire.examens=examCatRachisLombaire
        return catRachisLombaire
    }
    static var Hanche:categorieExamen.Categorie {
        let catHanche = categorieExamen.Categorie(nom:"Hanche",namedImage: "os_icon.png",showNom: true)
        let examCatHanche : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            ]
        catHanche.examens=examCatHanche
        return catHanche
    }
    
    static var Face:categorieExamen.Categorie {
        let catFace = categorieExamen.Categorie(nom:"Face/Visage",namedImage: "tete_icon.png",showNom: true)
        let examCatFace : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            
            ]
        catFace.examens=examCatFace
        return catFace
    }
    
    
    static var Coude:categorieExamen.Categorie {
        let catCoude = categorieExamen.Categorie(nom:"Coude",namedImage: "os_icon.png",showNom: true)
        let examCatCoude : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            
            ]
        catCoude.examens=examCatCoude
        return catCoude
    }
    
    static var Genou:categorieExamen.Categorie {
        let catGenou = categorieExamen.Categorie(nom:"Genou",namedImage: "os_icon.png",showNom: true)
        let examCatGenou : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            Examen(intitule: "différence de circonférence", type:  .donnee ),
            OuiNon("Choc rotulien"),
            OuiNon("lésion LCA au test de Lachman"),
            OuiNon("lésion LCA au test de Lemaire (subluxation du tibia à 15° de flexion + RI du pied)"),
            OuiNon("Tirroir antéro-postérieur"),
            OuiNon("Baillement/laxité latérale"),
            OuiNon("LLI douloureux à la palpation"),
            OuiNon("augmenté en valgus forcé"),
            OuiNon("LLE douloureux à la palpation"),
            OuiNon("augmenté en varus forcé"),
            OuiNon("Sensation de blocage"),
            OuiNon("Sensation d'instabilité"),
            
            ]
        catGenou.examens=examCatGenou
        return catGenou
    }
    static var Epaule:categorieExamen.Categorie {
        let catEpaule = categorieExamen.Categorie(nom:"Epaule",namedImage: "<#image#>",showNom: true)
        let examCatEpaule : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            OuiNon("Douleur acromio-clavulaire"),
            Check("\"touche de piano\""),
            OuiNon("Instabilité acromio-clavulaire"),
            OuiNon("Douleur sterno-clavulaire"),
            Examen(intitule: "Rotation externe passive (0-90°)", type:  .donnee ),
            Examen(intitule: "Rotation Interne (pouce)", type:  .donnee ),
            OuiNon("douleur au Palm-Up test (long biceps)"),
            OuiNon("douleur au test de Jobe (sus épineux)"),
            OuiNon("douleur au test de Yocum (Coiffe)"),
            Examen(intitule: "Evaluation Yocum passif \"C Test\" (N=130°)", type:  .donnee ),
            
            ]
        catEpaule.examens=examCatEpaule
        return catEpaule
    }
    
}