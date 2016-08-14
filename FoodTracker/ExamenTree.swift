//
//  ExamenTree.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 24/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import Foundation

class ExamTree :NSObject{
    
    static func getExam(examtype:String) ->Examen? {
        switch examtype.lowercaseString {
        case "zone anatomique":
            return self.regionAnat
            
        case "typemotif":
            return self.typeMotif.asExamen()
        case "douleur":
            return Douleur.asExamen()
        case "libre" :
            return self.libre
        case "atcd" :
            return self.atcd.asExamen()
        case "page" :
            return Examen(intitule: "(image)", type:  .imagefilename )
        case "neurologie":
            return self.Neurologie.asExamen()
        case "locabdo":
            return self.locAbdo
        case "document":
            return self.Document.asExamen()
        case "motif":
            return self.motif.asExamen()
        case "digestif":
            return self.Digestif.asExamen()
        case "neurovertige":
            return self.neuroVertige.asExamen()
        case "locomoteur":
            return self.Locomoteur.asExamen()
        case "orl":
            return self.ORL.asExamen()
        case "bras":
            return self.Bras.asExamen()
        case "cardiovasculaire":
            return self.Cardiovasculaire.asExamen()
        case "urologie":
            return self.Urologie.asExamen()
        case "plaie":
            return self.Plaie.asExamen()
        case "face":
            return self.Face.asExamen()
        case "plainte":
            return self.Plainte.asExamen()
        case "rachiscervical":
            return self.RachisCervical.asExamen()
        case "epaule":
            return self.Epaule.asExamen()
        case "coude":
            return self.Coude.asExamen()
        case "avantbras":
            return self.AvantBras.asExamen()
        case "main":
            return self.Main.asExamen()
        case "doigt":
            return self.Doigt.asExamen()
        case "poignet":
            return self.Poignet.asExamen()
        case "rachisLombaire":
            return self.RachisLombaire.asExamen()
        case "hanche":
            return self.Hanche.asExamen()
        case "genou":
            return self.Genou.asExamen()
        case "jambe":
            return self.Jambe.asExamen()
        case "cheville":
            return self.Cheville.asExamen()
        case "ttt":
            return self.TTT.asExamen()
            
        case "ecg":
            return self.ECG.asExamen()
        case "biologie":
            return self.Biologie.asExamen()
        case "gazometrie":
            return self.Gazometrie.asExamen()
        case "bandelette":
            return self.Bandelette.asExamen()
        case "imagerie":
            return self.Imagerie.asExamen()
        case "pancarte":
            return self.Pancartes.asExamen()
        case "connuclinique":
            return self.ConnuClinique.asExamen()
            
        default:
            print("get exam Non géré : ", examtype)
            
            break
        }
        return nil
    }
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
            Examen(intitule: "connucliniquepour", datastr: ["non médical","Suivi oncologique","Suivi cardiovasculaire","Suivi pneumologique","Suivi neurologique","Suivi urologique","Suivi traumatologique","Intervention orthopédique","Intervention chirurgicale","Bilan spécialisé","Suivi diabétologique","Avis spécialisé","Suivi angiologique","Déja vu en consultation"].sort()),
            
