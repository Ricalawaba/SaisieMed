//
//  ExamenTree.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 24/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

struct ExamTree {
    static var libre:Examen{
        return  Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre")
    }
    static var ConnuClinique:categorieExamen.Categorie {
        let catConnuClinique = categorieExamen.Categorie(nom:"Connu Clinique",namedImage: "medecin_icon.png",showNom: false)
        let examCatConnuClinique = [
            // Examen(intitule: "Xie", type:  .check ,info: " "),
            //Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            //Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
            Examen(intitule: "Suivi oncologique", type:  .check ),
            Examen(intitule: "Suivi cardiologique", type:  .check ),
            Examen(intitule: "Suivi pneumologique", type:  .check ),
            Examen(intitule: "Suivi neurologique", type:  .check ),
            Examen(intitule: "Suivi urologique", type:  .check ),
            Examen(intitule: "Intervention orthopédique", type:  .check ),
            Examen(intitule: "Déja vu en consultation", type:  .check ),
            
            //self.libre,
            Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"),
            Examen(intitule: "dernier contact", type:  .donnee ,tag: "date"),
            //    Examen(intitule: "Ajout médecin",type: .addinfo,tag: "medecin"),
            //self.libre,
        ]
        catConnuClinique.examens=examCatConnuClinique
        return catConnuClinique
    }
    
    
    // MARK: administratif
    static var administratif: categorieExamen.Categorie {
        let Categorie1 = categorieExamen.Categorie(nom: "Administratif",namedImage: "administratif_icon.png")
        
        let catModeVie = categorieExamen.Categorie(nom: "Mode de vie",namedImage: "femme.png")
        let excamCatModeVie = [
            Examen(intitule: "à son domicile", type:  .check ),
            Examen(intitule: "en institution", type:  .check ),
            Examen(intitule: "en maison de retraite", type:  .check ),
            Examen(intitule: "en maison médicalisée", type:  .check ),
            Examen(intitule: "avec sa famille", type:  .check ),
            Examen(intitule: "seul", type:  .check ),
            Examen(intitule: "en couple", type:  .check ),
            Examen(intitule: "Veuf(ve)", type:  .check ),
            Examen(intitule: "Pas d'enfants", type:  .check ),
            Examen(intitule: "enfants:", type:  .donnee ),
            //self.libre,
        ]
        catModeVie.examens=excamCatModeVie
        let catModeEntree = categorieExamen.Categorie(nom: "Mode d'entrée",namedImage: "ambulance_icon.png")
        let excamCatModeEntree = [
            Examen(intitule: "adressé par le centre 15", type:  .check ),
            Examen(intitule: "adressé par", type:  .check ),
            Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"),
            Examen(intitule: "(courrier)", type:  .check ),
            Examen(intitule: "(appel téléphonique)", type:  .check ),
            Examen(intitule: "se présente spontanément", type:  .check ),
            Examen(intitule: "n'a pas vu de médecin avant sa venue aux urgences", type:  .check ),
            Examen(intitule: "a contacté son médecin avant sa venue aux urgences", type:  .check ),
            Examen(intitule: "médicalisé par le SMUR", type:  .check ),
            Examen(intitule: "Médecin SMUR", type:  .selection ,tag: "medecin"),
            Examen(intitule: "Transporté par les Pompiers", type:  .check ),
            Examen(intitule: "Transporté par ambulance", type:  .check ),
            Examen(intitule: "non médicalisé", type:  .check ),
            Examen(intitule: "Amené par la Famille", type:  .check ),
            ]
        catModeEntree.examens=excamCatModeEntree
        
        
        let catConnu = categorieExamen.Categorie(nom: "Connu de la clinique:",namedImage: "medecin_icon.png")
        let examCatConnu = [
            Examen(intitule: "Pas de suivi dans l'établissement", type:  .check ),
            Examen(intitule: "Non", type:  .check ),
            self.ConnuClinique.asExamen(),
            
            Examen(intitule: "Ajout connu clinique",type: .addinfo,tag: "connuClinique"),
            //self.libre,
        ]
        catConnu.examens=examCatConnu
        
        
        let examcat1 = [
            Examen(intitule: "Nom Prénom", type:  .reponsecourte),
            Examen(intitule: "Masculin", type:  .ouinon),
            Examen(intitule: "Age", type:  .donnee,tag: "age"),
            Examen(intitule: "Localisation", type:  .selection, tag: "localisation"),
            Examen(categorie: ExamTree.motifs),
            Examen(intitule: "Méd.Trait.", type:  .selection ,tag: "medecin"),
            Examen(categorie: catModeEntree),
            Examen(categorie: catModeVie),
            Examen(intitule: "Profession", type:  .selection ,tag: "profession"),
            Examen(categorie: catConnu),
            //self.libre,
            
        ]
        Categorie1.examens = examcat1
        return Categorie1
    }
    
    
    static var atcd:categorieExamen.Categorie {
        let catATCD = categorieExamen.Categorie(nom:"atcd",namedImage: "nurse_icon.png",showNom: false)
        let examCatATCD = [
            Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            Examen(intitule: "bilatéral(e)", type:  .check ),
            Examen(intitule: "droit(e)", type:  .check ),
            Examen(intitule: "gauche", type:  .check ),
            Examen(intitule: "récidivant(e)s", type:  .check ),
            Examen(intitule: "probable", type:  .check ),
            Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
            Examen(intitule: "ou ?", type:  .selection,tag: "etablissement" ),
            Examen(intitule: "pas de suivi spécialisé", type:  .check ),
            Examen(intitule: "qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "Commentaire", type:  .reponsecourte )
        ]
        catATCD.examens=examCatATCD
        return catATCD
    }
    
    static var TTT:categorieExamen.Categorie {
        let catTTT = categorieExamen.Categorie(nom:"Traitement",namedImage: "medoc_icon.png",showNom: false)
        let examCatTTT = [
            Examen(intitule: "Nom", type:  .selection,tag: "medicament" ),
            Examen(intitule: "Posologie", type:  .selection,tag: "posologie" ),
            Examen(intitule: "depuis quand ?", type:  .reponsecourte,tag: "date" ),
            Examen(intitule: "par qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "pour", type:  .selection,tag: "atcd" ),
            
            //self.libre,
        ]
        catTTT.examens=examCatTTT
        return catTTT
    }
    static var LocAnat:categorieExamen.Categorie {
        let catLocAnat = categorieExamen.Categorie(nom:"Loc.  anatomique",namedImage: "os_icon.png",showNom: false)
        let examCatLocAnat = [
            Examen(intitule: "droit(e)", type:  .check ),
            Examen(intitule: "gauche", type:  .check ),

            Examen(intitule: "Bord", type:  .check, info: " "  ),
            Examen(intitule: "Extrémité", type:  .check, info: " "  ),
            Examen(intitule: "face", type:  .check, info: " "  ),
            Examen(intitule: "interne (e)", type:  .check ),
            Examen(intitule: "médial (e)", type:  .check ),
            Examen(intitule: "médian", type:  .check ),
            Examen(intitule: "latéral(e)", type:  .check ),
            Examen(intitule: "externe", type:  .check ),
            Examen(intitule: "1/3", type:  .check , info : " " ),
            Examen(intitule: "1/4", type:  .check, info: " "  ),
            Examen(intitule: "antérieur(e)", type:  .check ),
            Examen(intitule: "postérieur(e)", type:  .check ),
            Examen(intitule: "inférieur(e)", type:  .check ),
            Examen(intitule: "supérieur(e)", type:  .check ),
            Examen(intitule: "proximal(e)", type:  .check ),
            Examen(intitule: "distal(e)", type:  .check ),
            Examen(intitule: "droit(e)", type:  .check ),
            Examen(intitule: "gauche", type:  .check ),
            Examen(intitule: "bilatéral(e)", type:  .check ),
            //self.libre,
//            Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catLocAnat.examens=examCatLocAnat
        return catLocAnat
    }
    static var motif:categorieExamen.Categorie {
        let catMotif = categorieExamen.Categorie(nom:"Motif(s)",namedImage: "tete_icon.png",showNom: false)
        let examCatMotif = [
            Examen(intitule: "motif", type:  .selection,tag: "motif" ),
            Examen(categorie: self.LocAnat),
            //self.libre,
            
            ]
        catMotif.examens=examCatMotif
        return catMotif
    }
    static var motifs:categorieExamen.Categorie {
        let catMotifs = categorieExamen.Categorie(nom:"Motif(s)",namedImage: "tete_icon.png",showNom: true)
        let examCatMotifs = [
            motif.asExamen(),
            Examen(intitule: "Ajout motif",type: .addinfo,tag: "motif"),
            Examen(intitule: "début", type:  .donnee,tag: "date" ),
            //self.libre,
            ]
        catMotifs.examens=examCatMotifs
        return catMotifs
    }
    
    
    static var Plainte:categorieExamen.Categorie {
        let catPlainte = categorieExamen.Categorie(nom:"Plainte",namedImage: "tete_icon.png",showNom: false)
        let examCatPlainte = [
            Examen(intitule: "Signe", type:  .selection,tag: "motif" ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(categorie: LocAnat),
            
            Examen(intitule: "aigüe", type:  .check ),
            Examen(intitule: "sub-aigüe", type:  .check ),
            Examen(intitule: "intense", type:  .check ),
            Examen(intitule: "persistante", type:  .check ),
            Examen(intitule: "permanent", type:  .check ),
            Examen(intitule: "de survenue brutale", type:  .check ),
            Examen(intitule: "avec prodromes", type:  .check ),
            Examen(intitule: "d'évolution progressive", type:  .check ),
            Examen(intitule: "avec crises paroxystiques", type:  .check ),
            Examen(intitule: "début", type:  .donnee,tag: "date" ),
            Examen(intitule: "durée", type:  .donnee,tag: "date" ),
            //self.libre,
 //           Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
            
        ]
        catPlainte.examens=examCatPlainte
        return catPlainte
    }
    static var FRCV:categorieExamen.Categorie {
        let catFRCV = categorieExamen.Categorie(nom:"Facteurs de risques CV",namedImage: "cardio_icon.png",showNom: true)
        let examCatFRCV = [
            Examen(intitule: "Homme > 50 ans", type:  .check ),
            Examen(intitule: "Femme > 60 ans", type:  .check ),
            Examen(intitule: "Femme ménopausée", type:  .check ),
            Examen(intitule: "HTA", type:  .ouinon ),
            Examen(intitule: "Dyslipémie", type:  .ouinon ),
            Examen(intitule: "Diabète", type:  .ouinon ),
            Examen(intitule: "Obesité", type:  .ouinon ),
            Examen(intitule: "Surcharge pondérale", type:  .ouinon ),
            Examen(intitule: "Tabagisme", type:  .ouinon ),
            Examen(intitule: "Tabagisme sevré", type:  .check ),
            Examen(intitule: "Insuffisance rénale chronique", type:  .ouinon ),
            Examen(intitule: "Morbidité cardiovasculaire familiale", type:  .ouinon ),
            Examen(intitule: "précision", type:  .reponsecourte ,tag: "precisionCV"),
            ]
        catFRCV.examens=examCatFRCV
        return catFRCV
    }
    
    static var Comorbidite:categorieExamen.Categorie {
        let catComorbidite = categorieExamen.Categorie(nom:"Comorbidité/Antécédents",namedImage: "dossier.png",showNom: true)
        let examCatComorbidite = [
            Examen(intitule: "Pas d'atcds notables", type:  .check ),
            Examen(intitule: "Pas sous anti-coagulant", type:  .check ),
            Examen(intitule: "Pas sous anti-agrégant", type:  .check ),
            
            Examen(categorie: ExamTree.FRCV),
            Vaccin.asExamen(),
            Examen(intitule: "Allergie connue", type:  .ouinon ),
            Examen(intitule: "Allergie médicamenteuse connue", type:  .ouinon ),
            Examen(intitule: "Detail", type:  .reponsecourte, tag: "Allergie" ),
            ExamTree.atcd.asExamen(),
            Examen(intitule: "Ajout atcd",type: .addinfo,tag: "atcd"),
            Examen(intitule: "Usager de médecine alternative", type:  .check ),
  //          Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catComorbidite.examens=examCatComorbidite
        return catComorbidite
    }
    
    static var Vaccin:categorieExamen.Categorie {
        let catVaccin = categorieExamen.Categorie(nom:"Vaccination",namedImage: "piqure_icon.png",showNom: true)
        let examCatVaccin = [
            Examen(intitule: "Date dernier VAT inconnue", type:  .check ),
            Examen(intitule: "VAT à jour selon le patient", type:  .check ),
            Examen(intitule: "Date dernier VAT", type:  .donnee, tag: "date" ),
            Examen(intitule: "Date dernier DTP", type:  .donnee, tag: "date" ),
            Examen(intitule: "Voir avec médecin traitant", type:  .check ),
            Examen(intitule: "Couverture pneumoccocique", type:  .ouinon ),
            Examen(intitule: "Date Pneumo 23", type:  .donnee, tag: "date" ),
            Examen(intitule: "Vaccin hépatite B", type:  .ouinon ),
            Examen(intitule: "Vaccin anti-grippal annuel", type:  .check ),
            //self.libre,
  //          Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catVaccin.examens=examCatVaccin
        return catVaccin
    }
    
    static var Traitement:categorieExamen.Categorie {
        let catTraitement = categorieExamen.Categorie(nom:"Traitement",namedImage: "medoc_icon.png",showNom: true)
        let examCatTraitement = [
            Examen(intitule: "Pas de traitement au long cours", type:  .check ),
            Examen(intitule: "(Traitement vu sur ordonnance)", type:  .check ),
            Examen(intitule: "de qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "Date", type:  .donnee, tag: "date" ),

            Examen(intitule: "(Traitement indiqué par le patient)", type:  .check ),
            Examen(intitule: "(Traitement indiqué par l'entourage)", type:  .check ),
            Examen(intitule: "(Traitement non connu par le patient)", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            
            Examen(categorie: ExamTree.TTT),
            Examen(intitule: "Ajout traitement",type: .addinfo,tag: "TTT"),
 //           Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catTraitement.examens=examCatTraitement
        return catTraitement
    }
    
    static var Poids:categorieExamen.Categorie {
        let catPoids = categorieExamen.Categorie(nom:"Poids/Taille",namedImage: "homme.png",showNom: false)
        let examCatPoids = [
            Examen(intitule: "Taille (estimée)", type:  .donnee, tag: "taille" ),
            Examen(intitule: "Taille (mesurée)", type:  .donnee, tag: "taille" ),
            Examen(intitule: "Taille (indiqué par le patient)", type:  .donnee, tag: "taille" ),
            Examen(intitule: "Poids (estimé)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Poids (mesuré)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Poids (indiqué par le patient)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Variation pondérale récente significative", type:  .ouinon ),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            ]
        catPoids.examens=examCatPoids
        return catPoids
    }
    
    static var TA:categorieExamen.Categorie {
        setTensionMultiRow()
        let catTA = categorieExamen.Categorie(nom:"Tension artérielle",namedImage: "tension.png",showNom: false)
        let examCatTA = [
            tensionMultirow,
            Examen(intitule: "Tension bras droit", type: .multirowdatastr , tag: "tensionMultirow"),
            Examen(intitule: "Tension bras gauche", type: .multirowdatastr , tag: "tensionMultirow"),
            Examen(intitule: "Tension cheville droite", type: .multirowdatastr , tag: "tensionMultirow"),
            Examen(intitule: "Tension cheville gauche", type: .multirowdatastr , tag: "tensionMultirow"),
            
            Examen(intitule: "Index Pression Cheville (0,9<1,3)", type:  .donnee ,tag :"tension"),
            
            ]
        catTA.examens=examCatTA
        return catTA
    }
    static var Pancartes:categorieExamen.Categorie {
        let catPancartes = categorieExamen.Categorie(nom:"Pancartes",namedImage: "thermo_icon.png",showNom: true)
        let examCatPancartes = [
            Pancarte.asExamen(),
            Examen(intitule: "Ajout pancarte",type: .addinfo,tag: "pancarte"),
 //           Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catPancartes.examens=examCatPancartes
        return catPancartes
    }
    
    
    static var Pancarte:categorieExamen.Categorie {
        let catPancarte = categorieExamen.Categorie(nom:"Pancarte",namedImage: "pancarte_icon.png",showNom: false)
        let examCatPancarte = [
            Examen(intitule: "horodatage", type:  .reponsecourte,tag: "date" ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(categorie: self.TA),
            Examen(intitule: "FC", type:  .donnee,tag: "FC" ),
            self.temperatureMultirow,
            Examen(intitule: "T°", type:  .donnee ),
            Examen(intitule: "EVA", type:  .donnee,tag: "EVA" ),
            Examen(intitule: "SaO2% Air Ambiant", type:  .donnee, tag: "sao2" ),
            Examen(intitule: "SaO2% sous O2", type:  .donnee, tag: "sao2" ),
            Examen(intitule: "Fr. Resp", type:  .donnee ,tag: "fresp"),
            
            
   //         Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        
        
        catPancarte.examens=examCatPancarte
        return catPancarte
    }
    static var Cheville:categorieExamen.Categorie {
        let catCheville = categorieExamen.Categorie(nom:"Cheville",namedImage: "pied_icon.png",showNom: true)
        let examCatCheville = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            Examen(intitule: "\"craquement\" lors du traumatisme", type:  .ouinon ,info: " "),
            Examen(intitule: "Evolution en deux temps (aggravation secondaire)", type:  .check),
            Examen(intitule: "Appui possible", type:  .ouinon ,info: " "),
            Examen(intitule: "Marche possible", type:  .check ),
            Examen(intitule: "Marche impossible", type:  .check ),
            Examen(intitule: "déformation apparente", type:  .ouinon ),
            Examen(intitule: "Oedeme peri-malleolaire externe", type:  .ouinon ),
            Examen(intitule: "Oedeme peri-malleolaire interne", type:  .ouinon ),
            Examen(intitule: "Oedeme cou du pied", type:  .ouinon ),
            Examen(intitule: "hématome", type:  .ouinon ),
            //self.libre,
            Examen(intitule: "douleur f.antérieur du LLE", type:  .check ),
            Examen(intitule: "douleur f.postérieur du LLE", type:  .check ),
            Examen(intitule: "douleur f.moyen du LLE", type:  .check ),
            Examen(intitule: "douleur achilleene", type:  .ouinon ),
            Examen(intitule: "Dermabrasion", type:  .check ),
            
 //           Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
            
        ]
        catCheville.examens=examCatCheville
        return catCheville
    }
    static var Plaie:categorieExamen.Categorie {
        let catPlaie = categorieExamen.Categorie(nom:"Plaie",namedImage: "nurse_icon.png",showNom: true)
        let examCatPlaie = [
            Examen(intitule: "situation", type:  .reponsecourte ),
             self.LocAnat.asExamen(),
            Examen(intitule: "superficielle", type:  .check ),
            Examen(intitule: "contexte", type:  .reponsecourte ),
            //self.libre,
            Examen(intitule: "par écrasement", type:  .check ),
            Examen(intitule: "par lacération", type:  .check ),
            Examen(intitule: "par morsure", type:  .check ),
            Examen(intitule: "taille", type:  .donnee ),
            Examen(intitule: "bords nets", type:  .check ),
            Examen(intitule: "bords contus", type:  .check ),
            Examen(intitule: "plaie souillée", type:  .check ),
            Examen(intitule: "perte de substance", type:  .check ),
            Examen(intitule: "présence de zones tissulaires dévitalisées", type:  .check ),
            Examen(intitule: "datant de plusieurs jours", type:  .check ),
             Examen(intitule: "datant de plus de 6 heures", type:  .check ),
            Examen(intitule: "Désinfection bétadine", type:  .check ),
            Examen(intitule: "Anesthésie locale", type:  .check ),
            Examen(intitule: "Anesthésie Intra-thecale", type:  .check ),
            Examen(intitule: "Xylocaine non adrénalinée", type:  .check ),
            Examen(intitule: "Exploration", type:  .check ),
            Examen(intitule: "Corps étrangers", type:  .check ),
             Examen(intitule: "Nettoyage et brossage", type:  .check ),
            Examen(intitule: "Exérèse des tissus nécrotiques ou contus", type:  .check ),
            Examen(intitule: "Suture en 2 plans", type:  .check ),
            
            Examen(intitule: "Suture revëtement cutanée", type:  .check ),
            Examen(intitule: "Ethycrin 3/0", type:  .donnee ),
            Examen(intitule: "Ethycrin 4/0", type:  .donnee ),
            Examen(intitule: "Ethycrin 5/0", type: .donnee),
            Examen(intitule: "Ethycrin 6/0", type:  .donnee ),
            Examen(intitule: "Résorbable 3/0", type:  .donnee ),
            Examen(intitule: "Résorbable 4/0", type:  .donnee ),
            Examen(intitule: "Résorbable 5/0", type: .donnee),
            Examen(intitule: "Test d'immunité anti-tétanique", type:  .donnee ),
            Examen(intitule: "Antibioprophylaxie", type:  .donnee ),
            Examen(intitule: "Surveillance journalière", type:  .check ),
            
            Examen(intitule: "Ablation des points par IDE ou MT sous 5-8 jours selon cicatrisation", type:  .check ),
            
            Examen(intitule: "Ablation des points par IDE ou MT sous 8-10 jours selon cicatrisation", type:  .check ),
     //       Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
            
        ]
        catPlaie.examens=examCatPlaie
        return catPlaie
    }
    static var CardioAuscultation:categorieExamen.Categorie {
        let catCardioAuscultation = categorieExamen.Categorie(nom:"auscultation",namedImage: "cardio2_icon.png",showNom: true)
        let examCatCardioAuscultation = [
            Examen(intitule: "BDC régulier", type:  .check ),
            Examen(intitule: "BDC irrégulier", type:  .check ),
            Examen(intitule: "Pas de souffle cardiaque", type:  .check ),
            Examen(intitule: "Souffle cardiaque", type:  .donnee ),
            Examen(intitule: "Souffle carotidien", type:  .ouinon ),
            Examen(intitule: "Souffle abdominal", type:  .ouinon ),
            Examen(intitule: "Souffle fémoral", type:  .ouinon ),
            Examen(intitule: "Souffle carotidien", type:  .ouinon ),
            Examen(intitule: "Pas de crépitants", type:  .check ),
            Examen(intitule: "Rales crépitants aux bases", type:  .check ),
            Examen(intitule: "Rales crépitants étendues", type:  .check ),
            ]
        catCardioAuscultation.examens=examCatCardioAuscultation
        return catCardioAuscultation
    }
    
    static var CardioFonctionnel:categorieExamen.Categorie {
        let catCardioFonctionnel = categorieExamen.Categorie(nom:"Fonctionnel",namedImage: "cardio_icon.png",showNom: true)
        let examCatCardioFonctionnel = [
            Examen(intitule: "Douleur thoracique", type:  .ouinon ),
            Examen(intitule: "en barre", type:  .check ),
            Examen(intitule: "en pointe", type:  .check ),
            Examen(intitule: "type brulure", type:  .check ),
            Examen(intitule: "Irradiation membre supérieur gauche", type:  .check ),
            Examen(intitule: "Irradiation membre supérieur droit", type:  .check ),
            Examen(intitule: "Irradiation dans le cou", type:  .check ),
            Examen(intitule: "Augmentation à la palpation", type:  .ouinon ),
            Examen(intitule: "Modification par la mobilisation rachidienne", type:  .ouinon ),
            Examen(intitule: "Modification par les mouvements respiratoires", type:  .ouinon ),
            
            
            Examen(intitule: "Détail", type:  .reponsecourte ),
            Examen(intitule: "Dyspnée", type:  .ouinon ),
            Examen(intitule: "NYHA 1 (Aucune gène fonctionnelle)", type:  .check ),
            Examen(intitule: "NYHA 2 (gène à l'effort seulement)", type:  .check ),
            Examen(intitule: "NYHA 3 (gène a l'effort modérée)", type:  .check ),
            Examen(intitule: "NYHA 4 (gène au moindre effort)", type:  .check ),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            Examen(intitule: "Palpitations", type:  .ouinon ),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            Examen(intitule: "Toux", type:  .ouinon ),
            Examen(intitule: "grasse", type:  .check ),
            Examen(intitule: "sèche", type:  .check ),
            Examen(intitule: "Expectorations mousseuses", type:  .ouinon ),
            ]
        catCardioFonctionnel.examens=examCatCardioFonctionnel
        return catCardioFonctionnel
    }
    
    
    static var TypeTrauma:categorieExamen.Categorie {
        let catTypeTrauma = categorieExamen.Categorie(nom:"Type Trauma",namedImage: "os_icon.png",showNom: true)
        let examCatTypeTrauma = [
            Examen(intitule: "Trauma direct", type:  .check ),
            Examen(intitule: "Trauma indirect", type:  .check ),
            Examen(intitule: "Chute", type:  .check ),
            Examen(intitule: "Compression/Ecrasement", type:  .check ),
            Examen(intitule: "Torsion", type:  .check ),
            Examen(intitule: "Etirement", type:  .check ),
            
            Examen(intitule: "en varus forcé", type:  .check ),
            Examen(intitule: "en valgus forcé", type:  .check ),
            //self.libre,
            ]
        catTypeTrauma.examens=examCatTypeTrauma
        return catTypeTrauma
    }
    static var LocoFonctionnel:categorieExamen.Categorie {
        let catLocoFonctionnel = categorieExamen.Categorie(nom:"LocoFonctionnel",namedImage: "os_icon.png",showNom: false)
        let examCatLocoFonctionnel = [
            Examen(intitule: "Examen clinique dans les limites de la normale", type:  .ouinon ),
            Examen(intitule: "Gène significative de la mobilité active", type:  .ouinon ),
            Examen(intitule: "Gène significative de la mobilité passive", type:  .ouinon ),
            Examen(intitule: "Impotence fonctionnelle", type:  .ouinon ),
            Examen(intitule: "Impotence fonctionnelle partielle", type:  .check ),
            Examen(intitule: "Examen des mobilités limité par la douleur", type:  .check ),
            Examen(intitule: "Examen des mobilités limité par la douleur et l'oedeme", type:  .check ),
            Examen(intitule: "Déformation", type:  .ouinon ),
            Examen(intitule: "Tuméfaction", type:  .ouinon ),
            Examen(intitule: "Contusion", type:  .check ),
            Examen(intitule: "Oedeme péri-articulaire", type:  .ouinon ),
            Examen(intitule: "Oedeme péri-lésionel", type:  .ouinon ),
            Examen(intitule: "Gène à la mobilité articulaire", type:  .ouinon ),
            Examen(intitule: "Flexion limitée", type: .check),
            Examen(intitule: "Extension limitée", type: .check),
            Examen(intitule: "Adduction limitée", type: .check),
            Examen(intitule: "Abduction limitée", type: .check),
            Examen(intitule: "Position antalgique", type: .check),
            Examen(intitule: "Position vicieuse", type: .check),
            Examen(intitule: "déficit sensitif", type: .ouinon),
            Examen(intitule: "déficit moteur", type: .ouinon),
            Examen(intitule: "Amyotrophie", type: .ouinon),
            Examen(intitule: "Trouble vasculaire distal", type: .ouinon),
            //self.libre,
            ]
        catLocoFonctionnel.examens=examCatLocoFonctionnel
        return catLocoFonctionnel
    }
     static var Main:categorieExamen.Categorie {
        let catMain = categorieExamen.Categorie(nom:"Main",namedImage: "main_icon.png",showNom: true)
        let examCatMain = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
   //         Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catMain.examens=examCatMain
        return catMain
    }
static var Poignet:categorieExamen.Categorie {
        let catPoignet = categorieExamen.Categorie(nom:"Poignet",namedImage: "os_icon.png",showNom: true)
        let examCatPoignet = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
   //         Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catPoignet.examens=examCatPoignet
        return catPoignet
    }
static var AvantBras:categorieExamen.Categorie {
        let catAvantBras = categorieExamen.Categorie(nom:"AvantBras",namedImage: "os_icon.png",showNom: true)
        let examCatAvantBras = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
   //         Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catAvantBras.examens=examCatAvantBras
        return catAvantBras
    }
static var Jambe:categorieExamen.Categorie {
        let catJambe = categorieExamen.Categorie(nom:"Jambe",namedImage: "os_icon.png",showNom: true)
        let examCatJambe = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
  //          Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catJambe.examens=examCatJambe
        return catJambe
    }
static var Bras:categorieExamen.Categorie {
        let catBras = categorieExamen.Categorie(nom:"Bras",namedImage: "os_icon.png",showNom: true)
        let examCatBras = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
            Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catBras.examens=examCatBras
        return catBras
    }

    static var Doigt:categorieExamen.Categorie {
        let catDoigt = categorieExamen.Categorie(nom:"Doigt",namedImage: "main_icon.png",showNom: true)
        let examCatDoigt = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
            Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catDoigt.examens=examCatDoigt
        return catDoigt
    }
    static var RachisCervical:categorieExamen.Categorie {
        let catRachisCervical = categorieExamen.Categorie(nom:"Rachis Cervical",namedImage: "os_icon.png",showNom: true)
        let examCatRachisCervical = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
            Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catRachisCervical.examens=examCatRachisCervical
        return catRachisCervical
    }
static var RachisLombaire:categorieExamen.Categorie {
        let catRachisLombaire = categorieExamen.Categorie(nom:"Rachis Lombaire",namedImage: "os_icon.png",showNom: true)
        let examCatRachisLombaire = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
   //         Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catRachisLombaire.examens=examCatRachisLombaire
        return catRachisLombaire
    }
static var Hanche:categorieExamen.Categorie {
        let catHanche = categorieExamen.Categorie(nom:"Hanche",namedImage: "os_icon.png",showNom: true)
        let examCatHanche = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
     //       Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catHanche.examens=examCatHanche
        return catHanche
    }

static var Face:categorieExamen.Categorie {
        let catFace = categorieExamen.Categorie(nom:"Face/Visage",namedImage: "tete_icon.png",showNom: true)
        let examCatFace = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
          //  Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catFace.examens=examCatFace
        return catFace
    }


     static var Coude:categorieExamen.Categorie {
        let catCoude = categorieExamen.Categorie(nom:"Coude",namedImage: "os_icon.png",showNom: true)
        let examCatCoude = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            //self.libre,
            //Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catCoude.examens=examCatCoude
        return catCoude
    }

    static var Genou:categorieExamen.Categorie {
        let catGenou = categorieExamen.Categorie(nom:"Genou",namedImage: "os_icon.png",showNom: true)
        let examCatGenou = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            Examen(intitule: "différence de circonférence", type:  .donnee ),
            Examen(intitule: "Choc rotulien", type:  .ouinon ),
            Examen(intitule: "lésion LCA au test de Lachman", type:  .ouinon ),
            Examen(intitule: "lésion LCA au test de Lemaire (subuluxation du tibia à 15° de flexxion + RI du pied)", type:  .ouinon ),
            Examen(intitule: "Tirroir antéro-postérieur", type:  .ouinon ),
            Examen(intitule: "Baillement/laxité latérale", type:  .ouinon ),
            Examen(intitule: "LLI douloureux à la palpation", type:  .ouinon ),
            Examen(intitule: "augmenté en valgus forcé", type:  .ouinon ),
            Examen(intitule: "LLE douloureux à la palpation", type:  .ouinon ),
            Examen(intitule: "augmenté en varus forcé", type:  .ouinon ),
            Examen(intitule: "Sensation de blocage", type:  .ouinon ),
            Examen(intitule: "Sensation d'instabilité", type:  .ouinon ),
            //Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre"),
            
            //Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            //Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
            //Examen(intitule: "libre", type:  .reponsecourte )
        ]
        catGenou.examens=examCatGenou
        return catGenou
    }
     static var Epaule:categorieExamen.Categorie {
        let catEpaule = categorieExamen.Categorie(nom:"Epaule",namedImage: "<#image#>",showNom: true)
        let examCatEpaule = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
            self.LocoFonctionnel.asExamen(),
            Examen(intitule: "Douleur acromio-clavulaire", type:  .ouinon ),
            Examen(intitule: "\"touche de piano\"", type:  .check ),
            Examen(intitule: "Instabilité acromio-clavulaire", type:  .ouinon ),
            Examen(intitule: "Douleur sterno-clavulaire", type:  .ouinon ),
            Examen(intitule: "Rotation externe passive (0-90°)", type:  .donnee ),
            Examen(intitule: "Rotation Interne (pouce)", type:  .donnee ),
            Examen(intitule: "douleur au Palm-Up test (long biceps)", type:  .ouinon ),
            Examen(intitule: "douleur au test de Jobe (sus épineux)", type:  .ouinon ),
            Examen(intitule: "douleur au test de Yocum (Coiffe)", type:  .ouinon ),
            Examen(intitule: "Evaluation Yocum passif \"C Test\" (N=130°)", type:  .donnee ),
            //self.libre,
            //Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catEpaule.examens=examCatEpaule
        return catEpaule
    }

    
    static var neuroFonctionnel:categorieExamen.Categorie {
        let catneuroFonctionnel = categorieExamen.Categorie(nom:"Fonctionnels",namedImage: "tete_icon.png",showNom: true)
        let examCatneuroFonctionnel = [
            Examen(intitule: "Communication normale", type:  .check ),
            Examen(intitule: "Pas de communication", type:  .check ),
            Examen(intitule: "Communication altérée", type:  .check ),
            Examen(intitule: "Compréhension difficile", type:  .check ),
            Examen(intitule: "Conscient", type:  .check ),
            Examen(intitule: "Orienté", type:  .check ),
            Examen(intitule: "Ralentissement psychomoteur", type:  .check ),
            Examen(intitule: "Glasgow", type:  .donnee , tag: "glasgow"),
            Examen(intitule: "D.T.S.", type:  .ouinon ),
            Examen(intitule: "Confusion", type:  .ouinon ),
            Examen(intitule: "Céphallée", type:  .ouinon ),
            Examen(intitule: "Troubles du langage", type:  .ouinon ),
            Examen(intitule: "Photophobie", type:  .ouinon ),
            Examen(intitule: "Troubles de la marche", type:  .ouinon ),
            
            Examen(intitule: "Troubles visuels", type:  .ouinon ),
            Examen(intitule: "Troubles Cognitifs", type:  .ouinon ),
            //self.libre,
           // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
            
        ]
        catneuroFonctionnel.examens=examCatneuroFonctionnel
        return catneuroFonctionnel
    }
    static var neuroReflexes:categorieExamen.Categorie {
        let catneuroReflexes = categorieExamen.Categorie(nom:"Reflexes",namedImage: "<#image#>",showNom: true)
        let examCatneuroReflexes = [
            Examen(intitule: "ROT symétriques", type:  .check ),
            Examen(intitule: "Hyporéflexie", type:  .check ),
            Examen(intitule: "Hyperréflexie", type:  .check ),
            Examen(intitule: "RCP en flexion", type:  .check ),
            Examen(intitule: "Babinski", type:  .donnee ),
            Examen(intitule: "Occulomotricité normale", type:  .check ),
            Examen(intitule: "RPM présents", type:  .check ),
            Examen(intitule: "Nystagmus", type:  .donnee ),
            Examen(intitule: "Dysmétrie (epreuve doigt-nez) ", type:  .ouinon ),
            Examen(intitule: "Ataxie statique (Romberg)", type:  .ouinon ),
           
           
            Examen(intitule: "Ataxie (marche yeux fermés)", type:  .ouinon ),
            Examen(intitule: "Déficit sensitivomoteur", type:  .ouinon ),
            //self.libre,
          //  Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catneuroReflexes.examens=examCatneuroReflexes
        return catneuroReflexes
    }
    static var EntretienPatient:categorieExamen.Categorie {
        let catEntretienPatient = categorieExamen.Categorie(nom:"Entretien",namedImage: "tete_icon.png",showNom: false)
        let examCatEntretienPatient = [
            Examen(intitule: "Entretien avec le patient", type: .check),
            Examen(intitule: "Entretien avec le patient et son entourage", type: .check),
            Examen(intitule: "Entretien avec l'entourage", type: .check),
            Examen(intitule: "Compte rendu des examens reçus", type: .check),
            Examen(intitule: "Discussion sur les hypothèses diagnostiques", type: .check),
            Examen(intitule: "Discussion sur le devenir", type: .check),
            Examen(intitule: "souhaite des examens complémentaires", type: .check),
            Examen(intitule: "souhaite un avis spécialisé", type: .check),
            Examen(intitule: "difficulté pour le maintien à domicile", type: .check),
            Examen(intitule: "ne souhaite pas d'investigations supplémentaires", type: .check),
            Examen(intitule: "souhaiterait une hospitalisation", type: .check),
            Examen(intitule: "agacé par l'attente", type: .check),
            Examen(intitule: "ne souhaite pas l'hospitalisation", type: .check),
            Examen(intitule: "ne souhaite pas quitter le service", type: .check),
            
            Examen(intitule: "souhaiterait si possible un retour à domicile", type: .check),
            Examen(intitule: "souhaite un retour à domicile", type: .check),
            Examen(intitule: "sortie contre avis médical", type: .check),
            
           // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
            
        ]
        catEntretienPatient.examens=examCatEntretienPatient
        return catEntretienPatient
    }
    
    static var AvisSpecialiste:categorieExamen.Categorie {
        let catAvisSpecialiste = categorieExamen.Categorie(nom:"Avis Specialiste",namedImage: "medecin_icon.png",showNom: true)
        let examCatAvisSpecialiste = [
            Examen(intitule: "demandé", type: .check),
            Examen(intitule: "Vu par", type: .check),
            Examen(intitule: "qui ?", type:  .selection,tag: "medecin" ),
            //self.libre,
            Examen(intitule: "Evenement", type: .reponsecourte, tag:"Evenement"),
            Examen(intitule: "Indisponible pour l'instant", type: .check),
            Examen(intitule: "passera voir le patient", type: .check),
            Examen(intitule: "demande un avis", type: .check),
            Examen(intitule: "de qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "demande investigation", type: .donnee),
            
            //self.libre,
           // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catAvisSpecialiste.examens=examCatAvisSpecialiste
        return catAvisSpecialiste
    }
   static var ActeTherapeuthique:categorieExamen.Categorie {
        let catActeTherapeuthique = categorieExamen.Categorie(nom:"Acte Thérapeutique",namedImage: "piqure_icon.png",showNom: false)
        let examCatActeTherapeuthique = [
            Examen(intitule: "Voie veineuse", type:  .check ),
            Examen(intitule: "Oxygénothérapie lunettes", type:  .donnee ),
            Examen(intitule: "Oxygénothérapie masque", type:  .donnee ),
            Examen(intitule: "Administration", type:  .check ,info: " "),
            Examen(intitule: "produit", type:  .selection,tag: "medicament" ),
            //Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            //Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
            //self.libre,
          //  Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catActeTherapeuthique.examens=examCatActeTherapeuthique
        return catActeTherapeuthique
    }
   static var DemandeExamen:categorieExamen.Categorie {
        let catDemandeExamen = categorieExamen.Categorie(nom:"demande d'examens",namedImage: "dossier.png",showNom: true)
        let examCatDemandeExamen = [
            Examen(intitule: "Electrocardiogramme", type:  .check ),
            Examen(intitule: "Biologie", type:  .check ),
            Examen(intitule: "Radiographie", type:  .check ),
            Examen(intitule: "Scanner Cerebral", type:  .check ),
             Examen(intitule: "Scanner Thoraco abdominal", type:  .check ),
            Examen(intitule: "Scanner Thoracique", type:  .check ),
            Examen(intitule: "Scanner Abdominal", type:  .check ),
            Examen(intitule: "Echographie", type:  .check ),
            // Examen(intitule: "Xie", type:  .check ,info: " "),
            //Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            //Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
            //self.libre,
           // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catDemandeExamen.examens=examCatDemandeExamen
        return catDemandeExamen
    }
  static var Documents:categorieExamen.Categorie {
        let catDocuments = categorieExamen.Categorie(nom:"Documents",namedImage: "dossier.png",showNom: true)
        let examCatDocuments = [
  //          Examen(intitule: "horodatage", type: .reponsecourte,tag: "date"),

            self.Document.asExamen(),
            // Examen(intitule: "Xie", type:  .check ,info: " "),
            //Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            //Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
//            Examen(intitule: "libre", type:  .reponsecourte,libre ),
            Examen(intitule: "Ajout document",type: .addinfo,tag: "document")
        ]
        catDocuments.examens=examCatDocuments
        return catDocuments
    }
static var typeDocument:Examen {
        Donnees.selectiontextDict["dataStrtypecourrier"]=[
            "Courrier de demande de prise en charge",
            "Courrier de sortie d'hospitalisation",
            
            "Courrier CR de consultation",
            "Résultat biologique",
            "Electrocardiogramme",
            "Résultat Imagerie",
            "Résultat Scanner",
            "Résultat Echographie",
            "Ordonnance Médecin traitant",
            "Ordonnance Spécialiste",
            "Photographie lésion",
            "Compte rendu Imagerie",
        ]
        return Examen(intitule: "Type", type: .datastr, tag: "dataStrtypecourrier")
        // return catOMS
    }
  
 static var Document:categorieExamen.Categorie {
        let catDocumentConsulte = categorieExamen.Categorie(nom:"Document ",namedImage: "dossier.png",showNom: false)
        let examCatDocumentConsulte = [
            // Examen(intitule: "Xie", type:  .check ,info: " "),
            //Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            //Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
            Examen(intitule: "Date", type:  .reponsecourte, tag: "date" ),
            self.typeDocument,
           // Examen(intitule: "Courrier", type: .check),
            //Examen(intitule: "Compte rendu d'examen", type: .donnee),
           
            Examen(intitule: "de qui ?", type:  .selection,tag: "medecin" ),
            
            Examen(intitule: "Avancée diagnostique", type: .check),
            Examen(intitule: "Etat Stable", type: .check),
            Examen(intitule: "Amélioration", type: .check),

            Examen(intitule: "Aggravation", type: .check),

            Examen(intitule: "Introduction médicamenteuse", type: .check),
            Examen(intitule: "Modification du traitement", type: .ouinon),
            Examen(intitule: "resume", type:  .reponsecourte,tag: "libre" ),
            Examen(intitule: "(image)", type:  .imagefilename ),
            Examen(intitule: "Ajout page",type: .addinfo,tag: "page")
            //Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catDocumentConsulte.examens=examCatDocumentConsulte
        return catDocumentConsulte
    }

    static var evenement:categorieExamen.Categorie {
        let catevenement = categorieExamen.Categorie(nom:"Evenement",namedImage: "stetho_icon.png",showNom: false)
        let examCatevenement = [
            Examen(intitule: "horodatage", type: .reponsecourte,tag: "date"),
            EvolutionClinique.asExamen(),
            EntretienPatient.asExamen(),
            AvisSpecialiste.asExamen(),
            ActeTherapeuthique.asExamen(),
            DemandeExamen.asExamen(),
            //Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre"),
            ]
        catevenement.examens=examCatevenement
        return catevenement
    }
    static var DigestifFonctionnel:categorieExamen.Categorie {
        let catDigestifFonctionnel = categorieExamen.Categorie(nom:"Fonctionnel",namedImage: "tete_icon.png",showNom: true)
        let examCatDigestifFonctionnel = [
            Examen(intitule: "Trouble de l'apétit", type:  .ouinon ),
            Examen(intitule: "Nausée/Vomissements", type:  .ouinon ),
            Examen(intitule: "Ballonement", type:  .ouinon ),
            Examen(intitule: "Diarrhée", type:  .ouinon ),
            Examen(intitule: "Constipation", type:  .ouinon ),
            Examen(intitule: "Alternance diarrhée / constipation", type:  .check ),
            Examen(intitule: "dernier repas", type:  .donnee,tag: "date" ),
            Examen(intitule: "dernières selles", type:  .donnee,tag: "date" ),
            Examen(intitule: "\"normale\"", type:  .check ),
            Examen(intitule: "Selles moulées", type:  .check ),
            Examen(intitule: "Selles dures", type:  .check ),
            Examen(intitule: "Selles liquides", type:  .check ),
            Examen(intitule: "Selles molles", type:  .check ),
            Examen(intitule: "Selles glaireuses", type:  .check ),
            Examen(intitule: "Méléna", type:  .ouinon ),
            Examen(intitule: "Rectorragie", type:  .ouinon ),
            Examen(intitule: "décoloration des selles", type:  .ouinon ),
            Examen(intitule: "Constipation", type:  .ouinon ),
            Examen(intitule: "Odeur inhabituelle", type:  .ouinon ),
            
            
            ]
        catDigestifFonctionnel.examens=examCatDigestifFonctionnel
        return catDigestifFonctionnel
    }
    static var DigestifDouleur:categorieExamen.Categorie {
        let catDigestifDouleur = categorieExamen.Categorie(nom:"douleur abdominale",namedImage: "digestif_icon.png",showNom: false)
        let examCatDigestifDouleur = [
            Examen(intitule: "Abdomen globalement sensible", type:  .check ),
            Examen(intitule: "Douleur abdominale", type:  .ouinon ),
            Examen(intitule: "épigastrique", type:  .check ),
            Examen(intitule: "Irradiation dans le dos", type:  .ouinon ),
            Examen(intitule: "hypochondre droit", type:  .check ),
            Examen(intitule: "flanc droit", type:  .check ),
            Examen(intitule: "FI droite", type:  .check ),
            Examen(intitule: "hypochondre gauche", type:  .check ),
            Examen(intitule: "flanc gauche", type:  .check ),
            Examen(intitule: "FI gauche", type:  .check ),
            Examen(intitule: "périombilicale", type:  .check ),
            Examen(intitule: "hypogastrique", type:  .check ),
            Examen(intitule: "signe de Murphy", type:  .ouinon ),
            
            ]
        catDigestifDouleur.examens=examCatDigestifDouleur
        return catDigestifDouleur
    }
    
    static var EvolutionClinique:categorieExamen.Categorie {
        let catEvolutionClinique = categorieExamen.Categorie(nom:"Evolution Clinique",namedImage: "examenclinique.png",showNom: false)
        let examCatEvolutionClinique = [
            Examen(intitule: "Diagnostic incertain", type: .check),
            Examen(intitule: "nécessité d'une surveillance hémodynamique", type: .check),
            Examen(intitule: "nécessité d'une surveillance de l'évolution", type: .check),
            Examen(intitule: "Hyperalgie", type: .check),
            Examen(intitule: "Antalgie acquise", type: .check),
            Examen(intitule: "Antalgie insuffisante", type: .check),
            Examen(intitule: "Amélioration franche", type: .ouinon),
             Examen(intitule: "Amélioration partielle", type: .check),
            Examen(intitule: "Etat clinique stable", type: .ouinon),
            Examen(intitule: "Détériotation", type: .ouinon),
            Examen(categorie: ExamTree.Plainte),
            Examen(intitule: "Ajout plainte",type: .addinfo,tag: "Plainte"),
           // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre"),
            ]
        catEvolutionClinique.examens=examCatEvolutionClinique
        return catEvolutionClinique
    }
    
    static var SuiviEvolution:categorieExamen.Categorie {
        let catSuiviEvolution = categorieExamen.Categorie(nom:"Suivi/Evènements",namedImage: "stetho_icon.png",showNom: true)
        let examCatSuiviEvolution = [
            evenement.asExamen(),
            
            Examen(intitule: "Ajout clinique",type: .addinfo,tag: "clinique"),
            Examen(intitule: "Ajout pancarte",type: .addinfo,tag: "pancarte"),
            Examen(intitule: "Ajout évènement",type: .addinfo,tag: "evenementSuivi"),
            ]
        catSuiviEvolution.examens=examCatSuiviEvolution
        return catSuiviEvolution
    }
// static var Document:categorieExamen.Categorie {
//        let catDocument = categorieExamen.Categorie(nom:"Document",namedImage: "dossier_icon.png",showNom: false)
//        let examCatDocument = [
//            Examen(intitule: "Date document", type:  .donnee ,tag: "date"),
//            Examen(intitule: "Titre", type:  .reponsecourte,tag: "libre" ),
//            Examen(intitule: "Description", type: .reponsecourte,tag: "libre"),
//            Examen(intitule: "(image)", type: .imagefilename),
//            Examen(intitule: "Ajout page",type: .addinfo,tag: "page"),
//        ]
//        catDocument.examens=examCatDocument
//        return catDocument
//    }

    static var Radiographie:categorieExamen.Categorie {
        let catRadiographie = categorieExamen.Categorie(nom:"Radiographies",namedImage: "imagerie_icon.png",showNom: true)
        let examCatRadiographie = [
            Examen(intitule: "Crane", type:  .check ),
            Examen(intitule: "Thoracique", type:  .check ),
            Examen(intitule: "Gril costal gauche", type:  .check ),
            Examen(intitule: "Gril costal droit", type:  .check ),
            Examen(intitule: "Cervicales", type:  .check ),
            Examen(intitule: "Dorsales", type:  .check ),
            Examen(intitule: "Lombaires", type:  .check ),
            Examen(intitule: "Bassin", type:  .check ),
            Examen(intitule: "Hanche gauche", type:  .check ),
            Examen(intitule: "Hanche droite", type:  .check ),
            Examen(intitule: "Femur gauche", type:  .check ),
            Examen(intitule: "Fémur droit", type:  .check ),
            
            Examen(intitule: "Genou gauche", type:  .check ),
            Examen(intitule: "Genou droit", type:  .check ),
            Examen(intitule: "Jambe gauche", type:  .check ),
            Examen(intitule: "Jambe droite", type:  .check ),
            Examen(intitule: "Epaule gauche", type:  .check ),
            Examen(intitule: "Epaule droit", type:  .check ),
            Examen(intitule: "Bras gauche", type:  .check ),
            Examen(intitule: "Bras droit", type:  .check ),
            Examen(intitule: "Coude gauche", type:  .check ),
            Examen(intitule: "Coude droit", type:  .check ),
            Examen(intitule: "Avant-bras gauche", type:  .check ),
            Examen(intitule: "Avant-bras droit", type:  .check ),
            Examen(intitule: "Poignet gauche", type:  .check ),
            Examen(intitule: "Poignet droit", type:  .check ),
            Examen(intitule: "Main gauche", type:  .check ),
            Examen(intitule: "Main droite", type:  .check ),
            Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catRadiographie.examens=examCatRadiographie
        return catRadiographie
    }
    static var ExamenGeneral:categorieExamen.Categorie {
        let catExamenGeneral = categorieExamen.Categorie(nom:"Examen général",namedImage: "examenclinique.png",showNom: true)
        let examCatExamenGeneral = [
            self.Poids.asExamen(),
            self.OMS,
            self.Karnofsky,
            self.Adenopathies.asExamen(),
            Examen(intitule: "Dernier repas", type:  .reponsecourte, tag: "date" ),
            //self.libre,
            // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catExamenGeneral.examens=examCatExamenGeneral
        return catExamenGeneral
    }
    
    static var ExamenClinique:categorieExamen.Categorie {
        let catExamenClinique = categorieExamen.Categorie(nom:"Examen Clinique",namedImage: "examenclinique.png",showNom: true)
        let examCatExamenClinique = [
            Examen(intitule: "horodatage", type:  .reponsecourte,tag: "date" ),
            self.ExamenGeneral.asExamen(),
            self.Neurologie.asExamen(),
            self.Cardiovasculaire.asExamen(),
            self.Respiratoire.asExamen(),
            self.Digestif.asExamen(),
            self.Urologie.asExamen(),
            //  self.Urologie.asExamen(),
            self.ORL.asExamen(),
            self.Locomoteur.asExamen(),
            //self.libre,
        ]
        catExamenClinique.examens=examCatExamenClinique
        return catExamenClinique
    }
    static var Conclusion:categorieExamen.Categorie {
        let catConclusion = categorieExamen.Categorie(nom:"Conclusion",namedImage: "medecin_icon.png",showNom: true)
        let examCatConclusion = [
            Examen(intitule: "Suspicion ", type: .check),
            Examen(intitule: "Diagnostic", type: .selection,tag: "atcd"),
            ExamTree.LocAnat.asExamen(),
            //self.libre,
            Examen(intitule: "hospitalisation", type: .check),
            Examen(intitule: "pris en charge par", type: .check),
            Examen(intitule: "médecin", type: .selection, tag: "medecin"),
            Examen(intitule: "Retour à domicile", type: .check),
            Examen(intitule: "Surveillance par le médecin traitant", type: .check),
            Examen(intitule: "Consultation spécialisé prévu", type: .check),
            Examen(intitule: "Consultation spécialisé à prévoir", type: .check),
            Examen(intitule: "date", type: .reponsecourte,tag: "date"),
            Examen(intitule: "médecin", type: .selection, tag: "medecin"),
            Examen(intitule: "sous", type: .reponsecourte),
            Examen(intitule: "Nouvelle consultation nécessaire si évolution péjorative", type: .check),
            Examen(intitule: "Prendre nouvel avis médical si aggravation ou évolution insatisfaisante", type: .check),
            Examen(intitule: "Prendre nouvel avis médical si récidive", type: .check),
            //self.libre,
            Examen(intitule: "Autre", type: .reponsecourte,tag: "conclusionautre"),
            // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catConclusion.examens=examCatConclusion
        return catConclusion
    }
    static var Imagerie:categorieExamen.Categorie {
        let catImagerie = categorieExamen.Categorie(nom:"Imagerie",namedImage: "imagerie_icon.png",showNom: true)
        let examCatImagerie = [
            ExamTree.Radiographie.asExamen(),
            Examen(intitule: "Echographie abdominale", type: .check),
             Examen(intitule: "Echographie", type: .check),
            Examen(intitule: "Echographie doppler", type: .check),
            Examen(intitule: "Scanner", type: .check),
            Examen(intitule: "IRM", type: .check),
            Examen(intitule: "E.E.G.", type: .check),
            Examen(intitule: "EMG", type: .check),
            Examen(intitule: "(précision)", type: .reponsecourte,tag: "libre"),
            Examen(intitule: "en cours", type: .check),
            
            Examen(intitule: "(Interprétation radiologue)", type: .check),
            Examen(intitule: "conclusion:", type: .selection,tag: "ConclusionRx"),
            
            Examen(intitule: "sous reserve de confirmation par le radiologue", type: .check),
            self.Document.asExamen(),
            //self.libre,
            
            ]
        catImagerie.examens=examCatImagerie
        return catImagerie
    }
    static var Gazometrie:categorieExamen.Categorie {
        let catGazometrie = categorieExamen.Categorie(nom:"Gazometrie",namedImage: "piqure_icon.png",showNom: true)
        let examCatGazometrie = [
            self.Document.asExamen(),
            Examen(intitule: "Air ambiant", type:  .check ),
            Examen(intitule: "Sous O2", type:  .check ),
            
            Examen(intitule: "Normale", type:  .check ),
            Examen(intitule: "Alcalose", type:  .check ),
            Examen(intitule: "Acidose", type:  .check ),
            Examen(intitule: "Hypoxie", type:  .check ),
            Examen(intitule: "Hypocapnie", type:  .check ),
            Examen(intitule: "Hypercapnie", type:  .check ),
            Examen(intitule: "pH (7,35 - 7,45)", type:  .donnee ),
            Examen(intitule: "PaO2 (90-100)", type:  .donnee ),
            Examen(intitule: "PaCO2 (35-45)", type:  .donnee ),
            Examen(intitule: "SaO2%", type:  .donnee ),
            Examen(intitule: "CO2 total (20-35)", type:  .donnee ),
            Examen(intitule: "bicarbonates (22-26)", type:  .donnee ),
            
            ]
        catGazometrie.examens=examCatGazometrie
        return catGazometrie
    }
    
    static var Neurologie:categorieExamen.Categorie {
        let catNeurologie = categorieExamen.Categorie(nom:"Examen neurologique",namedImage: "neuro_icon.png",showNom: true)
        let examCatNeurologie = [
            Examen(intitule: "Examen Normal", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            ExamTree.neuroFonctionnel.asExamen(),
            ExamTree.neuroReflexes.asExamen(),
            Examen(intitule: "Pas de signe de localisation", type:  .check ),
            //self.libre,        
        ]
        catNeurologie.examens=examCatNeurologie
        return catNeurologie
    }
    static var PlainteAnamnèse:categorieExamen.Categorie {
        let catPlainteAnamnèse = categorieExamen.Categorie(nom:"Plaintes/Anamnèse",namedImage: "tete_icon.png",showNom: true)
        let examCatPlainteAnamnèse = [
            
            //self.libre,
            Examen(categorie: ExamTree.Plainte),
            Examen(intitule: "Ajout plainte",type: .addinfo,tag: "Plainte")
        ]
        catPlainteAnamnèse.examens=examCatPlainteAnamnèse
        return catPlainteAnamnèse
    }
    static var Cardiovasculaire:categorieExamen.Categorie {
        let catCardiovasculaire = categorieExamen.Categorie(nom:"Appareil cardiovasculaire",namedImage: "cardio2_icon.png",showNom: true)
        let examCatCardiovasculaire = [
            Examen(intitule: "Examen Normal", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            ExamTree.CardioFonctionnel.asExamen(),
            ExamTree.CardioAuscultation.asExamen(),
            Examen(intitule: "Pouls fémoraux présents", type:  .check ),
            Examen(intitule: "Pouls pédieux présents", type:  .check ),
            Examen(intitule: "Pouls tibial postérieur présent", type:  .check ),
            Examen(intitule: "Turgescence jugulaire", type:  .ouinon ),
            Examen(intitule: "Oedème des Mb inférieurs", type:  .ouinon ),
            Examen(intitule: "Hyperpigmentation en chaussettes (dermite ocre)", type:  .check ),
            Examen(intitule: "Mollets souples et indolore", type:  .check ),
            //self.libre,        
        ]
        catCardiovasculaire.examens=examCatCardiovasculaire
        return catCardiovasculaire
    }
    
    static var RespiratoireFonctionnel:categorieExamen.Categorie {
        let catRespiratoireFonctionnel = categorieExamen.Categorie(nom:"Fonctionnel",namedImage: "pneumo_icon.png",showNom: true)
        let examCatRespiratoireFonctionnel = [
            Examen(intitule: "Dyspnée", type:  .ouinon ),
            Examen(intitule: "Toux", type:  .ouinon ),
            Examen(intitule: "Expectorations", type:  .ouinon ),
            Examen(intitule: "Difficultés à l'élocution", type:  .ouinon ),
            //self.libre,
        ]
        catRespiratoireFonctionnel.examens=examCatRespiratoireFonctionnel
        return catRespiratoireFonctionnel
    }
    static var RespiratoireAuscultation:categorieExamen.Categorie {
        let catRespiratoireAuscultation = categorieExamen.Categorie(nom:"Auscultation",namedImage: "stetho_icon.png",showNom: true)
        let examCatRespiratoireAuscultation = [
            Examen(intitule: "MV + symétrique", type:  .check ),
            Examen(intitule: "Sibilants", type:  .ouinon ),
            Examen(intitule: "Crépitants", type:  .ouinon ),
            Examen(intitule: "Ronchis", type:  .ouinon ),
            Examen(intitule: "Stridor", type:  .ouinon ),
            Examen(intitule: "Wheezing", type:  .ouinon ),
            Examen(intitule: "Frottement pleural", type:  .ouinon ),
            Examen(intitule: "Foyer auscultatoire", type:  .ouinon ),
            //self.libre,
        ]
        catRespiratoireAuscultation.examens=examCatRespiratoireAuscultation
        return catRespiratoireAuscultation
    }
    
    
    static var Respiratoire:categorieExamen.Categorie {
        let catRespiratoire = categorieExamen.Categorie(nom:"Appareil respiratoire",namedImage: "pneumo_icon.png",showNom: true)
        let examCatRespiratoire = [
            Examen(intitule: "Examen Normal", type:  .check ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Oxygenothérapie à domicile", type:  .check ),
            self.RespiratoireFonctionnel.asExamen(),
            self.RespiratoireAuscultation.asExamen(),
            Examen(intitule: "Hippocratisme digital", type:  .ouinon ),
            Examen(intitule: "Cyanose labiale", type:  .ouinon ),
            Examen(intitule: "Tirage", type:  .ouinon ),
            Examen(intitule: "Respiration de Cheyne-Stokes (RCS)", type:  .check ),
            
            Examen(intitule: "Ronchopathie signalée", type:  .ouinon ),
            Examen(intitule: "SaO2%", type:  .donnee ),
            //self.libre,
        ]
        catRespiratoire.examens=examCatRespiratoire
        return catRespiratoire
    }
    static var Digestif:categorieExamen.Categorie {
        let catDigestif = categorieExamen.Categorie(nom:"Appareil Digestif",namedImage: "digestif_icon.png",showNom: true)
        let examCatDigestif = [
            Examen(intitule: "Examen Normal", type:  .ouinon ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            ExamTree.DigestifFonctionnel.asExamen(),
            ExamTree.DigestifDouleur.asExamen(),
            
            Examen(intitule: "Abdomen souple et depressible", type:  .check ),
            Examen(intitule: "Bruits hydroaériques", type:  .ouinon ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Pas de défense", type:  .check ),
            
            
            
            Examen(intitule: "Ictère", type:  .ouinon ),
            Examen(intitule: "Orifices herniaires libres", type:  .ouinon ),
            //self.libre,
            Examen(intitule: "Astérixis/Flapping Tremor", type:  .ouinon ),
            Examen(intitule: "Circulation collatérale péri-ombilicale", type:  .ouinon ),
            
            //self.libre,
        ]
        catDigestif.examens=examCatDigestif
        return catDigestif
    }
    static var Adenopathies:categorieExamen.Categorie {
        let catAdenopathies = categorieExamen.Categorie(nom:"(adénopathies)",namedImage: "examenclinique.png",showNom: false)
        let examCatAdenopathies = [
            Examen(intitule: "Pas d'adénopathies cervicales ou axillaires", type: .check),
            Examen(intitule: "Adénopathie inguinale", type: .ouinon),
            Examen(intitule: "Adénopathie axillaire", type: .ouinon),
            Examen(intitule: "Adénopathie cervicale", type: .ouinon),
            Examen(intitule: "Adénopathie sus-claviculaire", type: .ouinon),
            LocAnat.asExamen(),
            
            // Examen(intitule: "Xie", type:  .check ,info: " "),
            //Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            //Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
            //self.libre,            Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catAdenopathies.examens=examCatAdenopathies
        return catAdenopathies
    }
    static var Urologie:categorieExamen.Categorie {
        let catUrologie = categorieExamen.Categorie(nom:"Appareil Urologique",namedImage: "rein_icon.png",showNom: true)
        let examCatUrologie = [
            
            Examen(intitule: "Examen Normal", type:  .ouinon ),
            
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "BU Normale", type:  .check ),
            Examen(intitule: "BU Positive", type:  .donnee ),
            Examen(intitule: "Troubles fonctionnels urinaires", type:  .ouinon ),
            Examen(intitule: "Pollakiurie", type:  .ouinon ),
            Examen(intitule: "Ecoulement urethral", type:  .ouinon ),
            Examen(intitule: "Brulure mictionnelle", type:  .ouinon ),
            Examen(intitule: "Urines foncées", type:  .check ),
            Examen(intitule: "Dyspareunie", type:  .ouinon ),
            Examen(intitule: "Hématurie", type:  .ouinon ),
            Examen(intitule: "Pyurie", type:  .ouinon ),
            Examen(intitule: "Odeur forte des urines", type:  .check ),
            Examen(intitule: "Douleur lombaire", type:  .ouinon ),
            Examen(intitule: "Douleur fosse lombaire gauche", type:  .check ),
            Examen(intitule: "Douleur fosse lombaire droite", type:  .check ),
            Examen(intitule: "à la pression hypogastrique/vésicale", type:  .check ),
            Examen(intitule: "Douleur flanc gauche", type:  .check ),
            Examen(intitule: "Douleur flanc droit", type:  .check ),
            Examen(intitule: "Douleur testiculaire", type:  .ouinon ),
            Examen(intitule: "Testicules normaux", type:  .check ),
            Examen(intitule: "Induration testiculaire", type:  .ouinon ),
            Examen(intitule: "Hydrocèle", type:  .ouinon ),
            //self.libre,
            
        ]
        catUrologie.examens=examCatUrologie
        return catUrologie
    }
    
    static var Locomoteur:categorieExamen.Categorie {
        let catLocomoteur = categorieExamen.Categorie(nom:"Locomoteur",namedImage: "os_icon.png",showNom: true)
        let examCatLocomoteur = [
            self.Document.asExamen(),
            ExamTree.Plaie.asExamen(),
            self.Face.asExamen(),
            self.RachisCervical.asExamen(),
            
            ExamTree.Epaule.asExamen(),
            self.Bras.asExamen(),
            ExamTree.Coude.asExamen(),
            self.AvantBras.asExamen(),
            ExamTree.Main.asExamen(),
            ExamTree.Doigt.asExamen(),
            self.RachisLombaire.asExamen(),
            self.Hanche.asExamen(),
            ExamTree.Genou.asExamen(),
            self.Jambe.asExamen(),
            
            ExamTree.Cheville.asExamen(),
            //self.libre,
             Examen(intitule: "Dupliquer précedent",type: .addinfo,tag: "dupliquer")
            
        ]
        catLocomoteur.examens=examCatLocomoteur
        return catLocomoteur
    }
    
    
    static var ORL:categorieExamen.Categorie {
        let catORL = categorieExamen.Categorie(nom:"O.R.L.",namedImage: "nez_icon.png",showNom: true)
        let examCatORL = [
            Examen(intitule: "Examen Normal", type:  .ouinon ),
            
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(intitule: "Dysphagie", type:  .ouinon ),
            Examen(intitule: "Amygdales normales", type:  .ouinon ),
            Examen(intitule: "Rhinorrhée", type:  .ouinon ),
            Examen(intitule: "Anosmie", type:  .ouinon ),
            Examen(intitule: "Hypoaccousie", type:  .ouinon ),
            Examen(intitule: "Acouphènes", type:  .ouinon ),
            Examen(intitule: "Vertige", type:  .ouinon ),
            Examen(intitule: "Amygdalite", type:  .ouinon ),
            Examen(intitule: "Erythème pharyngé", type:  .ouinon ),
            Examen(intitule: "Adénopathie cervicale", type:  .ouinon ),
            Examen(intitule: "Adénopathie sous-maxillaire", type:  .ouinon ),
            Examen(intitule: "Epistaxis", type:  .donnee ),
            Examen(intitule: "Pas d'otalgie", type:  .ouinon ),
            Examen(intitule: "Otalgie droite", type:  .check ),
            Examen(intitule: "Otalgie gauche", type:  .check ),
            Examen(intitule: "Otorrhée gauche", type:  .check ),
            Examen(intitule: "Otorrhée droite", type:  .check ),
            Examen(intitule: "Otorragie gauche", type:  .check ),
            Examen(intitule: "Otorragie droite", type:  .check ),
           // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catORL.examens=examCatORL
        return catORL
    }
    
    static var Biologie:categorieExamen.Categorie {
        let catBiologie = categorieExamen.Categorie(nom:"Biologie",namedImage: "piqure_icon.png",showNom: true)
        let examCatBiologie = [
            Examen(intitule: "Bilan normal", type: .check),
            Examen(intitule: "Hémogramme normal", type: .check),
            Examen(intitule: "Hémoglobine", type: .donnee),
            Examen(intitule: "Leucocytes", type: .donnee),
            Examen(intitule: "Plaquettes", type: .donnee),
            Examen(intitule: "Insuffisance rénale", type: .ouinon),
            Examen(intitule: "Créatinémie", type: .donnee),
            Examen(intitule: "Clairance", type: .donnee),
            Examen(intitule: "Sodium (Na)", type: .donnee),
            Examen(intitule: "Potassium (K)", type: .donnee),
            Examen(intitule: "Syndrome inflammatoire", type: .ouinon),
            Examen(intitule: "Proteine C Réactive (CRP)", type: .donnee),
            Examen(intitule: "Fibrinogène", type: .donnee),
            Examen(intitule: "Procalcitonine", type: .donnee),
            Examen(intitule: "Bilan hépatique normal", type: .check),
            Examen(intitule: "Cytolyse", type: .ouinon),
            Examen(intitule: "ASAT (TGO)", type: .donnee),
            Examen(intitule: "ALAT (TGP)", type: .donnee),
            
            Examen(intitule: "Cholestase", type: .ouinon),
            Examen(intitule: "Bilirubine", type: .donnee),
            Examen(intitule: "Phosphatases Alcalines", type: .donnee),
            Examen(intitule: "ɣGT", type: .donnee),
            
            Examen(intitule: "Enzymes cardiaques normales", type: .check),
            Examen(intitule: "Troponine", type: .donnee),
            Examen(intitule: "Pro-BNP", type: .donnee),
            Examen(intitule: "BNP", type: .donnee),
            Examen(intitule: "D-Dimères", type: .donnee),
            Examen(intitule: "Myoglobine", type: .donnee),
            
            Examen(intitule: "Euthyroïdie", type: .check),
            Examen(intitule: "TSH", type: .donnee),
            Examen(intitule: "T4L", type: .donnee),
            Examen(intitule: "T3", type: .donnee),
            
            
           // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catBiologie.examens=examCatBiologie
        return catBiologie
    }
 // MARK: Examens
     static var OMS:Examen {
        Donnees.selectiontextDict["dataStrZubrodOMS"]=[
            "Zubrod/OMS 0: capable d'une activité identique à celle précédant la maladie",
            "Zubrod/OMS 1: activité physique diminuée, mais ambulatoire et capable de mener un travail",
            "Zubrod/OMS 2: ambulatoire et capable de prendre soin de soi-même. Incapable de travailler et alité moins de 50% du temps",
            "Zubrod/OMS 3: Capable seulement de quelques activités ou en chaise plus de 50% du temps",
            "Zubrod/OMS 4: Incapable de prendre soin de soi-même. Alité ou en chaise en permanence",
            ]
        return Examen(intitule: "Echelle Zubrod/OMS", type: .datastr, tag: "dataStrZubrodOMS",info: "<br>")
               // return catOMS
    }
    
    

    static var temperatureMultirow:Examen {
        
        if  Donnees.multiColumnPickerDataStr["temperatureMultirow"] == nil {
            
            let  degre = ["34","35","36","37","38","39","40","41","42","43"]
            let dixieme = [",0°C",",1°C",",2°C",",3°C",",4°C",",5°C",",6°C",",7°C",",8°C",",9°C"]
            Donnees.multiColumnPickerDataStr["temperatureMultirow"] = [degre,dixieme]
            
        }

        return Examen(intitule: "Temp.", type: .multirowdatastr , tag: "temperatureMultirow")
        // return catOMS
    }
    private static func setTensionMultiRow() {
        if  Donnees.multiColumnPickerDataStr["tensionMultirow"] == nil {
            var degre=[String]()
            for x in 5..<30 {
                degre.append(String(x))
            }
            var dixieme = [String]()
            for x in 0..<10 {
                dixieme.append(String(x))
            }
            
            //let  degre = ["34","35","36","37","38","39","40","41","42","43"]
            //let dixieme = [",0°C",",1°C",",2°C",",3°C",",4°C",",5°C",",6°C",",7°C",",8°C",",9°C"]
            Donnees.multiColumnPickerDataStr["tensionMultirow"] = [degre,dixieme,["/"],degre,dixieme]
            
        }
 
    }
    static var tensionMultirow:Examen {
        
        setTensionMultiRow()
        return Examen(intitule: "Tension ", type: .multirowdatastr , tag: "tensionMultirow")
        // return catOMS
    }

    

   static var Karnofsky:Examen {
        //let catKarnofsky = categorieExamen.Categorie(nom:"Échelle de Karnofsky",namedImage: "pancarte_icon.png",showNom: true)
    
        Donnees.selectiontextDict["dataStrKarnofksy"]=[
             "Indice 100 : Normal ; aucune plainte, aucun signe de maladie.",
            "Indice 90 : En mesure de poursuivre une activité normale ; signes ou symptômes mineurs de maladie.",
             "Indice 80 : Activité normale, avec un effort ; quelques signes ou symptômes de maladie.",
             "Indice 70 : Autonome ; incapable de poursuivre une activité normale ou de travailler de façon active.",
            "Indice 60 : Nécessité occasionnelle d'assistance mais capacité de pourvoir à ses besoins essentiels.",
            "Indice 50 : Nécessité d'aide considérable à la personne, soins médicaux fréquents.",
             "Indice 40 : Invalide ; nécessité de soins et d'assistance spécifiques.",
            "Indice 30 : Complètement invalide ; indication d'hospitalisation, pas de risque imminent de décès.",
             "Indice 20 : Très malade ; hospitalisation nécessaire, traitement actif ou de support nécessaire.",
             "Indice 10 : Moribond ; issue fatale proche.",
             "Indice 0 : Décédé."

        ]

        return Examen(intitule: "Echelle Karnofsky", type: .datastr, tag: "dataStrKarnofksy",info: "<br>")
    }


    
    
}