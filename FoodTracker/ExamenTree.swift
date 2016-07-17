//
//  ExamenTree.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 24/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

struct ExamTree {
    
    static func Check(intitule: String) -> Examen {
        return Examen(intitule: intitule, type:  .check )
    }
    static func Check(intitule: String,poststring: String) -> Examen {
        let ex = Examen(intitule: intitule, type:  .check )
        ex.formatPostString=poststring
        return ex
    }
    static func OuiNon(intitule: String) -> Examen {
        return Examen(intitule: intitule, type:  .ouinon )
    }
    static var libre:Examen{
        return  Examen(intitule: "Libre", type:  .reponsecourte ,tag: "libre")
    }
    static var ConnuClinique:categorieExamen.Categorie {
        let catConnuClinique = categorieExamen.Categorie(nom:"Connu Clinique",namedImage: "medecin_icon.png",showNom: false)
        let examCatConnuClinique = [
            
            Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"),
            
            Check("Suivi oncologique"),
            Check("Suivi cardiologique" ),
            Check("Suivi pneumologique" ),
            Check("Suivi neurologique" ),
            Check("Suivi urologique"),
            Check("Intervention orthopédique" ),
            Check("Déja vu en consultation" ),
            Examen(intitule: "dernier contact", type:  .donnee ,tag: "date"),
            
            ]
        catConnuClinique.examens=examCatConnuClinique
        return catConnuClinique
    }
    
    
    // MARK: administratif
    static var administratif: categorieExamen.Categorie {
        let Categorie1 = categorieExamen.Categorie(nom: "Administratif",namedImage: "administratif_icon.png")
        
        let catModeVie = categorieExamen.Categorie(nom: "Mode de vie", namedImage: "femme.png")

        let excamCatModeVie = [
            Check("à son domicile" ),
            Check( "en institution" ),
            Check("en maison de retraite" ),
            Check("en maison médicalisée" ),
            Check("avec sa famille" ),
            Check("seul" ),
            Check("en couple" ),
            Check("Veuf(ve)" ),
            Check("Pas d'enfants" ),
            Examen(intitule: "enfants:", type:  .donnee ),

        ]
        catModeVie.examens=excamCatModeVie
        let catModeEntree = categorieExamen.Categorie(nom: "Mode d'entrée",namedImage: "ambulance_icon.png")
        //catModeEntree.startLI()
        let excamCatModeEntree = [
            Check("adressé par le centre 15"),
            Check("adressé par"),
            Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"),
            Check("(courrier)"),
            Check("(appel téléphonique)"),
            Check("se présente spontanément"),
            Check("n'a pas vu de médecin avant sa venue aux urgences"),
            Check("a contacté son médecin avant sa venue aux urgences"),
            Check("médicalisé par le SMUR"),
            Examen(intitule: "Médecin SMUR", type:  .selection ,tag: "medecin"),
            Check("Transporté par les Pompiers"),
            Check("Transporté par ambulance"),
            Check("non médicalisé"),
            Check("Amené par la Famille"),
            Accompagnant(),
            ]
        catModeEntree.examens=excamCatModeEntree
        
        
        let catConnu = categorieExamen.Categorie(nom: "Connu de la clinique:",namedImage: "medecin_icon.png")
        // catConnu.startLI()
        let examCatConnu   : [Examen] = [
            Check("Pas de suivi dans l'établissement"),
            Check("Non"),
            self.ConnuClinique.asExamen(),
            Examen(intitule: "Ajout connu clinique",type: .addinfo,tag: "connuClinique"),

        ]
        catConnu.examens=examCatConnu
        
        
        let examcat1   : [Examen] = [
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
            
        ]
        Categorie1.examens = examcat1
        return Categorie1
    }
    
    
    static var atcd:categorieExamen.Categorie {
        let catATCD = categorieExamen.Categorie(nom:"atcd",namedImage: "nurse_icon.png",showNom: false)
        catATCD.startLI()
        let examCatATCD   : [Examen] = [
            Examen(intitule: "nom", type:  .selection,tag: "atcd" ),
            Check("bilatéral(e)"),
            Check("droit(e)"),
            Check("gauche"),
            Check("récidivant(e)s"),
            Check("probable"),
            Examen(intitule: "quand ?", type:  .reponsecourte ,tag: "date"),
            Examen(intitule: "ou ?", type:  .selection,tag: "etablissement" ),
            OuiNon("suivi spécialisé"),
            Examen(intitule: "qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "Commentaire", type:  .reponsecourte, tag: "libre")
        ]
        catATCD.examens=examCatATCD
        return catATCD
    }
    
    static var TTT:categorieExamen.Categorie {
        let catTTT = categorieExamen.Categorie(nom:"Traitement",namedImage: "medoc_icon.png",showNom: false)
        catTTT.startLI()
        let examCatTTT   : [Examen] = [
            Examen(intitule: "Nom", type:  .selection,tag: "medicament" ),
            Examen(intitule: "Posologie", type:  .selection,tag: "posologie" ),
            Examen(intitule: "depuis quand ?", type:  .reponsecourte,tag: "date" ),
            Examen(intitule: "par qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "pour", type:  .selection,tag: "atcd" ),

        ]
        catTTT.examens=examCatTTT
        return catTTT
    }
    static var LocAnat:categorieExamen.Categorie {
        let catLocAnat = categorieExamen.Categorie(nom:"Loc.  anatomique",namedImage: "os_icon.png",showNom: false)
        let examCatLocAnat : [Examen] = [
            Check("droit(e)"),
            Check("gauche"),
            
            Examen(intitule: "Bord", type:  .check, info: " "  ),
            Examen(intitule: "Extrémité", type:  .check, info: " "  ),
            Examen(intitule: "face", type:  .check, info: " "  ),
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
    static var motif:categorieExamen.Categorie {
        let catMotif = categorieExamen.Categorie(nom:"Motif(s)",namedImage: "tete_icon.png",showNom: false)
        
        let examCatMotif : [Examen] = [
            Examen(intitule: "motif", type:  .selection,tag: "motif" ),
            Examen(categorie: self.LocAnat),

            
        ]
        catMotif.examens=examCatMotif
        return catMotif
    }
    static var motifs:categorieExamen.Categorie {
        let catMotifs = categorieExamen.Categorie(nom:"Motif(s)",namedImage: "tete_icon.png",showNom: true)
        let examCatMotifs : [Examen] = [
            motif.asExamen(),
            Examen(intitule: "Ajout motif",type: .addinfo,tag: "motif"),
            Examen(intitule: "début", type:  .donnee,tag: "date" ),

        ]
        catMotifs.examens=examCatMotifs
        return catMotifs
    }
    
    
    static var Plainte:categorieExamen.Categorie {
        let catPlainte = categorieExamen.Categorie(nom:"Plainte",namedImage: "tete_icon.png",showNom: false)
        let examCatPlainte : [Examen] = [
            Examen(intitule: "Signe", type:  .selection,tag: "motif" ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(categorie: LocAnat),
            regionAnat,
            
            Check("aigüe"),
            Check("sub-aigüe"),
            Check("intense"),
            Check("persistante"),
            Check("permanent"),
            Check("de survenue brutale"),
            Check("avec prodromes"),
            Check("d'évolution progressive"),
            Check("avec crises paroxystiques"),
            Examen(intitule: "début", type:  .donnee,tag: "date" ),
            Examen(intitule: "durée", type:  .donnee,tag: "date" ),

            
        ]
        catPlainte.examens=examCatPlainte
        return catPlainte
    }
    static var FRCV:categorieExamen.Categorie {
        let catFRCV = categorieExamen.Categorie(nom:"Facteurs de risques CV",namedImage: "cardio_icon.png",showNom: true)
        catFRCV.startLI()
        
        let examCatFRCV : [Examen] = [
            Check("Homme > 50 ans"),
            Check("Femme > 60 ans"),
            Check("Femme ménopausée"),
            OuiNon("HTA"),
            OuiNon("Dyslipémie"),
            OuiNon("Diabète"),
            OuiNon("Obesité"),
            OuiNon("Surcharge pondérale"),
            OuiNon("Tabagisme"),
            Check("Tabagisme sevré"),
            OuiNon("Insuffisance rénale chronique"),
            OuiNon("Morbidité cardiovasculaire familiale"),
            Examen(intitule: "précision", type:  .reponsecourte ,tag: "precisionCV"),
            ]
        catFRCV.examens=examCatFRCV
        return catFRCV
    }
    
    static var Comorbidite:categorieExamen.Categorie {
        let catComorbidite = categorieExamen.Categorie(nom:"Comorbidité/Antécédents",namedImage: "dossier.png",showNom: true)
        
        let examCatComorbidite : [Examen] = [
            ExamTree.atcd.asExamen(),
            Examen(intitule: "Ajout atcd",type: .addinfo,tag: "atcd"),
            Check("Pas d'atcds notables"),
            
            
            FRCV.asExamen(),
            Vaccin.asExamen(),
            OuiNon("Allergie connue"),
            OuiNon("Allergie médicamenteuse connue"),
            Examen(intitule: "Detail", type:  .reponsecourte, tag: "Allergie" ),
            
            Check("Usager de médecine alternative"),

        ]
        catComorbidite.examens=examCatComorbidite
        return catComorbidite
    }
    
    static var Vaccin:categorieExamen.Categorie {
        let catVaccin = categorieExamen.Categorie(nom:"Vaccination",namedImage: "piqure_icon.png",showNom: true)
        catVaccin.startNewLine()
        let examCatVaccin : [Examen] = [
            Check("Date dernier VAT inconnue"),
            Check("VAT à jour selon le patient"),
            Examen(intitule: "Date dernier VAT", type:  .donnee, tag: "date" ),
            Examen(intitule: "Date dernier DTP", type:  .donnee, tag: "date" ),
            Check("Voir avec médecin traitant"),
            OuiNon("Couverture pneumoccocique"),
            Examen(intitule: "Date Pneumo 23", type:  .donnee, tag: "date" ),
            OuiNon("Vaccin hépatite B"),
            Check("Vaccin anti-grippal annuel"),

        ]
        catVaccin.examens=examCatVaccin
        return catVaccin
    }
    static var detailsTraitement:categorieExamen.Categorie {
        let catdetailsTraitement = categorieExamen.Categorie(nom:"details",namedImage: "medecin-icone.png",showNom: false)
        let examCatdetailsTraitement : [Examen] = [
            Check("Pas de traitement au long cours"),
            Check("(Traitement vu sur ordonnance)"),
            Examen(intitule: "de qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "Date", type:  .donnee, tag: "date" ),
            
            Check("(Traitement indiqué par le patient)"),
            Check("(Traitement indiqué par l'entourage)"),
            Check("(Traitement non connu par le patient)"),
            Check("(Autre prise médicamenteuse non identifié par le patient)"),
            
            ]
        catdetailsTraitement.examens=examCatdetailsTraitement
        return catdetailsTraitement
    }
    
    static var Traitement:categorieExamen.Categorie {
        let catTraitement = categorieExamen.Categorie(nom:"Traitement",namedImage: "medoc_icon.png",showNom: true)
        catTraitement.startNewLine()
        let examCatTraitement : [Examen] = [
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Examen(categorie: ExamTree.TTT),
            Examen(intitule: "Ajout traitement",type: .addinfo,tag: "TTT"),
            detailsTraitement.asExamen(),

        ]
        catTraitement.examens=examCatTraitement
        return catTraitement
    }
    
    static var Poids:categorieExamen.Categorie {
        let catPoids = categorieExamen.Categorie(nom:"<br>Poids/Taille",namedImage: "Homme.png",showNom: false)
        catPoids.startLI()
        let examCatPoids : [Examen] = [
            
            Examen(intitule: "Taille (estimée)", type:  .donnee, tag: "taille" ),
            Examen(intitule: "Taille (mesurée)", type:  .donnee, tag: "taille" ),
            Examen(intitule: "Taille (indiqué par le patient)", type:  .donnee, tag: "taille" ),
            Examen(intitule: "Poids (estimé)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Poids (mesuré)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Poids (indiqué par le patient)", type:  .donnee ,tag: "poids"),
            OuiNon("Variation pondérale récente significative"),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            Examen(intitule: "Périmètre abdominal", type:  .donnee, tag: "taille" ),
            
            ]
        catPoids.examens=examCatPoids
        return catPoids
    }
    
    static var TA:categorieExamen.Categorie {
        setTensionMultiRow()
        let catTA = categorieExamen.Categorie(nom:"Tension artérielle",namedImage: "tension.png",showNom: false)
        let examCatTA : [Examen] = [
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
        let examCatPancartes : [Examen] = [

            Examen(intitule: "Pancarte",type: .donnee , tag: "pancarteView"),
            Examen(intitule: "Ajout pancarte",type: .addinfo,tag: "pancarteV"),

        ]
        catPancartes.examens=examCatPancartes
        return catPancartes
    }
    
    
    static var Pancarte:categorieExamen.Categorie {
        let catPancarte = categorieExamen.Categorie(nom:"Pancarte",namedImage: "pancarte_icon.png",showNom: false)
        catPancarte.startLI()
        let examCatPancarte : [Examen] = [
            Examen(intitule: "horodatage", type:  .reponsecourte,tag: "date" ),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),

            Examen(intitule: "FC", type:  .donnee,tag: "FC" ),
            tensionMultirow,
            Examen(intitule: "Tension bras droit", type: .multirowdatastr , tag: "tensionMultirow"),
            Examen(intitule: "Tension bras gauche", type: .multirowdatastr , tag: "tensionMultirow"),
            
            self.temperatureMultirow,
            
            saO2("SaO2% AA"),
            saO2("Sao2% sous O2"),
            
            Examen(intitule: "Fr. Resp", type:  .donnee ,tag: "fresp"),
            Examen(intitule: "EVA", type:  .donnee,tag: "EVA" ),

        ]
        
        
        catPancarte.examens=examCatPancarte
        return catPancarte
    }
    static var Cheville:categorieExamen.Categorie {
        let catCheville = categorieExamen.Categorie(nom:"Cheville",namedImage: "pied_icon.png",showNom: true)
        catCheville.startLI()
        let examCatCheville : [Examen] = [
            self.LocAnat.asExamen(),
            self.TypeTrauma.asExamen(),
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
    static var Plaie:categorieExamen.Categorie {
        let catPlaie = categorieExamen.Categorie(nom:"Plaie",namedImage: "nurse_icon.png",showNom: true)
        catPlaie.startLI()
        let examCatPlaie : [Examen] = [
            regionAnat,
            Examen(intitule: "situation", type:  .reponsecourte ),
            self.LocAnat.asExamen(),
            Check("superficielle"),
            Examen(intitule: "contexte", type:  .reponsecourte ),

            Check("par écrasement"),
            Check("par lacération"),
            Check("par morsure"),
            Examen(intitule: "taille", type:  .donnee ),
            Check("bords nets"),
            Check("bords contus"),
            Check("plaie souillée"),]
        let  Plaie2: [Examen] = [

            Check("perte de substance"),
            Check("présence de zones tissulaires dévitalisées"),
            Check("datant de plusieurs jours"),
            Check("datant de plus de 6 heures"),
            Check("Désinfection bétadine"),
            Check("Anesthésie locale"),
            Check("Anesthésie Intra-thecale"),
            Check("Xylocaine non adrénalinée"),
            Check("Exploration"),
            Check("Corps étrangers"),
            Check("Nettoyage et brossage"),
            Check("Exérèse des tissus nécrotiques ou contus"),
            Check("Suture en 2 plans"),
            
            Check("Suture revëtement cutanée"),
            Examen(intitule: "Ethycrin 3/0", type:  .donnee ),
            Examen(intitule: "Ethycrin 4/0", type:  .donnee ),
            Examen(intitule: "Ethycrin 5/0", type: .donnee),
            Examen(intitule: "Ethycrin 6/0", type:  .donnee ),
            Examen(intitule: "Résorbable 3/0", type:  .donnee ),
            Examen(intitule: "Résorbable 4/0", type:  .donnee ),
            Examen(intitule: "Résorbable 5/0", type: .donnee),
            Examen(intitule: "Test d'immunité anti-tétanique", type:  .donnee ),
            Examen(intitule: "Antibioprophylaxie", type:  .donnee ),
            Check("Surveillance journalière"),
            
            Check("Ablation des points par IDE ou MT sous 5-8 jours selon cicatrisation"),
            
            Check("Ablation des points par IDE ou MT sous 8-10 jours selon cicatrisation"),

            
        ]
        catPlaie.examens=examCatPlaie+Plaie2
        return catPlaie
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
            OuiNon("lésion LCA au test de Lemaire (subuluxation du tibia à 15° de flexxion + RI du pied)"),
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
    
    
    static var EntretienPatient:categorieExamen.Categorie {
        let catEntretienPatient = categorieExamen.Categorie(nom:"Entretien",namedImage: "tete_icon.png",showNom: false)
        let examCatEntretienPatient : [Examen] = [
            Check("Entretien avec le patient"),
            Check("Entretien avec le patient et son entourage"),
            Check("Entretien avec l'entourage"),
            Check("Compte rendu des examens reçus"),
            Check("Discussion sur les hypothèses diagnostiques"),
            Check("Discussion sur le devenir"),
            Check("souhaite des examens complémentaires"),
            Check("souhaite un avis spécialisé"),
            Check("difficulté pour le maintien à domicile"),
            Check("ne souhaite pas d'investigations supplémentaires"),
            Check("souhaiterait une hospitalisation"),
            Check("agacé par l'attente"),
            Check("ne souhaite pas l'hospitalisation"),
            Check("ne souhaite pas quitter le service"),
            
            Check("souhaiterait si possible un retour à domicile"),
            Check("souhaite un retour à domicile"),
            Check("sortie contre avis médical"),
            

            
        ]
        catEntretienPatient.examens=examCatEntretienPatient
        return catEntretienPatient
    }
    
    static var AvisSpecialiste:categorieExamen.Categorie {
        let catAvisSpecialiste = categorieExamen.Categorie(nom:"Avis Specialiste",namedImage: "medecin_icon.png",showNom: true)
        catAvisSpecialiste.startLI()
        let examCatAvisSpecialiste : [Examen] = [
            Check("demandé"),
            Check("Vu par"),
            Examen(intitule: "qui ?", type:  .selection,tag: "medecin" ),

            Examen(intitule: "Evenement", type: .reponsecourte, tag:"Evenement"),
            Check("Indisponible pour l'instant"),
            Check("passera voir le patient"),
            Check("demande un avis"),
            Examen(intitule: "de qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "demande investigation", type: .donnee),

        ]
        catAvisSpecialiste.examens=examCatAvisSpecialiste
        return catAvisSpecialiste
    }
    static var ActeTherapeuthique:categorieExamen.Categorie {
        let catActeTherapeuthique = categorieExamen.Categorie(nom:"Acte Thérapeutique",namedImage: "piqure_icon.png",showNom: false)
        catActeTherapeuthique.startLI()
        let examCatActeTherapeuthique : [Examen] = [
            Check("Voie veineuse"),
            Examen(intitule: "Oxygénothérapie lunettes", type:  .donnee ),
            Examen(intitule: "Oxygénothérapie masque", type:  .donnee ),
            Examen(intitule: "Administration", type:  .check ,info: " "),
            Examen(intitule: "produit", type:  .selection,tag: "medicament" ),

        ]
        catActeTherapeuthique.examens=examCatActeTherapeuthique
        return catActeTherapeuthique
    }
    static var DemandeExamen:categorieExamen.Categorie {
        let catDemandeExamen = categorieExamen.Categorie(nom:"demande d'examens",namedImage: "dossier.png",showNom: true)
        catDemandeExamen.startLI()
        let examCatDemandeExamen : [Examen] = [
            Check("Electrocardiogramme"),
            Check("Biologie"),
            Check("Radiographie"),
            Check("Scanner Cerebral"),
            Check("Scanner Thoraco abdominal"),
            Check("Scanner Thoracique"),
            Check("Scanner Abdominal"),
            Check("Echographie"),

        ]
        catDemandeExamen.examens=examCatDemandeExamen
        return catDemandeExamen
    }
       
    static var evenement:categorieExamen.Categorie {
        let catevenement = categorieExamen.Categorie(nom:"Evenement",namedImage: "stetho_icon.png",showNom: false)
        catevenement.startLI()
        let examCatevenement : [Examen] = [
            Examen(intitule: "horodatage", type: .reponsecourte,tag: "date"),
            EvolutionClinique.asExamen(),
            EntretienPatient.asExamen(),
            AvisSpecialiste.asExamen(),
            ActeTherapeuthique.asExamen(),
            DemandeExamen.asExamen(),

        ]
        catevenement.examens=examCatevenement
        return catevenement
    }
      
    static var EvolutionClinique:categorieExamen.Categorie {
        let catEvolutionClinique = categorieExamen.Categorie(nom:"Evolution Clinique",namedImage: "examenclinique.png",showNom: false)
        catEvolutionClinique.startLI()
        let examCatEvolutionClinique : [Examen] = [
            Check("Diagnostic incertain"),
            Check("nécessité d'une surveillance hémodynamique"),
            Check("nécessité d'une surveillance de l'évolution"),
            Check("Hyperalgie"),
            Check("Antalgie acquise"),
            Check("Antalgie insuffisante"),
            OuiNon("Amélioration franche"),
            Check("Amélioration partielle"),
            OuiNon("Etat clinique stable"),
            OuiNon("Détériotation"),
            Examen(categorie: ExamTree.Plainte),
            Examen(intitule: "Ajout plainte",type: .addinfo,tag: "Plainte"),
            // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre"),
        ]
        catEvolutionClinique.examens=examCatEvolutionClinique
        return catEvolutionClinique
    }
    
    static var SuiviEvolution:categorieExamen.Categorie {
        let catSuiviEvolution = categorieExamen.Categorie(nom:"Suivi/Evènements",namedImage: "stetho_icon.png",showNom: true)
        let examCatSuiviEvolution : [Examen] = [
            evenement.asExamen(),
            
            Examen(intitule: "Ajout clinique",type: .addinfo,tag: "clinique"),
            Examen(intitule: "Ajout pancarte",type: .addinfo,tag: "pancarte"),
            Examen(intitule: "Ajout évènement",type: .addinfo,tag: "evenementSuivi"),
            ]
        catSuiviEvolution.examens=examCatSuiviEvolution
        return catSuiviEvolution
    }

    static var Radiographie:categorieExamen.Categorie {
        let catRadiographie = categorieExamen.Categorie(nom:"Radiographies",namedImage: "imagerie_icon.png",showNom: true)
        catRadiographie.startLI()
        var examCatRadiographie : [Examen] = [
            Check("Crane"),
            Check("Thoracique"),
            Check("Gril costal gauche"),
            Check("Gril costal droit"),
            Check("Cervicales"),
            Check("Dorsales"),
            Check("Lombaires"),
            Check("Bassin"),
            Check("Hanche gauche"),
            Check("Hanche droite"),
            Check("Femur gauche"),
            Check("Fémur droit"),]

        catRadiographie.examens=examCatRadiographie
        return catRadiographie
    }
    static var ExamenGeneral:categorieExamen.Categorie {
        let catExamenGeneral = categorieExamen.Categorie(nom:"<br>Examen général",namedImage: "examenclinique.png",showNom: true)

        let examCatExamenGeneral : [Examen] = [
            Check("Communication normale" ),
            Check("Pas de communication" ),
            Check("Communication altérée" ),
            Check("Compréhension difficile" ),
            Check("Conscient" ),
            Check("Orienté" ),
            OuiNon("Anxiété apparente"),
            self.Poids.asExamen(),
            self.Adenopathies.asExamen(),
            Examen(intitule: "Dernier repas", type:  .reponsecourte, tag: "date" ),
            Check("Erythrose faciale"),
            Check("Paleur cutanéomuqueuse"),
            
            self.OMS,
            self.Karnofsky,

        ]
        catExamenGeneral.examens=examCatExamenGeneral
        return catExamenGeneral
    }
    
    static var ExamenClinique:categorieExamen.Categorie {
        let catExamenClinique = categorieExamen.Categorie(nom:"<br>Examen Clinique",namedImage: "examenclinique.png",showNom: true)
        catExamenClinique.startLI()
        let examCatExamenClinique : [Examen] = [
            Examen(intitule: "horodatage", type:  .reponsecourte,tag: "date" ),
            self.ExamenGeneral.asExamen(),
            self.Neurologie.asExamen(),
            self.Cardiovasculaire.asExamen(),
            self.Respiratoire.asExamen(),
            self.Digestif.asExamen(),
            self.Urologie.asExamen(),
            self.ORL.asExamen(),
            self.Locomoteur.asExamen(),
            ]
        catExamenClinique.examens=examCatExamenClinique
        return catExamenClinique
    }
    static var Conclusion:categorieExamen.Categorie {
        let catConclusion = categorieExamen.Categorie(nom:"Conclusion",namedImage: "medecin_icon.png",showNom: true)
        catConclusion.startNewLine()
        let examCatConclusion : [Examen] = [
            Check("Suspicion "),
            Examen(intitule: "Diagnostic", type: .selection,tag: "atcd"),
            ExamTree.LocAnat.asExamen(),
            //self.libre,
            Check("hospitalisation"),
            Check("pris en charge par"),
            Examen(intitule: "médecin", type: .selection, tag: "medecin"),
            Check("Retour à domicile"),
            Check("Surveillance par le médecin traitant"),
            Check("Consultation spécialisé prévu"),
            Check("Consultation spécialisé à prévoir"),
            Examen(intitule: "date", type: .reponsecourte,tag: "date"),
            Examen(intitule: "médecin", type: .selection, tag: "medecin"),
            Examen(intitule: "sous", type: .reponsecourte),
            Check("Nouvelle consultation nécessaire si évolution péjorative"),
            Check("Prendre nouvel avis médical si aggravation ou évolution insatisfaisante"),
            Check("Prendre nouvel avis médical si récidive"),
            //self.libre,
            Examen(intitule: "Autre", type: .reponsecourte,tag: "conclusionautre"),
            // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catConclusion.examens=examCatConclusion
        return catConclusion
    }
    static var Imagerie:categorieExamen.Categorie {
        let catImagerie = categorieExamen.Categorie(nom:"Imagerie",namedImage: "imagerie_icon.png",showNom: true)
        catImagerie.startLI()
        let examCatImagerie : [Examen] = [
            ExamTree.Radiographie.asExamen(),
            Check("Echographie abdominale"),
            Check("Echographie"),
            Check("Echographie doppler"),
            Check("Scanner"),
            Check("IRM"),
            Check("E.E.G."),
            Check("EMG"),
            Examen(intitule: "(précision)", type: .reponsecourte,tag: "libre"),
            Check("en cours"),
            
            Check("(Interprétation radiologue)"),
            Examen(intitule: "conclusion:", type: .selection,tag: "ConclusionRx"),
            
            Check("sous reserve de confirmation par le radiologue"),
            self.Document.asExamen(),
            //self.libre,
            
        ]
        catImagerie.examens=examCatImagerie
        return catImagerie
    }
    static var Gazometrie:categorieExamen.Categorie {
        let catGazometrie = categorieExamen.Categorie(nom:"Gazometrie",namedImage: "piqure_icon.png",showNom: true)
        catGazometrie.startLI()
        let examCatGazometrie : [Examen] = [
            self.Document.asExamen(),
            Check("Air ambiant"),
            Check("Sous O2"),
            
            Check("Normale"),
            Check("Alcalose"),
            Check("Acidose"),
            Check("Hypoxie"),
            Check("Hypocapnie"),
            Check("Hypercapnie"),
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
    
    static var PlainteAnamnèse:categorieExamen.Categorie {
        let catPlainteAnamnèse = categorieExamen.Categorie(nom:"Plaintes/Anamnèse",namedImage: "tete_icon.png",showNom: true)
        catPlainteAnamnèse.startLI()
        let examCatPlainteAnamnèse : [Examen] = [
            
            //self.libre,
            Examen(categorie: ExamTree.Plainte),
            Examen(intitule: "Ajout plainte",type: .addinfo,tag: "Plainte")
        ]
        catPlainteAnamnèse.examens=examCatPlainteAnamnèse
        return catPlainteAnamnèse
    }
    
    
    
    static var RespiratoireFonctionnel:categorieExamen.Categorie {
        let catRespiratoireFonctionnel = categorieExamen.Categorie(nom:"Fonctionnel",namedImage: "pneumo_icon.png",showNom: true)
        catRespiratoireFonctionnel.startLI()
        let examCatRespiratoireFonctionnel : [Examen] = [
            OuiNon("Dyspnée"),
            OuiNon("Toux"),
            OuiNon("Expectorations"),
            OuiNon("Difficultés à l'élocution"),
            //self.libre,
        ]
        catRespiratoireFonctionnel.examens=examCatRespiratoireFonctionnel
        return catRespiratoireFonctionnel
    }
    static var RespiratoireAuscultation:categorieExamen.Categorie {
        let catRespiratoireAuscultation = categorieExamen.Categorie(nom:"Auscultation",namedImage: "stetho_icon.png",showNom: true)
        catRespiratoireAuscultation.startLI()
        let examCatRespiratoireAuscultation : [Examen] =  [
            Check("MV + symétrique"),
            OuiNon("Sibilants"),
            OuiNon("Crépitants"),
            OuiNon("Ronchis"),
            OuiNon("Stridor"),
            OuiNon("Wheezing"),
            OuiNon("Frottement pleural"),
            OuiNon("Foyer auscultatoire"),
            //self.libre,
        ]
        catRespiratoireAuscultation.examens=examCatRespiratoireAuscultation
        return catRespiratoireAuscultation
    }
    
    
    static var Respiratoire:categorieExamen.Categorie {
        let catRespiratoire = categorieExamen.Categorie(nom:"<br>Appareil respiratoire",namedImage: "pneumo_icon.png",showNom: true)
        catRespiratoire.startNewLine()
        let examCatRespiratoire : [Examen] =  [
            Check("Examen Normal"),
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            self.RespiratoireFonctionnel.asExamen(),
            self.RespiratoireAuscultation.asExamen(),
            OuiNon("Hippocratisme digital"),
            OuiNon("Cyanose labiale"),
            OuiNon("Tirage"),
            Check("Respiration de Cheyne-Stokes (RCS)"),
              Check("Oxygenothérapie à domicile"),
            OuiNon("Ronchopathie signalée"),
            Examen(intitule: "SaO2%", type:  .donnee ),
            //self.libre,
        ]
        catRespiratoire.examens=examCatRespiratoire
        return catRespiratoire
    }
        static var Adenopathies:categorieExamen.Categorie {
        let catAdenopathies = categorieExamen.Categorie(nom:"(adénopathies)",namedImage: "examenclinique.png",showNom: false)
        let examCatAdenopathies : [Examen] = [
            Check("Pas d'adénopathies cervicales ou axillaires"),
            OuiNon("Adénopathie inguinale"),
            OuiNon("Adénopathie axillaire"),
            OuiNon("Adénopathie cervicale"),
            OuiNon("Adénopathie sus-claviculaire"),
            LocAnat.asExamen(),
            ]
        catAdenopathies.examens=examCatAdenopathies
        return catAdenopathies
    }
    static var Urologie:categorieExamen.Categorie {
        let catUrologie = categorieExamen.Categorie(nom:"<br>Appareil Urologique",namedImage: "rein_icon.png",showNom: true)
        catUrologie.startNewLine()
        let examCatUrologie : [Examen] =   [
            
            OuiNon("Examen Normal"),
            
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            Check("BU Normale"),
            Examen(intitule: "BU Positive", type:  .donnee ),
            OuiNon("Troubles fonctionnels urinaires"),
            OuiNon("Pollakiurie"),
            OuiNon("Ecoulement urethral"),
            OuiNon("Brulure mictionnelle"),
            Check("Urines foncées"),
            OuiNon("Dyspareunie"),
            OuiNon("Hématurie"),
            OuiNon("Pyurie"),
            Check("Odeur forte des urines"),
            OuiNon("Douleur lombaire"),
            Check("Douleur fosse lombaire gauche"),
            Check("Douleur fosse lombaire droite"),
            Check("à la pression hypogastrique/vésicale"),
            Check("Douleur flanc gauche"),
            Check("Douleur flanc droit"),
            OuiNon("Douleur testiculaire"),
            Check("Testicules normaux"),
            OuiNon("Induration testiculaire"),
            OuiNon("Hydrocèle"),
            //self.libre,
            
        ]
        catUrologie.examens=examCatUrologie
        return catUrologie
    }
    
    static var Locomoteur:categorieExamen.Categorie {
        let catLocomoteur = categorieExamen.Categorie(nom:"<br>Locomoteur",namedImage: "os_icon.png",showNom: true)
        catLocomoteur.startNewLine()
        let examCatLocomoteur : [Examen] = [
            self.Document.asExamen(),
            Check("Pas sous anti-coagulant"),
            Check("Pas sous anti-agrégant"),
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
        let catORL = categorieExamen.Categorie(nom:"<br>O.R.L.",namedImage: "nez_icon.png",showNom: true)
        catORL.startNewLine()
        let examCatORL : [Examen] = [
            OuiNon("Examen Normal"),
            
            Examen(intitule: "Commentaire", type:  .reponsecourte ),
            OuiNon("Dysphagie"),
            OuiNon("Amygdales normales"),
            OuiNon("Rhinorrhée"),
            OuiNon("Anosmie"),
            OuiNon("Hypoaccousie"),
            OuiNon("Acouphènes"),
            OuiNon("Vertige"),
            OuiNon("Amygdalite"),
            OuiNon("Erythème pharyngé"),
            OuiNon("Adénopathie cervicale"),
            OuiNon("Adénopathie sous-maxillaire"),
            Examen(intitule: "Epistaxis", type:  .donnee ),
            OuiNon("Pas d'otalgie"),
            Check("Otalgie droite"),
            Check("Otalgie gauche"),
            Check("Otorrhée gauche"),
            Check("Otorrhée droite"),
            Check("Otorragie gauche"),
            Check("Otorragie droite"),
            // Examen(intitule: "Ajout texte libre",type: .addinfo,tag: "libre")
        ]
        catORL.examens=examCatORL
        return catORL
    }
    static var typeDouleur:categorieExamen.Categorie {
        let cattypeDouleur = categorieExamen.Categorie(nom:"typeDouleur",namedImage: "<#image#>",showNom: false)
        cattypeDouleur.startNewLine()
        let examCattypeDouleur = [
            Check("Apparition brutale"),
            Check("Apparition progressive"),
            Check("douleur continue"),
            Check("douleur intermittente"),
            Check("douleur continue avec crises paroxystiques"),
            OuiNon("modification par les mouvements respiratoires"),
            Check("Pas de position antalgique"),
            Check("atténué par le décubitus"),
            OuiNon("Soulagement par l'émission de gaz"),
            OuiNon("Augmentation à la palpation"),
            OuiNon("Modification par la mobilisation rachidienne"),
            OuiNon("Modification par les mouvements respiratoires"),
             OuiNon("Modification à la mobilisation"),
            
            ]
        cattypeDouleur.examens=examCattypeDouleur
        return cattypeDouleur
    }
    
    static var Biologie:categorieExamen.Categorie {
        let catBiologie = categorieExamen.Categorie(nom:"Biologie",namedImage: "piqure_icon.png",showNom: true)
        catBiologie.startNewLine()
        let examCatBiologie : [Examen] = [
            Check("Bilan normal"),
            Check("Hémogramme normal"),
            Examen(intitule: "Hémoglobine", type: .donnee),
            Examen(intitule: "Leucocytes", type: .donnee),
            Examen(intitule: "Plaquettes", type: .donnee),
            OuiNon("Insuffisance rénale"),
            Examen(intitule: "Créatinémie", type: .donnee),
            Examen(intitule: "Clairance", type: .donnee),
            Examen(intitule: "Sodium (Na)", type: .donnee),
            Examen(intitule: "Potassium (K)", type: .donnee),
            OuiNon("Syndrome inflammatoire"),
            Examen(intitule: "Proteine C Réactive (CRP)", type: .donnee),
            Examen(intitule: "Fibrinogène", type: .donnee),
            Examen(intitule: "Procalcitonine", type: .donnee),
            Check("Bilan hépatique normal"),
            OuiNon("Cytolyse"),
            Examen(intitule: "ASAT (TGO)", type: .donnee),
            Examen(intitule: "ALAT (TGP)", type: .donnee),
            
            OuiNon("Cholestase"),
            Examen(intitule: "Bilirubine", type: .donnee),
            Examen(intitule: "Phosphatases Alcalines", type: .donnee),
            Examen(intitule: "ɣGT", type: .donnee),
            
            Check("Enzymes cardiaques normales"),
            Examen(intitule: "Troponine", type: .donnee),
            Examen(intitule: "Pro-BNP", type: .donnee),
            Examen(intitule: "BNP", type: .donnee),
            Examen(intitule: "D-Dimères", type: .donnee),
            Examen(intitule: "Myoglobine", type: .donnee),
            
            Check("Euthyroïdie"),
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
    
    
    static var regionAnat:Examen {
        //let catKarnofsky = categorieExamen.Categorie(nom:"Échelle de Karnofsky",namedImage: "pancarte_icon.png",showNom: true)
        
        
        
        Donnees.selectiontextDict["dataStrregionAnat"]=[
            "Crane",
            "Thoracique",
            "Gril costal gauche",
            "Gril costal droit",
            "Cervicales",
            "Dorsales",
            "Lombaires",
            "Bassin",
            "Hanche gauche",
            "Hanche droite",
            "Femur gauche",
            "Fémur droit",
            
            "Genou gauche",
            "Genou droit",
            "Jambe gauche",
            "Jambe droite",
            "Epaule gauche",
            "Epaule droit",
            "Bras gauche",
            "Bras droit",
            "Coude gauche",
            "Coude droit",
            "Avant-bras gauche",
            "Avant-bras droit",
            "Poignet gauche",
            "Poignet droit",
            "Main gauche",
            "Main droite",
            ].sort()
        
        return Examen(intitule: "(région anatomique)", type: .datastr, tag: "dataStrregionAnat")
    }
    static func Accompagnant(intitule: String = "Accompagnant")-> Examen {
        //static var :Examen {
        
        Donnees.selectiontextDict["dataStrAccompagnant"]=[
            "Epoux(se)","Frère","Soeur","Mère","Père","Compagnon","Compagne","proches",
        ]
        
        return Examen(intitule: "Accompagnant", type: .datastr, tag: "dataStrAccompagnant")
    }
    static func saO2(intitule: String = "saO2")-> Examen {
        //static var :Examen {
        
        Donnees.selectiontextDict["dataStrsaO2"]=[""]
        for x in 80...100 {
            Donnees.selectiontextDict["dataStrsaO2"]?.append(String(x))
        }
        
        return Examen(intitule: intitule, type: .datastr, tag: "dataStrsaO2")
    }
    
    static func debutDouleur(intitule: String )-> Examen {
        Donnees.selectiontextDict["dataStrdebutDouleur"]=[
            "Franche et brutale en coups de poignard","d'évolution progressive, insidieuse",
        ]
        
        return Examen(intitule: intitule, type: .datastr, tag: "dataStrdebutDouleur")
    }
}