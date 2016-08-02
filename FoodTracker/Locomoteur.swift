//
//  Locomoteur.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 18/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation
extension ExamTree {
    
    static var locoMoteurCommun:categorieExamen.Categorie {
        let catlocoMoteurCommun = categorieExamen.Categorie(nom:"locoMoteurCommun",namedImage: "<#image#>",showNom: false)
        let examCatlocoMoteurCommun = [
            self.regionAnat,
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            OuiNon("Trouble de la recoloration cutanée"),
            OuiNon("déficit sensitif"),
            OuiNon("déficit moteur"),
            Check("Pas de déficit sensitivo-moteur distal"),
            Check("Froideur distale"),
            Plaie.asExamen(),
            ]
        catlocoMoteurCommun.examens=examCatlocoMoteurCommun
        return catlocoMoteurCommun
    }
    static var LocAnat:categorieExamen.Categorie {
        let catLocAnat = categorieExamen.Categorie(nom:"Loc.  anatomique",namedImage: "os_icon.png",showNom: false)
        catLocAnat.formatPreString=""
        let examCatLocAnat : [Examen] = [
            Check("droit(e)",poststring: ""),
            Check("gauche",poststring: ""),
            Examen(intitule: "Description zone", datastr: ["1/3 distal","1/3 proximal","1/3 moyen","1/3 inférieur","1/3 supérieur",].sort() ),
            Examen(intitule: "Bord", type:  .check, info: " "  ),
            Examen(intitule: "Extrémité", type:  .check, info: " "  ),
            Examen(intitule: "face", type:  .check, info: " "  ),
            Examen(intitule: "corps face", imageName: "corps femme front.png"),
            Examen(intitule: "corps face", imageName: "corps femme back.png"),
            Check("interne (e)"),
            Check("médial (e)"),
            Check("médian"),
            Check("latéral(e)"),
            Check("externe"),
            Examen(intitule: "1/3", type:  .check , info : " " ),
            Examen(intitule: "1/4", type:  .check, info: " "  ),
            Check("antérieur(e)"),
            Check("postérieur(e)"),
            Check("inférieur(e)"),
            Check("Moyen"),
            Check("supérieur(e)"),
            Check("proximal(e)"),
            Check("distal(e)"),
            Check("droit(e)"),
            Check("gauche"),
            Check("bilatéral(e)"),
            
            ]
        catLocAnat.examens=examCatLocAnat
        return catLocAnat
    }
    static var Locomoteur:categorieExamen.Categorie {
        let catLocomoteur = categorieExamen.Categorie(nom:"Locomoteur",namedImage: "os_icon.png",showNom: false)
        // catLocomoteur.startNewLine()
        let examCatLocomoteur : [Examen] = [
            self.Document.asExamen(),
            Check("Pas sous anti-coagulant"),
            Check("Pas sous anti-agrégant"),
            locoMoteurCommun.asExamen(),
            ]
        catLocomoteur.subitems=["Plaie"]
        catLocomoteur.subitems.append("Face")
        catLocomoteur.subitems.append("Bras")
        catLocomoteur.subitems.append("Epaule")
        catLocomoteur.subitems.append("Coude")
        catLocomoteur.subitems.append("AvantBras")
        catLocomoteur.subitems.append("Main")
        catLocomoteur.subitems.append("Doigt")
        catLocomoteur.subitems.append("Hanche")
        catLocomoteur.subitems.append("Genou")
        catLocomoteur.subitems.append("Jambe")
        catLocomoteur.subitems.append("Cheville")
        
        
        catLocomoteur.examens=examCatLocomoteur
        return catLocomoteur
    }
    static var TypeTrauma:categorieExamen.Categorie {
        let catTypeTrauma = categorieExamen.Categorie(nom:"<br>Type Trauma",namedImage: "os_icon.png",showNom: true)
        // catTypeTrauma.startLI()
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
            OuiNon("Instabilité"),
            Check("Trop algique pour une évaluation fonctionnelle complète"),
            OuiNon("Douleur au repos"),
            OuiNon("Douleur a la mobilisation"),
            OuiNon("Déformation"),
            OuiNon("Tuméfaction"),
            Check("Contusion"),
            OuiNon("Oedeme péri-articulaire"),
            OuiNon("Oedeme péri-lésionel"),
            
            OuiNon("Gène significative de la mobilité active"),
            OuiNon("Gène significative de la mobilité passive"),
            OuiNon("Impotence fonctionnelle"),
            Check("Impotence fonctionnelle partielle"),
            Check("Examen des mobilités limité par la douleur"),
            Check("Examen des mobilités limité par la douleur et l'oedeme"),
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
            locoMoteurCommun.asExamen(),
            OuiNon("perte de l'effet ténodèse à la flexion/extension du poignet"),
            ]
        catMain.subitems.append("Poignet")
        catMain.subitems.append("Doigt")
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
    static var vascularisationDoigt:categorieExamen.Categorie {
        let catvascularisationDoigt = categorieExamen.Categorie(nom:"vascularisation",namedImage: "<#image#>",showNom: false)
        let examCatvascularisationDoigt = [
            Check("Pas de déficit sensitivomoteur"),
            OuiNon("Paleur cutanée distale"),
            OuiNon("Disparition du galbe pulpaire"),
            OuiNon("Pouls capillaire"),
            Check("froideur des extrémités"),
            
            Check("hypoesthésie"),
            Check("anesthésie distale"),
            Check("paresthésie"),
            
            ]
        catvascularisationDoigt.examens=examCatvascularisationDoigt
        return catvascularisationDoigt
    }
    