            Examen(intitule: "dernier contact", type:  .donnee ,tag: "date"),
            atcd.asExamen(),
            ]
        catConnuClinique.subitems.append("atcd")
        catConnuClinique.examens=examCatConnuClinique
        return catConnuClinique
    }
    static var activitePhysique:categorieExamen.Categorie {
        let catactivitePhysique = categorieExamen.Categorie(nom:"Activités physiques",namedImage: "examenclinique.png",showNom: true)
        let examCatactivitePhysique = [
            Check("Pas d'activité physique - Sédentaire"),
            Check("Activité physique modérée"),
            Check("Jardinage"),Check("Marche rapide"),Check("Bricolage"),Check("Travaux ménagers"),
            OuiNon("Activité physique d'intensité élevée"),
            Check("Course"),Check("vélo"),Check("Activité sportive"),Check("profession manuelle"),
            ]
        catactivitePhysique.examens=examCatactivitePhysique
        return catactivitePhysique
    }
    
    
    // MARK: administratif
    static var administratif: categorieExamen.Categorie {
        let Categorie1 = categorieExamen.Categorie(nom: "Administratif",namedImage: "administratif_icon.png")
        
        let catModeVie = categorieExamen.Categorie(nom: "Mode de vie", namedImage: "femme.png")
        
        let excamCatModeVie = [
            Examen(intitule: "Profession", type:  .selection ,tag: "profession"),
            Examen(intitule: "lieu mode vie", datastr: ["à son domicile","en institution","en maison de retraite" ,"en maison médicalisée","sans domicile fixe","hébergé chez des proches"].sort() ),
            Check("avec sa famille" ),
            Check("seul" ),
            Check("en couple" ),
            Check("Veuf(ve)" ),
            Check("Pas d'enfants" ),
            Examen(intitule: "enfant mineur/dépendant", type:  .donnee ),
            Examen(intitule: "enfant autonome", type:  .donnee ),
            activitePhysique.asExamen(),
            ]
        catModeVie.examens=excamCatModeVie
        let catModeEntree = categorieExamen.Categorie(nom: "Mode d'entrée",namedImage: "ambulance_icon.png")
        //catModeEntree.startLI()
        let excamCatModeEntree = [
            Examen(intitule: "adressage", datastr: ["Se présente spontanément","amené par la famille","adressé par le centre 15","Adressé par médecin traitant","adressé par médecin de garde","adressé en interne",].sort() ),
            Examen(intitule: "Médecin", type:  .selection ,tag: "medecin"),
            Check("(courrier)"),
            Check("(appel téléphonique)"),
            Check("médicalisé par le SMUR"),
            Examen(intitule: "Médecin SMUR", type:  .selection ,tag: "medecin"),
            Examen(intitule: "transport", datastr: ["Transporté par les pompiers","transporté par ambulance","vient par ses propres moyens", "transporté par les proches"].sort() ),
            Check("non médicalisé"),
            OuiNon("Accompagnant"),
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
        catConnu.subitems.append("connuClinique")
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
        //catTTT.startLI()
        catTTT.formatPreString="<br>"
        let examCatTTT   : [Examen] = [
            Examen(intitule: "Nom", type:  .selection,tag: "medicament" ),
            Check("(Dosage non précisé)"),
            Examen(intitule: "Posologie", type:  .selection,tag: "posologie" ),
            Examen(intitule: "depuis quand ?", type:  .reponsecourte,tag: "date" ),
            Examen(intitule: "par qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "pour", type:  .selection,tag: "atcd" ),
            
            ]
        catTTT.examens=examCatTTT
        return catTTT
    }
    
    static var motif:categorieExamen.Categorie {
        let catMotif = categorieExamen.Categorie(nom:"Motif(s)",namedImage: "tete_icon.png",showNom: false)
        
        let examCatMotif : [Examen] = [
            Examen(intitule: "motif", type:  .selection,tag: "motif" ),
            Examen(categorie: self.LocAnat),
            regionAnat,
            
            ]
        catMotif.examens=examCatMotif
        return catMotif
    }
    static var typeMotif:categorieExamen.Categorie {
        let cattypeMotif = categorieExamen.Categorie(nom:"Contexte Motif",namedImage: "nurse_icon.png",showNom: false)
        let examCattypeMotif = [
            Check("Traumatisme"),
            Check("Douleur"),
            Check("Malaise"),
            Check("Bilan de chute"),
            Check("Accident de la voie publique"),
            Check("Chute à vélo"),
            Check("Accident de sport"),
            Check("Accident de travail"),
            Check("Accident domestique"),
            
            
            ]
        cattypeMotif.examens=examCattypeMotif
        return cattypeMotif
    }
    
    static var motifs:categorieExamen.Categorie {
        let catMotifs = categorieExamen.Categorie(nom:"Motif(s)",namedImage: "tete_icon.png",showNom: true)
        
        
        let examCatMotifs : [Examen] = [
            
            Examen(intitule: "date", type:  .donnee,tag: "date" ),
            
            typeMotif.asExamen(),
            Examen(intitule: "localisation de face", imageName: "corps femme front.png.map"),
            Examen(intitule: "localisation de dos", imageName: "corps femme back.png.map"),
            motif.asExamen(),
            ]
        catMotifs.subitems.append("motif")
        catMotifs.subitems.append("typemotif")
        catMotifs.examens=examCatMotifs
        return catMotifs
    }
    
    static var SignesGeneraux:categorieExamen.Categorie {
        let catSignesGeneraux = categorieExamen.Categorie(nom:"Signes Generaux",namedImage: "nurse_icon.png",showNom: false)
        let examCatSignesGeneraux = [
            Check("Nausée"),
            Check("Vomissements"),
            Check("Céphallée"),
            Check("Diarrhée"),
            Check("Troubles sensoriels"),
            Check("Lipothymies"),
            Check("Sueurs"),
            Check("Dyspnée"),
            Check("Anxiété"),
            Check("Hyperthermie"),
            ]
        catSignesGeneraux.examens=examCatSignesGeneraux
        return catSignesGeneraux
    }
    
    static var Plainte:categorieExamen.Categorie {
        let catPlainte = categorieExamen.Categorie(nom:"Plainte",namedImage: "tete_icon.png",showNom: false)
        let examCatPlainte : [Examen] = [
            Examen(intitule: "Signe", type:  .selection,tag: "motif" ),
            Examen(categorie: LocAnat),
            regionAnat,
            Examen(intitule: "début", type:  .donnee,tag: "date" ),
            Examen(intitule: "durée", type:  .donnee,tag: "date" ),
            
            Check("aigüe"),
            Check("sub-aigüe"),
            Check("intense"),
            Check("persistante"),
            Check("permanent"),
            Check("de survenue brutale"),
            Check("avec prodromes"),
            Check("d'évolution progressive"),
            Check("avec crises paroxystiques"),
            
            
            
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
            
            Check("Pas d'atcds notables<br>"),
            FRCV.asExamen(),
            Vaccin.asExamen(),
            OuiNon("Allergie connue"),
            OuiNon("Allergie médicamenteuse connue"),
            Check("Pas de détail sur les allergènes"),
            Examen(intitule: "Detail", type:  .reponsecourte, tag: "Allergie" ),
            
            // Check("Usager de médecine alternative"),
            
        ]
        catComorbidite.subitems.append("atcd")
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
            Check("Prise médicamenteuse journalière (principe actif et posologie inconnu)"),
            Examen(intitule: "source info traitement", datastr: ["(Traitement vu sur ordonnance)","(Traitement indiqué par le patient)","(Traitement indiqué par l'entourage)","(Traitement non connu par le patient)","(Traitement vu sur courrier de transmission)"].sort() ),
            Examen(intitule: "de qui ?", type:  .selection,tag: "medecin" ),
            Examen(intitule: "Date", type:  .donnee, tag: "date" ),
            
            Check("(Autre prise médicamenteuse non identifié)"),
            
            ]
        catdetailsTraitement.examens=examCatdetailsTraitement
        return catdetailsTraitement
    }
    
    static var Traitement:categorieExamen.Categorie {
        let catTraitement = categorieExamen.Categorie(nom:"Traitement",namedImage: "medoc_icon.png",showNom: true)
        //  catTraitement.startNewLine()
        let examCatTraitement : [Examen] = [
            detailsTraitement.asExamen(),
            Examen(categorie: ExamTree.TTT),
            
            ]
        catTraitement.subitems.append("TTT")
        catTraitement.examens=examCatTraitement
        return catTraitement
    }
    
    static var Poids:categorieExamen.Categorie {
        let catPoids = categorieExamen.Categorie(nom:"<br>Poids/Taille",namedImage: "Homme.png",showNom: false)
        catPoids.startLI()
        let examCatPoids : [Examen] = [
            Examen(intitule: "Poids (indiqué par le patient)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Taille (indiqué par le patient)", type:  .donnee, tag: "taille" ),
            OuiNon("Variation pondérale récente significative"),
            Examen(intitule: "Détail", type:  .reponsecourte ),
            
            Examen(intitule: "Poids (estimé)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Poids (mesuré)", type:  .donnee ,tag: "poids"),
            Examen(intitule: "Taille (estimée)", type:  .donnee, tag: "taille" ),
            Examen(intitule: "Taille (mesurée)", type:  .donnee, tag: "taille" ),
            Check("Surcharge type androïde"),
            Check("Surcharge type gynoïde"),
            
            Examen(intitule: "Périmètre abdominal", type:  .donnee, tag: "taille" ),
            
            ]
        catPoids.examens=examCatPoids
        return catPoids
    }
    
    //    static var TA:categorieExamen.Categorie {
    //        setTensionMultiRow()
    //        let catTA = categorieExamen.Categorie(nom:"Tension artérielle",namedImage: "tension.png",showNom: false)
    //        let examCatTA : [Examen] = [
    //            tensionMultirow,
    //            Examen(intitule: "Tension bras droit", type: .multirowdatastr , tag: "tensionMultirow"),
    //            Examen(intitule: "Tension bras gauche", type: .multirowdatastr , tag: "tensionMultirow"),
    //            Examen(intitule: "Tension cheville droite", type: .multirowdatastr , tag: "tensionMultirow"),
    //            Examen(intitule: "Tension cheville gauche", type: .multirowdatastr , tag: "tensionMultirow"),
    //
    //            Examen(intitule: "Index Pression Cheville (0,9<1,3)", type:  .donnee ,tag :"tension"),
    //
    //            ]
    //        catTA.examens=examCatTA
    //        return catTA
    //    }
    static var Pancartes:categorieExamen.Categorie {
        let catPancartes = categorieExamen.Categorie(nom:"Pancartes",namedImage: "thermo_icon.png",showNom: true)
        let examCatPancartes : [Examen] = [
            Check("Surveillance hémodynamique scopée"),
            Check("Surveillance température"),
            Check("Surveillance algique"),
            Examen(intitule: "Pancarte",type: .donnee , tag: "pancarteView"),
            Examen(intitule: "Ajout pancarte",type: .addinfo,tag: "pancarteV"),
            
            ]
        catPancartes.examens=examCatPancartes
        return catPancartes
    }
    
    
    //    static var Pancarte:categorieExamen.Categorie {
    //        let catPancarte = categorieExamen.Categorie(nom:"Pancarte",namedImage: "pancarte_icon.png",showNom: false)
    //        catPancarte.startLI()
    //        let examCatPancarte : [Examen] = [
    //            Examen(intitule: "horodatage", type:  .reponsecourte,tag: "date" ),
    //            Examen(intitule: "Commentaire", type:  .reponsecourte ),
    //
    //            Examen(intitule: "FC", type:  .donnee,tag: "FC" ),
    //            tensionMultirow,
    //            Examen(intitule: "Tension bras droit", type: .multirowdatastr , tag: "tensionMultirow"),
    //            Examen(intitule: "Tension bras gauche", type: .multirowdatastr , tag: "tensionMultirow"),
    //
    //            self.temperatureMultirow,
    //
    //            saO2("SaO2% AA"),
    //            saO2("Sao2% sous O2"),
    //
    //            Examen(intitule: "Fr. Resp", type:  .donnee ,tag: "fresp"),
    //            Examen(intitule: "EVA", type:  .donnee,tag: "EVA" ),
    //
    //            ]
    //
    //
    //        catPancarte.examens=examCatPancarte
    //        return catPancarte
    //    }
    //
    
    
    
    
    
    static var EntretienPatient:categorieExamen.Categorie {
        let catEntretienPatient = categorieExamen.Categorie(nom:"Entretien",namedImage: "tete_icon.png",showNom: false)
        let examCatEntretienPatient : [Examen] = [
            Examen(intitule: "entretien avec",
                datastr: [
                    "Entretien avec le patient",
                    "Entretien avec le patient et son entourage",
                    "Entretien avec l'entourage"
                    ].sort() ),
            Examen(intitule: "sujet discussion",
                datastr: [
                    "Compte rendu des examens reçus",
                    "Discussion sur les hypothèses diagnostiques",
                    "Discussion sur le devenir"
                    ].sort() ),
            Examen(intitule: "souhait patient",
                datastr: [
                    "souhaite des examens complémentaires",
                    "souhaite un avis spécialisé",
                    "difficulté pour le maintien à domicile",
                    "ne souhaite pas d'investigations supplémentaires",
                    "souhaiterait une hospitalisation",
                    "agacé par l'attente",
                    "ne souhaite pas l'hospitalisation",
                    "ne souhaite pas quitter le service",
                    "souhaiterait si possible un retour à domicile",
                    "souhaite un retour à domicile",
                    
                    ].sort() ),
            
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
            Check("2ième voie veineuse"),
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
            //       Examen(intitule: "Ajout pancarte",type: .addinfo,tag: "pancarte"),
            Examen(intitule: "Ajout évènement",type: .addinfo,tag: "evenementSuivi"),
            ]
        catSuiviEvolution.subitems.append("pancarte")
        catSuiviEvolution.examens=examCatSuiviEvolution
        return catSuiviEvolution
    }
    
    static var Radiographie:categorieExamen.Categorie {
        let catRadiographie = categorieExamen.Categorie(nom:"Radiographies",namedImage: "imagerie_icon.png",showNom: true)
        //catRadiographie.startLI()
        let examCatRadiographie : [Examen] = [
            regionAnat,
            ]
        catRadiographie.subitems.append("zone anatomique")
        catRadiographie.examens=examCatRadiographie
        return catRadiographie
    }
    static var ExamenGeneral:categorieExamen.Categorie {
        let catExamenGeneral = categorieExamen.Categorie(nom:"<br>Examen général",namedImage: "examenclinique.png",showNom: true)
        
        let examCatExamenGeneral : [Examen] = [
            self.Poids.asExamen(),
            Examen(intitule: "Communication", datastr: ["Communication normale","Pas de communication","Communication altérée","difficultés linguistiques","Refus de communication"].sort() ),
            //           neuroFonctionnel.asExamen(),
            //           OuiNon("Troubles du langage"),
            
            Check("Conscient, Orienté" ),
            OuiNon("Anxiété apparente"),
            Check("Non algique"),
            Check("Très algique"),
            OuiNon("Sueurs"),
            Examen(intitule: "coloration cutané", datastr: [
                "Coloration cutanée normale",
                "Paleur cutanéomuqueuse",
                "Cyanose des muqueuses labiales",
                "Mélanodermie",
                "Ictère cutanéomuqueux",
                "teint subictérique",
                "teint érythémateux",
                "teint grisatre",
                "marbrures"].sort() ),
            OuiNon("Pli cutanée"),
            OuiNon("Crampes"),
            OuiNon("Asthénie marquée"),
            
            
            self.Adenopathies.asExamen(),
            Examen(intitule: "Dernier repas", type:  .reponsecourte, tag: "date" ),
            
            
            self.OMS,
            self.Karnofsky,
            
            ]
        catExamenGeneral.examens=examCatExamenGeneral
        return catExamenGeneral
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
            Examen(intitule: "imagerie autre", datastr: [
                "Echographie abdominale",
                "Echo doppler des membres inférieurs",
                "Echographie pariétale",
                "Echographie pelvienne",
                "Echographie exploratrice",
                "TDM Crane","TDM abdominal","TDM thoracique","TDM Urologique","TDM Abdomino-pelvien","TDM thoraco-abdominal","TDM articulaire","Angioscanner","Scanner",
                "IRM Cérébrale","IRM médullaire","Electroencéphallogramme","Electromyographie"
                ].sort() ),
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
            OuiNon("Effet Shunt (PaO2+pCO2 < 120)"),
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
    static var Douleur:categorieExamen.Categorie {
        let catDouleur = categorieExamen.Categorie(nom:"<br>Douleur",namedImage: "<#image#>",showNom: true)
        let examCatDouleur = [
            
            Examen(intitule: "corps face", imageName: "corps femme front.png.map"),
            Examen(intitule: "corps face", imageName: "corps femme back.png.map"),
            Check("avec impotence fonctionnelle"),
            Examen(intitule: "EVA", type:  .donnee,tag: "EVA" )
            
        ]
        catDouleur.examens=examCatDouleur
        return catDouleur
    }
    
    static var PlainteAnamnèse:categorieExamen.Categorie {
        let catPlainteAnamnèse = categorieExamen.Categorie(nom:"Plaintes/Anamnèse",namedImage: "tete_icon.png",showNom: true)
        catPlainteAnamnèse.startLI()
        let examCatPlainteAnamnèse : [Examen] = [
            SignesGeneraux.asExamen(),
            Douleur.asExamen(),
            ExamTree.Plainte.asExamen(),
            
            
            OuiNon("Prise médicamenteuse"),
            TTT.asExamen(),
            
            ]
        catPlainteAnamnèse.subitems.append("Douleur")
        catPlainteAnamnèse.subitems.append("Plainte")
        catPlainteAnamnèse.subitems.append("TTT")
        catPlainteAnamnèse.examens=examCatPlainteAnamnèse
        return catPlainteAnamnèse
    }
    
    
    
    static var RespiratoireFonctionnel:categorieExamen.Categorie {
        let catRespiratoireFonctionnel = categorieExamen.Categorie(nom:"<br>Fonctionnel",namedImage: "pneumo_icon.png",showNom: true)
        catRespiratoireFonctionnel.startLI()
        let examCatRespiratoireFonctionnel : [Examen] = [
            Examen(intitule: "respiration", datastr: ["dyspnée au repos","dyspnée d'effort","eupnéïque","Dyspnée inspiratoire","dyspnée expiratoire"].sort() ),
            Check("anxiogène"),
            Check("Sifflante"),Check("Encombrement audible"),
            OuiNon("pincement des ailes du nez"),
            //  OuiNon("Toux"),
            Examen(intitule: "type toux", datastr: ["Pas de toux","toux sèche isolée","toux sèche quinteuse","toux positionnelle","toux productive"].sort() ),
            Examen(intitule: "expectorations", datastr: [" Pas d'expectorations","Expectorations d'aspect séreux (blanc, aéré)","Expectorations d'aspect muqueux (visqueux)","Expectorations muco-purulentes (jaune/ver)","Expectorations hémoptoïques"].sort() ),
            
            OuiNon("Difficultés à l'élocution"),
            //self.libre,
        ]
        catRespiratoireFonctionnel.examens=examCatRespiratoireFonctionnel
        return catRespiratoireFonctionnel
    }
    static var RespiratoireAuscultation:categorieExamen.Categorie {
        let catRespiratoireAuscultation = categorieExamen.Categorie(nom:"<br>Auscultation",namedImage: "stetho_icon.png",showNom: true)
        catRespiratoireAuscultation.startLI()
        let examCatRespiratoireAuscultation : [Examen] =  [
            Check("Murmure vésiculaire symétrique"),
            OuiNon("Râles sibilants"),
            OuiNon("Râles crépitants"),
            OuiNon("Râles sous-crépitants"),
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
            OuiNon("Cyanose unguéale"),
            OuiNon("Battements des ailes du nez"),
            OuiNon("Hypersudation"),
            OuiNon("Tirage"),
            Check("Signe de Campbell (descente inspiratoire du c. thyroïde)"),
            Check("Respiration de Cheyne-Stokes (RCS)"),
            Check("Respiration de Kussmaül (rapide profonde)"),
            Check("Respiration à lèvres pincées (pursed lips)"),
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
            Check("dyspnéisante"),
            Check("disparition au repos"),
            OuiNon("soulagement par la position penchée en avant"),
            OuiNon("modification par les mouvements respiratoires"),
            OuiNon("réveil à la palpation"),
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
            "Gauche","Droite",
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
            "Rachis cervical","Rachis cervicodorsal","os propre du nez","Rachis lombaire"
            ].sort()
        
        return Examen(intitule: "(région anatomique)", type: .datastr, tag: "dataStrregionAnat")
    }
    static func Accompagnant(intitule: String = "Accompagnant")-> Examen {
        //static var :Examen {
        
        Donnees.selectiontextDict["dataStrAccompagnant"]=[
            "Epoux(se)","Frère","Soeur","Mère","Père","Compagnon","Compagne","Parents","Grand-Parents","Collègues","Famille","Conjoint(e)","proches",
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