    static var Doigt:categorieExamen.Categorie {
        let catDoigt = categorieExamen.Categorie(nom:"Doigt",namedImage: "main_icon.png",showNom: true)
        let examCatDoigt : [Examen] = [
            Examen(intitule: "identification doigt", datastr: ["Pouce","Index","Majeur","Annulaire","Auriculaire","Hallux","2ième orteil","3ième orteil","4ième orteil","5ième orteil",].sort() ),
            locoMoteurCommun.asExamen(),
            
            Examen(intitule: "fracture métacarpes", imageName: "fractures métacarpe.png.map"),
            Check("(Maintien des doigts non testés en extension)"),
            OuiNon("deficit du fléchisseur superficiel"),
            
            Check("(flexion elective de l'IPD)"),
            OuiNon("deficit du fléchisseur profond"),
            
            OuiNon("perte de l'effet ténodèse à la flexion/extension du poignet"),
            
            Check("(Hyperextension active des MCP main à plat)"),
            OuiNon("Deficit des tendons extenseurs communs"),
            
            Check("(Extension active IPD contre resistance P3)"),
            OuiNon("Déficit des bandelettes terminales de l'appareil extenseur"),
            
            OuiNon("Perte de convergence des doigts en flexion"),
            Check("(Extension active IPP contre resistance P2)"),
            OuiNon("Déficit des bandelettes medianes l'appareil extenseur"),
            
            //Examen(
        ]
        catDoigt.examens=examCatDoigt
        return catDoigt
    }
    static var AvantBras:categorieExamen.Categorie {
        let catAvantBras = categorieExamen.Categorie(nom:"AvantBras",namedImage: "os_icon.png",showNom: true)
        let examCatAvantBras : [Examen] = [
            locoMoteurCommun.asExamen(),
            
            ]
        catAvantBras.examens=examCatAvantBras
        return catAvantBras
    }
    static var Jambe:categorieExamen.Categorie {
        let catJambe = categorieExamen.Categorie(nom:"Jambe",namedImage: "os_icon.png",showNom: true)
        let examCatJambe : [Examen] = [
            locoMoteurCommun.asExamen(),
            ]
        catJambe.examens=examCatJambe
        return catJambe
    }
    static var Bras:categorieExamen.Categorie {
        let catBras = categorieExamen.Categorie(nom:"Bras",namedImage: "os_icon.png",showNom: true)
        let examCatBras : [Examen] = [
            locoMoteurCommun.asExamen(),
            Examen(intitule: "fracture extrémité supérieure humérus", imageName: "fracture_sup_humerus.png.map") // fracture_sup_humerus.png
            
            ]
        catBras.examens=examCatBras
        return catBras
    }
    
    static var RachisCervical:categorieExamen.Categorie {
        let catRachisCervical = categorieExamen.Categorie(nom:"Rachis Cervical",namedImage: "os_icon.png",showNom: true)
        let examCatRachisCervical : [Examen] = [
            locoMoteurCommun.asExamen(),
            
            ]
        catRachisCervical.examens=examCatRachisCervical
        return catRachisCervical
    }
    static var RachisLombaire:categorieExamen.Categorie {
        let catRachisLombaire = categorieExamen.Categorie(nom:"Rachis Lombaire",namedImage: "os_icon.png",showNom: true)
        let examCatRachisLombaire : [Examen] = [
            locoMoteurCommun.asExamen(),
            
            ]
        catRachisLombaire.examens=examCatRachisLombaire
        return catRachisLombaire
    }
    static var Hanche:categorieExamen.Categorie {
        let catHanche = categorieExamen.Categorie(nom:"Hanche",namedImage: "os_icon.png",showNom: true)
        let examCatHanche : [Examen] = [
            Examen(intitule: "doc fracture du col fémoral", imageName: "fracture_femur.png.map"),
            locoMoteurCommun.asExamen(),
            OuiNon("Racourcissement"),
            OuiNon("Rotation externe"),
            Check("Station debout possible"),
            Check("Orthostatisme impossible"),
            
            ]
        catHanche.examens=examCatHanche
        return catHanche
    }
    
    static var Face:categorieExamen.Categorie {
        let catFace = categorieExamen.Categorie(nom:"Face/Visage",namedImage: "tete_icon.png",showNom: true)
        let examCatFace : [Examen] = [
            locoMoteurCommun.asExamen(),
            
            ]
        catFace.examens=examCatFace
        return catFace
    }
    
    
    static var Coude:categorieExamen.Categorie {
        let catCoude = categorieExamen.Categorie(nom:"Coude",namedImage: "os_icon.png",showNom: true)
        let examCatCoude : [Examen] = [
            locoMoteurCommun.asExamen(),
            Check("Attitude type pronation douloureuse, bras en extension non algique en dehors de la mobilisation"),
            Check("Reduction par manoeuvre de Broca"),
            ]
        catCoude.examens=examCatCoude
        return catCoude
    }
    
    static var Genou:categorieExamen.Categorie {
        let catGenou = categorieExamen.Categorie(nom:"Genou",namedImage: "os_icon.png",showNom: true)
        let examCatGenou : [Examen] = [
            
            locoMoteurCommun.asExamen(),
            Examen(intitule: "déformation", datastr: ["varum","valgum","flexum","recurvatum"].sort() ),
            Examen(intitule: "différence de circonférence", type:  .donnee ),
            OuiNon("Choc rotulien"),
            OuiNon("Instabilité"),
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
//     static var mobiliteEpaule:categorieExamen.Categorie {
//        let catmobiliteEpaule = categorieExamen.Categorie(nom:"<br>Mobilité",namedImage: "os_icon.png",showNom: true)
//        let examCatmobiliteEpaule = [
//            // Examen(intitule: "Xie", type:  .check ,info: " "),
//            //Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
//            //Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
//            Examen(intitule: "libre", type:  .reponsecourte ),
//            Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
//        ]
//        catmobiliteEpaule.examens=examCatmobiliteEpaule
//        return catmobiliteEpaule
//    }

    static var Epaule:categorieExamen.Categorie {
        let catEpaule = categorieExamen.Categorie(nom:"Epaule",namedImage: "<#image#>",showNom: true)
        let examCatEpaule : [Examen] = [
            locoMoteurCommun.asExamen(),
            OuiNon("Douleur acromio-clavulaire"),
            Check("\"touche de piano\""),
            OuiNon("Instabilité acromio-clavulaire"),
            OuiNon("Douleur sterno-clavulaire"),
            Examen(intitule: "mobilité épaule", imageName: "mobilite_epaule.png.map"),
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
    static var Cheville:categorieExamen.Categorie {
        let catCheville = categorieExamen.Categorie(nom:"Cheville",namedImage: "pied_icon.png",showNom: true)
        catCheville.startLI()
        let examCatCheville : [Examen] = [
            locoMoteurCommun.asExamen(),
            self.LocoFonctionnel.asExamen(),
            Examen(intitule: "\"craquement\" lors du traumatisme", type:  .ouinon ,info: " "),
            Examen(intitule: "Evolution en deux temps (aggravation secondaire)", type:  .check),
            Examen(intitule: "Appui possible", type:  .ouinon ,info: " "),
            Check("Marche possible"),
            Check("Marche impossible"),
            OuiNon("déformation apparente"),
            OuiNon("Oedeme peri-malleolaire externe"),
            OuiNon("Oedeme peri-malleolaire interne"),
            OuiNon("Oedeme cou du pied"),
            OuiNon("hématome"),
            
            Check("douleur f.antérieur du LLE"),
            Check("douleur f.postérieur du LLE"),
            Check("douleur f.moyen du LLE"),
            OuiNon("douleur achilleene"),
            Check("Dermabrasion"),
            
            
            ]
        catCheville.examens=examCatCheville
        return catCheville
    }
    static var Suture:categorieExamen.Categorie {
        let catSuture = categorieExamen.Categorie(nom:"<br>Suture",namedImage: "nurse_icon.png",showNom: true)
        let examCatSuture = [
            Check("Désinfection bétadine"),
            Check("Anesthésie locale"),
            Check("Anesthésie Intra-thecale"),
            Check("Xylocaine non adrénalinée"),
            Check("<br>Exploration"),
            OuiNon("lésion d'élement musculo-tendineux"),
            OuiNon("lésion vasculaire"),
            Check("Corps étrangers"),
            Check("Nettoyage et brossage"),
            Check("Exérèse des tissus nécrotiques et contus"),
            Examen(intitule: "type suture parage", datastr: ["Parage sans suture","Suture en 2 plans","Suture revètement cutanée"].sort() ),
            
            Examen(intitule: "Ethycrin 3/0", type:  .donnee ),
            Examen(intitule: "Ethycrin 4/0", type:  .donnee ),
            Examen(intitule: "Ethycrin 5/0", type: .donnee),
            Examen(intitule: "Ethycrin 6/0", type:  .donnee ),
            Examen(intitule: "Résorbable 3/0", type:  .donnee ),
            Examen(intitule: "Résorbable 4/0", type:  .donnee ),
            Examen(intitule: "Résorbable 5/0", type: .donnee),
            Check("Stéristrip"),
            ]
        catSuture.examens=examCatSuture
        return catSuture
    }
    
    static var Plaie:categorieExamen.Categorie {
        let catPlaie = categorieExamen.Categorie(nom:"Plaie",namedImage: "nurse_icon.png",showNom: true)
        catPlaie.startLI()
        let examCatPlaie : [Examen] = [
            regionAnat,
            
            self.LocAnat.asExamen(),
            Examen(intitule: "situation", type:  .reponsecourte , tag: "libre"),
            Check("franche"),Check("déchiquetée"),
            Check("superficielle, ne dépassant pas le derme"),
            Examen(intitule: "contexte", type:  .reponsecourte ),
            
            Check("par écrasement"),
            Check("par lacération"),
            Check("par morsure"),
            Examen(intitule: "agent vulnérant", type:  .donnee ,tag: "libre"),
            Examen(intitule: "taille", type:  .donnee ,tag: "libre"),
            Check("bords nets"),
            Check("bords contus"),
            ]
        let  Plaie2: [Examen] = [
            Check("Souillure"),
            Check("perte de substance"),
            Check("présence de zones tissulaires dévitalisées"),
            OuiNon("élément noble visible"),
            Check("datant de plusieurs jours"),
            Check("datant de plus de 6 heures"),
            
            self.Suture.asExamen(),
            Examen(intitule: "Test d'immunité anti-tétanique", type:  .donnee ),
            Examen(intitule: "Antibioprophylaxie", type:  .donnee ),
            Check("Surveillance journalière"),
            
            Check("Ablation des points par IDE ou MT sous 5-8 jours selon cicatrisation"),
            
            Check("Ablation des points par IDE ou MT sous 8-10 jours selon cicatrisation"),
            
            
            ]
        catPlaie.examens=examCatPlaie+Plaie2
        return catPlaie
    }
    
}