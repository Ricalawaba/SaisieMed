//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 08/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
import DropDown

// TODO: import/export fichier patient
// TODO: reduction taille des données sauvegardées non utilisés
// TODO: Alertes Bio, Examen, Autre
// TODO: Bug affichage image document après insertion
// TODO: Filtration HTML dans les enoncés/intitulés des celulles
// TODO: Restructuration examen cardiorespiratoire
// TODO: Nom celule du document et renommage plus human readable
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
struct RedColors {
    var colors:[UIColor] = []
    init() {
        for x in 0..<10 {
            colors += [UIColor(red: 50,green: (80+x*15),blue: 50)]
        }
        
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    // MARK: - Antécédents : liste initiale
    func setDefaultAtcd() {
        Donnees.selectiontextDict["atcd"] = [ "", "Accident Ischémique Transitoire (AIT)", "Accident vasculaire cérébral (AVC)", "Alcool", "Amputation membre inférieur", "Amygdalectomie", "Angor", "Appendicectomie", "Arret cardio-respiratoire", "Artériopathie", "Artérite", "Artéropâthie oblitérante des membres inférieurs", "Arthrose cervicale", "Arthrose lombaire", "Asthme", "Bronchopneumopathie obstructive", "Choc anaphylactique", "Cholecystite", "Cholécystectomie", "Colique hépatique", "Colique néphrétique", "Colites", "Coronaropathie", "Coxarthrose", "DNID", "Dents de sagesse", "Déchirure paroi abdominale", "Diabète insulino requérant", "Diabète type I", "Diverticulose sigmoidienne", "Eczéma", "Embolie pulmonaire", "Emphysème bronchique", "Entorse genou", "Epilepsie", "Extrasystoles", "Fibrillation auriculaire", "Fibrillation auriculaire paroxystique", "Fibrillation auriculaire permanente", "Fibroscopie gastrique", "Fissure anale", "Fracture humérus", "Gastrite", "Gonarthrose", "Hernie hiatale", "Hernie inguinale", "Hypercholestérolémie", "Hypertension artérielle", "Hypothyroïdie", "Infarctus myocardique", "Infection urinaire", "Insuffisance aortique", "Insuffisance cardiaque", "Insuffisance mitrale", "Insuffisance respiratoire", "Insuffisance rénale", "Insufisance veineuse des membres inférieurs", "Interruption volontaire grossesse", "Ischémie aigue des membres inférieurs", "Kyste ovarien", "Laser rétine", "Maladie d'alzheimer", "Maladie de Vaquez", "Maladie de parkinson", "Mélanome", "Méningite", "Néoplasie colique", "Néoplasie langue", "Néoplasie mammaire", "Néoplasie prostatique ", "Néoplasie pulmonaire", "Néoplasie rénale", "Néoplasique colique", "Néphrectomie", "Occlusion", "Oedeme aigue du poumon", "Pace-Maker", "Péritonite", "Phlegmon", "Pneumopathie", "Polyarteriopathie", "Polypes coliques", "Polypes utérins", "Pontage coronarien", "Prothèse de genou", "Prothèse de hanche", "Pyélonéphrite", "RGO", "Rectite hémorragique", "Retrécissement aortique", "Réduction mammaire", "Rétrécissement mitral", "Rhizarthrose", "Splénectomie", "Stent coronarien", "Stérilet", "Syndrome anxio-depressif", "Syndrome confusionnel", "Tabagisme", "Tablier abdominal", "Tendon d'Achille", "Tentative d'autolyse", "Thermocoagulation", "Thrombose veineuse profonde", "Trauma cranien grave", "Trauma épaule", "Traumatisme crânien grave", "Ulcère gastrique", "Urticaire", "Valvulopathie", "Varicectomie", ]
        Donnees.selectiontextDict["atcd"]=Donnees.selectiontextDict["atcd"]?.sorted()
    }
    // MARK: - Médicaments : liste initiale
    func setDefaultMedicament() {
        Donnees.selectiontextDict["medicament"] = [ "ABILIFY 5", "AMIODARONE 200", "AMLODIPINE 10", "AMLODIPINE 5", "AMLOR 5", "AVLOCARDYL 40", "AVLOCARDYL 40", "BACLOFENE 10", "BISOPROLOL 1,25", "BISOPROLOL 2,5", "BRICANYL 5mg/2ml", "CLONAZEPAM 2,5", "CO-APROVEL 150/12.5", "COUMADINE 2", "COUMADINE 5", "CRESTOR 20", "CYMBALTA 60", "DEPAKINE CHRONO 500", "DIFFU-K", "DIGOXINE 0,25", "DOLIPRANE 1000", "DOLIPRANE 500", "ESOMEPRAZOLE 20", "ESOMEPRAZOLE 40", "EUPRESSYL 60", "EZETROL", "FENOFIBRATE 300", "FIXICAL D3", "FLECAINE 100", "FLECAINE 100 LP", "FUROSEMIDE 20", "FUROSEMIDE 40", "FUROSEMIDE 500", "IRBESARTAN 150", "IRBESARTAN 300", "KARDEGIC 160", "KARDEGIC 75", "KEPRA 500", "LANTUS 100UI/ml", "LERCAN 20", "LEVOTHYROXINE 100", "LEVOTHYROXINE 125", "LEVOTHYROXINE 150", "LEVOTHYROXINE 25", "LEVOTHYROXINE 50", "LEVOTHYROXINE 75", "LOSARTAN 100", "METFORMINE 1000", "METFORMINE 500", "METFORMINE 850", "METOPROLOL 25", "MIANSERINE 30", "MONO-TILDIEM LP 200", "OMEPRAZOLE 10", "OMEPRAZOLE 20", "PANTOPRAZOLE 40", "PARACETAMOL 1000", "PARACETAMOL 500", "PAROXETINE 20", "PINAVERIUM 100", "PLAVIX 75", "PREVISCAN", "PROPRANOLOL 40", "RAMIPRIL 5", "SERESTA 10", "SERETIDE DISKUS 500", "SEROPLEX 20", "SIMVASTATINE 20", "SIMVASTATINE 40", "SPIRIVA 18", "STILNOX", "TAMSULOSINE 0,4", "TARDYFERON", "TRAMADOL 100 LP", "TRAMADOL 50", "TRINITRINE 5 patch", "XEROQUEL LP 50", "ZOPICLONE 7,5", ]   .sorted()
        
    }
    // MARK: - Motifs : liste initiale
    func setDefaultMotif() {
        Donnees.selectiontextDict["motif"] = [ "", "Accident de la voie publique", "Acouphènes", "Adénopathies", "Agression/Rixe", "Ait", "Altération de l'état général", "Amaurose transitoire", "Anorexie", "Anurie", "Aphasie", "Arret des matières et des gaz", "Aucun", "Brulures cutanées", "Brulures occulaires", "Brulures urinaires", "Certificat médical", "Cervicalgie", "Céphallée", "Chute de sa hauteur", "Chute en 2R", "Chute par maladresse", "Coxalgie", "Crise convulsive", "Crise d'angoisse", "Cruralgie", "Début brutal", "Désorientation temporospatiale", "Diarrhée", "Dorsalgie", "Douleur abdominale", "Douleur bras", "Douleur cervicale", "Douleur cheville", "Douleur cuisse", "Douleur dentaire", "Douleur epaule", "Douleur épigastrique", "Douleur fesse", "Douleur genou", "Douleur généralisée", "Douleur lombaire", "Douleur mollet", "Douleur pelvienne", "Douleur pharyngée", "Douleur poignet", "Douleur talon", "Douleur thoracique", "Dyspnée", "Epigastralgie", "Eruption cutanée", "Etat de faiblesse", "Frissons", "Gonalgie", "Gonalgie", "Hernie inguinale", "Hématurie", "Hyperthermie", "Infection urinaire", "Lombalgie", "Malaise", "Morsure de chat", "Morsure de chien", "Morsure de serpent", "Nausées", "Otalgie", "Palpitations", "Perte de connaissance", "Perte de poids", "Piqures d'insectes", "Plaie abdominale", "Plaie arcade", "Plaie avant-bras", "Plaie cuisse", "Plaie de la face", "Plaie de la main", "Plaie du crane", "Plaie abdominale","Plaie face","Plaie jambe","Plaie cuisse","Plaie doigt","Rachialgie",  "Rétention urinaire", "Sans perte de connaissance", "Scapulalgie", "Sciatalgie", "Sonde urinaire obstruée", "Surdité brusque", "Syndrome rhinopharyngée", "Tachycardie", "Talalgie", "Toux", "Trauma bassin", "Trauma cheville", "Trauma crânien", "Trauma epaule", "Trauma genou", "Trauma main", "Trauma poignet","Trauma coude", "Tremblements", "Troubles de l'appétit", "Troubles du langage", "Vertiges", "Vomissements", "d'aggravation progressive", ].sorted()
    }
    // MARK: - Localisation : liste initiale
    func setDefaultLocalisation() {
        Donnees.selectiontextDict["localisation"] = [
            "Bureau",
            "I.O.A",
            "Déchoc",
            "Degrav",
            "Suture",
            "Salle d'attente",
            "Box 1","Box 2","Box 3","Box 4","Box 5","Box 6","Box 7",
            "Box A","Box B","Box C","Box D","Box E", "Box F",
            "Ch 1F",
            "Ch 1P",
            "Ch 3",
            "Couloir"]
    }
    
    // MARK: - Etablissement : liste initiale
    func setDefaultEtablissement() {
        Donnees.selectiontextDict["etablissement"] = [ "CH Albi", "CH Castres", "CHU Purpan ( Toulouse)", "CHU Rangueuil (Toulouse)", "CHU Toulouse", "Canada", "Clin. Carrié (Auch)", "Clin. Claude Bernard (Albi)", "Clin. Escudié", "Clin. Pasteur ( Toulouse )", "Clin. Sidobre (Castres)", "Clin. St-Jean Languedoc (Toulouse)", "Clin. Toulouse-Lautrec (Albi)", "Clin. Union (Toulouse)", "Clin. des Cèdres (Toulouse)", "Clin. de l'Union (Toulouse)", "Clin. au Mans", ].sorted()
    }
    // MARK: - Medecin : liste initiale
    func setDefaultMedecin() {
        Donnees.selectiontextDict["medecin"] = [ " Médecin traitant", " Pas de médecin traitant", "Dr Adad", "Dr Alzieu (CCB)", "Dr Arhire Anca (Sidobre)", "Dr Arhire Andréi (Sidobre)", "Dr Avram", "Dr Berthoumieu", "Dr Baux D.", "Dr Bensoussan L-C.", "Dr Boige-Martin (Aussillon)", "Dr Boulanger-Rayssac (Sidobre)", "Dr Bouyssou", "Dr Castex B. (Roquecourbe)", "Dr Charles X.", "Dr Chatillon B.", "Dr Cuinat L. (CCB)", "Dr Dary (CCB)", "Dr De Germay (Union)", "Dr De la porte C. (Sidobre)", "Dr Eleftérion P. (Revel)", "Dr Farge P.", "Dr Fargues P. (Sidobre)", "Dr Gipoulou", "Dr Gorostis", "Dr Guiraud-Chaumeil (CCB)", "Dr Hacker (Sidobre)", "Dr Lafon-Cantié (Sidobre)", "Dr Laur D.", "Dr Lefèvre D.", "Dr Louis C.", "Dr Mariambourg G.", "Dr Marolda S.", "Dr Mezières J.", "Dr Moruzi M.", "Dr Moruzi S.", "Dr Mullens", "Dr Mylonas P.", "Dr Novas", "Dr Olivier C.", "Dr Pages F. (La crouzette)", "Dr Pages P. (CCB)", "Dr Paquié C.", "Dr Pascal", "Dr Peltier J.p", "Dr Pistre (Vabre)", "Dr Prudhomme L.", "Dr Puech C", "Dr Ramon J.p (Castres)", "Dr Rouzaud", "Dr Villacreces B.", "Dr Goutner", "Dr siget Martinez", ].sorted()
    }
    // MARK: - Posologie : liste initiale
    func setDefaultPosologie() {
        Donnees.selectiontextDict["posologie"] = [
            "au besoin", "à la demande", "par cure","1/j", "1/j 5/7j", "1x2/j", "1x3/j", "2x2/j", "2x3/j", "X/X/XV",  "¼/j", "¼x2/j", "¼x3/j", "½/j", "½x2/j", "½x3/j", "¾/j", "¾x2/j", "¾x3/j"
        ]
    }
    // MARK: - Posologie : liste initiale
    func setDefaultProfession() {
        Donnees.selectiontextDict["profession"] = [
            "sans emploi","Etudiant","Lycéen","Agent technique","Infimier(e)","Médecin","Boulanger","Batiments","Agriculteur"]
        
    }
    
    
    // MARK: - Posologie : liste initiale
    func setDefaultConclusionRx() {
        Donnees.selectiontextDict["ConclusionRx"] = [
            "Examen normal","Fracture","Epanchement","Encombrement"]
        
    }
    // MARK: - Posologie : liste initiale
    func setDefaultEvenement() {
        Donnees.selectiontextDict["Evenement"] = [
            "Antalgie acquise","Détérioration","Malaise","Vu par spécialiste"]
        
    }
    
    func setDefaultAllergie() {
        Donnees.selectiontextDict["Allergie"] = [
            "aspirine","pénicilline","iode","amoxicilline","tramadol","codéine","\"antibiotique\"","connerie humaine","acariens","graminés","poils de chiens","poils de chat","piqure d'hyménoptère","piqure de guèpe",
            "piqure d'abeille",
            
        ]
        
    }
    func setDefautTextDict() {
        Donnees.selectiontextDict["localisation"] = ["Bureau","I.O.A","Déchoc","Degrav","Suture","Salle d'attente","Box 1","Box 2","Box 3","Box 4","Box 5","Box 6","Box 7","Box A","Box B","Box C","Box D","Box E","Box F","Ch 1F","Ch 1P","Ch 3","Couloir", ]
        
        Donnees.selectiontextDict["ConclusionRx"] = ["Encombrement","Epanchement","Examen normal","Fracture","Pas de lésion visible", ]
        
        Donnees.selectiontextDict["etablissement"] = ["CH Albi","CH Castres","CHU Purpan ( Toulouse)","CHU Rangueuil (Toulouse)","CHU Toulouse","Canada","Clin. Carrié (Auch)","Clin. Claude Bernard (Albi)","Clin. Escudié","Clin. Pasteur ( Toulouse )","Clin. Sidobre (Castres)","Clin. St-Jean Languedoc (Toulouse)","Clin. Toulouse-Lautrec (Albi)","Clin. Union (Toulouse)","Clin. au Mans","Clin. de l'Union (Toulouse)","Clin. des Cèdres (Toulouse)","Venezuela", ]
        
        Donnees.selectiontextDict["dataStrZubrodOMS"] = ["Zubrod/OMS 0: capable d'une activité identique à celle précédant la maladie","Zubrod/OMS 1: activité physique diminuée, mais ambulatoire et capable de mener un travail","Zubrod/OMS 2: ambulatoire et capable de prendre soin de soi-même. Incapable de travailler et alité moins de 50% du temps","Zubrod/OMS 3: Capable seulement de quelques activités ou en chaise plus de 50% du temps","Zubrod/OMS 4: Incapable de prendre soin de soi-même. Alité ou en chaise en permanence", ]
        
        Donnees.selectiontextDict["Allergie"] = ["aspirine","pénicilline","iode","amoxicilline","tramadol","codéine","\"antibiotique\"","connerie humaine","acariens","graminés","poils de chiens","poils de chat","piqure d'hyménoptère","piqure de guèpe","piqure d'abeille", ]
        
        Donnees.selectiontextDict["motif"] = ["","Accident de la voie publique","Acouphènes","Adénopathies","Agression/Rixe","Ait","Altération de l'état général","Amaurose transitoire","Anorexie","Anurie","Aphasie","Arret des matières et des gaz","Asthénie","Aucun","Bradycardie","Brulures cutanées","Brulures occulaires","Brulures urinaires","Certificat médical","Cervicalgie","Céphallée","Chute de sa hauteur","Chute en 2R","Chute par maladresse","Coxalgie","Crise convulsive","Crise d'angoisse","Cruralgie","Début brutal","Décompensation cardiaque","Désorientation temporospatiale","Diarrhée","Dorsalgie","Douleur abdominale","Douleur bras","Douleur cervicale","Douleur cheville","Douleur cuisse","Douleur dentaire","Douleur epaule","Douleur épigastrique","Douleur fesse","Douleur genou","Douleur généralisée","Douleur lombaire","Douleur mollet","Douleur pelvienne","Douleur pharyngée","Douleur poignet","Douleur talon","Douleur thoracique","Dyspnée","Epigastralgie","Eruption cutanée","Etat de faiblesse","Frissons","Gonalgie","Gonalgie","Hernie inguinale","Hématurie","Hyperthermie","Infection urinaire","Lombalgie","Malaise","Metrorragie","Migraines","Morsure de chat","Morsure de chien","Morsure de serpent","Nausées","Otalgie","Palpitations","Perte de connaissance","Perte de poids","Piqures d'insectes","Plaie abdominale","Plaie abdominale","Plaie arcade","Plaie avant-bras","Plaie cuisse","Plaie cuisse","Plaie de la face","Plaie de la main","Plaie doigt","Plaie du crane","Plaie face","Plaie jambe","Rachialgie","Rétention urinaire","Sans perte de connaissance","Scapulalgie","Sciatalgie","Sonde urinaire obstruée","Surdité brusque","Syndrome rhinopharyngée","Tachycardie","Talalgie","Toux","Trauma bassin","Trauma cheville","Trauma coude","Trauma crânien","Trauma epaule","Trauma genou","Trauma main","Trauma poignet","Tremblements","Troubles de l'appétit","Troubles du langage","Vertiges","Vomissements","a déjà eu des symptômes similaires","d'aggravation progressive", ]
        
        Donnees.selectiontextDict["dataStrKarnofksy"] = ["Indice 100 : Normal ; aucune plainte, aucun signe de maladie.","Indice 90 : En mesure de poursuivre une activité normale ; signes ou symptômes mineurs de maladie.","Indice 80 : Activité normale, avec un effort ; quelques signes ou symptômes de maladie.","Indice 70 : Autonome ; incapable de poursuivre une activité normale ou de travailler de façon active.","Indice 60 : Nécessité occasionnelle d'assistance mais capacité de pourvoir à ses besoins essentiels.","Indice 50 : Nécessité d'aide considérable à la personne, soins médicaux fréquents.","Indice 40 : Invalide ; nécessité de soins et d'assistance spécifiques.","Indice 30 : Complètement invalide ; indication d'hospitalisation, pas de risque imminent de décès.","Indice 20 : Très malade ; hospitalisation nécessaire, traitement actif ou de support nécessaire.","Indice 10 : Moribond ; issue fatale proche.","Indice 0 : Décédé.", ]
        
        Donnees.selectiontextDict["medicament"] = ["ABILIFY 5","AMIODARONE 200","AMLODIPINE 10","AMLODIPINE 5","AMLOR 5","AVLOCARDYL 40","AVLOCARDYL 40","BACLOFENE 10","BETAHISTINE","BISOPROLOL 1,25","BISOPROLOL 2,5","BRICANYL 5mg/2ml","CLONAZEPAM 2,5","CO-APROVEL 150/12.5","COUMADINE 2","COUMADINE 5","CRESTOR 20","CYMBALTA 60","DAFLON 500","DALACINE 300","DEPAKINE CHRONO 500","DIFFU-K","DIGOXINE 0,25","DOLIPRANE 1000","DOLIPRANE 500","ESIDREX 25","ESOMEPRAZOLE 20","ESOMEPRAZOLE 40","EUPRESSYL 60","EZETROL","FENOFIBRATE 300","FIXICAL D3","FLAGYL 500","FLECAINE 100","FLECAINE 100 LP","FRACTAL","FUROSEMIDE 20","FUROSEMIDE 40","FUROSEMIDE 500","GLUCOPHAGE 1000","INFIRMIÈRE À DOMICILE","IRBESARTAN 150","IRBESARTAN 300","KARDEGIC 160","KARDEGIC 75","KEPRA 500","KINÉSITHÉRAPIE","LANTUS 100UI/ml","LERCAN 20","LEVOTHYROXINE 100","LEVOTHYROXINE 125","LEVOTHYROXINE 150","LEVOTHYROXINE 25","LEVOTHYROXINE 50","LEVOTHYROXINE 75","LOSARTAN 100","METFORMINE 1000","METFORMINE 500","METFORMINE 850","METOPROLOL 25","MIANSERINE 30","MONO-TILDIEM LP 200","OMEPRAZOLE 10","OMEPRAZOLE 20","PANTOPRAZOLE 40","PARACETAMOL 1000","PARACETAMOL 500","PAROXETINE 20","PINAVERIUM 100","PLAVIX 75","PREVISCAN","PROPRANOLOL 40","PROZAC 20","RAMIPRIL 5","RIFADINE","ROSUVASTATINE 10","SERESTA 10","SERESTA 50","SERETIDE DISKUS 500","SEROPLEX 20","SIMVASTATINE 20","SIMVASTATINE 40","SPIRIVA 18","STILNOX","TAMSULOSINE 0,4","TARDYFERON","TRAMADOL 100 LP","TRAMADOL 50","TRINITRINE 5 patch","XEROQUEL LP 50","ZOLPIDEM 10","ZOPICLONE 7,5", ]
        
        Donnees.selectiontextDict["medecin"] = [" Médecin traitant"," Pas de médecin traitant","Dr ASIN ( castres)","Dr Adad","Dr Albinet J.","Dr Alzieu (CCB)","Dr Arhire Anca (Sidobre)","Dr Arhire Andréi (Sidobre)","Dr Avram","Dr Baux D.","Dr Bensoussan L-C.","Dr Berthoumieu","Dr Boige-Martin (Aussillon)","Dr Boulanger-Rayssac (Sidobre)","Dr Bouyssou","Dr Castex B. (Roquecourbe)","Dr Charles X.","Dr Chatillon B.","Dr Cuinat L. (CCB)","Dr Dary (CCB)","Dr De Germay (Union)","Dr De la porte C. (Sidobre)","Dr Eleftérion P. (Revel)","Dr Farge P.","Dr Fargues P. (Sidobre)","Dr Gipoulou","Dr Girard J. ( Lagarrigue )","Dr Gorostis","Dr Goutner","Dr Guiraud-Chaumeil (CCB)","Dr Hacker (Sidobre)","Dr Lafon-Cantié (Sidobre)","Dr Laur D.","Dr Lefèvre D.","Dr Léger (castres)","Dr Louis C.","Dr Mariambourg G.","Dr Marolda S.","Dr Martin D. (Revel)","Dr Mezières J.","Dr Monod P. ( Castelnaudary )","Dr Monsarat","Dr Moruzi M.","Dr Moruzi S.","Dr Mullens","Dr Mylonas P.","Dr Novas","Dr Olivier C.","Dr Pages F. (La crouzette)","Dr Pages P. (CCB)","Dr Paquié C.","Dr Pascal","Dr Peltier J.p","Dr Pistre (Vabre)","Dr Prudhomme L.","Dr Puech C","Dr Ramon J.p (Castres)","Dr Rouzaud","Dr Sizaire (castres)","Dr Villacreces B.","Dr navas (castres)","Dr siget Martinez", ]
        
        Donnees.selectiontextDict["posologie"] = ["1/j","1/j 5/7j","1x2/j","1x3/j","2 le matin","2x2/j","2x3/j","X/X/XV","au besoin","à la demande","par cure","¼/j","¼x2/j","¼x3/j","½/j","½x2/j","½x3/j","¾/j","¾x2/j","¾x3/j", ]
        
        Donnees.selectiontextDict["libre"] = ["Avec difficultés à l'élocution","Durant un effort","Pas de modification électrique","Sans irradiation","Test", ]
        
        Donnees.selectiontextDict["Evenement"] = ["Antalgie acquise","Détérioration","Malaise","Vu par spécialiste", ]
        
        Donnees.selectiontextDict["atcd"] = ["","Accident Ischémique Transitoire (AIT)","Accident de la voie publique","Accident vasculaire cérébral (AVC)","Alcool","Amputation bras","Amputation membre inférieur","Amygdalectomie","Angor","Appendicectomie","Arret cardio-respiratoire","Artériopathie","Artérite","Artéropâthie oblitérante des membres inférieurs","Arthrose cervicale","Arthrose diffuse","Arthrose lombaire","Arythmie cardiaque","Asthme","Atcd familial de neoplasie mammaire","Bronchopneumopathie obstructive","Césarienne","Choc anaphylactique","Cholecystite","Cholécystectomie","Col ectopie","Colique hépatique","Colique néphrétique","Colites","Coronaropathie","Coxarthrose","DNID","Dents de sagesse","Déchirure paroi abdominale","Diabète insulino requérant","Diabète type I","Diverticulose sigmoidienne","Eczéma","Embolie pulmonaire","Emphysème bronchique","Endométriose","Endomyose","Entorse cheville","Entorse genou","Entorse poignet","Epilepsie","Extrasystoles","Électrocution","Fibrillation auriculaire","Fibrillation auriculaire paroxystique","Fibrillation auriculaire permanente","Fibromes utérins","Fibroscopie gastrique","Fissure anale","Fracture fémorale","Fracture humérus","Gastrite","Gonarthrose","Hernie hiatale","Hernie inguinale","Hydrocele","Hypercholestérolémie","Hypertension artérielle","Hypertriglyceridemie","Hypothyroïdie","Hystérectomie","Infarctus myocardique","Infection urinaire","Insuffisance aortique","Insuffisance cardiaque","Insuffisance mitrale","Insuffisance respiratoire","Insuffisance rénale","Insufisance veineuse des membres inférieurs","Interruption volontaire grossesse","Ischémie aigue des membres inférieurs","Kyste ovarien","Kyste testicule","Laser rétine","Maladie d'alzheimer","Maladie de Vaquez","Maladie de Verneuil","Maladie de parkinson","Mélanome","Méningite","Néoplasie colique","Néoplasie langue","Néoplasie mammaire","Néoplasie prostatique ","Néoplasie pulmonaire","Néoplasie rénale","Néoplasique colique","Néphrectomie","Occlusion","Oedeme aigue du poumon","Pace-Maker","Péritonite","Phlegmon","Pneumopathie","Polio","Polyarteriopathie","Polypes coliques","Polypes utérins","Pontage coronarien","Prothèse de genou","Prothèse de hanche","Pyélonéphrite","RGO","Rectite hémorragique","Retrécissement aortique","Réduction mammaire","Rétrécissement mitral","Rhizarthrose","Splénectomie","Stent coronarien","Stérilet","Syndrome anxio-depressif","Syndrome confusionnel","Tabagisme","Tablier abdominal","Tendon d'Achille","Tentative d'autolyse","Thermocoagulation","Thrombose veineuse profonde","Trauma cranien grave","Trauma épaule","Traumatisme crânien grave","Ulcère gastrique","Urticaire","Valvulopathie","Varicectomie", ]
        
        
        
        Donnees.selectiontextDict["profession"] = ["Agent technique","Agriculteur","Batiments","Boulanger","Etudiant","Infimier(e)","Lycéen","Magasinier","Médecin","Retraité","Travaux public","sans emploi", ]
    }
    func configImageMapped() {
        //  var imagesMap:[String:MappedImage]=[:]
        // let souffleMap=MappedImage(name: "", regionsMain: <#T##[MappedImage.region]#>, imagefilename: <#T##String#>)
        let imageFilenames=["fracture_femur.png","Souffle cardiaque - Arbre décisionnel.png","douleur_thoracique.png","mobilite_epaule.png","fracture_sup_humerus.png","fractures métacarpe.png","corps femme back.png","corps femme front.png","dermatomes.png","veines mb inf.png","pied.png","thorax.png","cheville_ottawa.png"]
        for imgfilename in imageFilenames {
            let imageMap=MappedImage()
            imageMap.imageFileName=imgfilename
            
            imageMap.name=imgfilename.stringByAppendingPathExtension("map")
            switch imgfilename {
            case "douleur_thoracique.png":
                // imageMap.regionsMain.append(<#T##newElement: Element##Element#>)
                imageMap.regionsMain.append(MappedImage.region(name: "douleur précordiale", bounds: CGRect(x: 189.897391113889, y: 157.494264852392, width: 139.408799032022, height: 25.6210765788581)))
                imageMap.regionsMain.append(MappedImage.region(name: "douleur rétrosternale", bounds: CGRect(x: 359.448633179862, y: 152.219337321451, width: 250.182277181791, height: 42.9529813233797)))
                imageMap.regionsMain.append(MappedImage.region(name: "douleur basithoracique", bounds: CGRect(x: 623.948570802779, y: 161.262070231636, width: 162.769192383334, height: 36.1709316407408)))
                imageMap.regionsMain.append(MappedImage.region(name: "intense", bounds: CGRect(x: 152.134548958451, y: 205.029011344668, width: 76.5710312638563, height: 31.2329206470993)))
                imageMap.regionsMain.append(MappedImage.region(name: "violente", bounds: CGRect(x: 271.021150131281, y: 204.525254560037, width: 75.0597609099644, height: 26.6991095854236)))
                imageMap.regionsMain.append(MappedImage.region(name: "angoissante", bounds: CGRect(x: 399.982886996723, y: 210.570335975605, width: 163.217198220325, height: 48.8644081091714)))
                imageMap.regionsMain.append(MappedImage.region(name: "sourde", bounds: CGRect(x: 634.733548634598, y: 199.487686713731, width: 139.036872558055, height: 79.59357197164)))
                imageMap.regionsMain.append(MappedImage.region(name: "en coup de poignard", bounds: CGRect(x: 158.683387158649, y: 298.727773285966, width: 180.344928897767, height: 68.5109227097661)))
                imageMap.regionsMain.append(MappedImage.region(name: "constrictive en étau", bounds: CGRect(x: 370.261236703515, y: 301.246557209119, width: 220.645471668217, height: 72.0372202021805)))
                imageMap.regionsMain.append(MappedImage.region(name: "déchirure", bounds: CGRect(x: 806.010855409013, y: 299.735286855227, width: 138.533115773424, height: 72.0372202021805)))
                imageMap.regionsMain.append(MappedImage.region(name: "sans irradiation", bounds: CGRect(x: 188.908794236487, y: 391.922778442633, width: 151.12703538919, height: 61.9620845095678)))
                imageMap.regionsMain.append(MappedImage.region(name: "machoires", bounds: CGRect(x: 394.441562365786, y: 389.90775130411, width: 97.7288162183429, height: 26.6991095854236)))
                imageMap.regionsMain.append(MappedImage.region(name: "épaules", bounds: CGRect(x: 502.749271061372, y: 388.900237734849, width: 74.0522473407031, height: 18.6390010313334)))
                imageMap.regionsMain.append(MappedImage.region(name: "bras", bounds: CGRect(x: 469.50132327575, y: 419.125644812687, width: 44.8343538321264, height: 16.1202171081803)))
                imageMap.regionsMain.append(MappedImage.region(name: "transfixiante", bounds: CGRect(x: 820.619802163302, y: 391.922778442633, width: 115.864060465046, height: 20.654028169856)))
                imageMap.regionsMain.append(MappedImage.region(name: "mobile descendante", bounds: CGRect(x: 815.078477532365, y: 435.749618705498, width: 131.984277573226, height: 25.6915960161623)))
                imageMap.regionsMain.append(MappedImage.region(name: "survenue spontannée", bounds: CGRect(x: 192.938848513533, y: 477.05767504521, width: 121.909141880613, height: 20.1502713852253)))
                imageMap.regionsMain.append(MappedImage.region(name: "survenue à l'effort", bounds: CGRect(x: 441.290943336435, y: 478.568945399102, width: 94.2025187259283, height: 28.2103799393155)))
                imageMap.regionsMain.append(MappedImage.region(name: "augmentée à l'inspiration", bounds: CGRect(x: 172.284820343677, y: 509.801866046201, width: 119.894114742091, height: 35.766731708775)))
                imageMap.regionsMain.append(MappedImage.region(name: "augmenté en position allongé", bounds: CGRect(x: 160.0, y: 550.0, width: 183.871226390181, height: 22.1652985237479)))
                imageMap.regionsMain.append(MappedImage.region(name: "augmenté par la respiration et la toux", bounds: CGRect(x: 638.259846127012, y: 507.283082123048, width: 140.044386127316, height: 63.4733548634598)))
                imageMap.regionsMain.append(MappedImage.region(name: "diminué par la position penché en avant", bounds: CGRect(x: 150.119521819929, y: 661.936415004652, width: 183.367469605551, height: 42.3155699089732)))
                imageMap.regionsMain.append(MappedImage.region(name: "diminué au repos", bounds: CGRect(x: 407.035481981552, y: 661.936415004652, width: 166.239738928109, height: 20.6540281698559)))
                imageMap.regionsMain.append(MappedImage.region(name: "cède sous derivés nitrés", bounds: CGRect(x: 447.839781536633, y: 688.635524590076, width: 89.6687076642527, height: 17.1277306774415)))
                imageMap.regionsMain.append(MappedImage.region(name: "pas de position antalgique", bounds: CGRect(x: 632.718521496075, y: 662.440171789283, width: 306.787881840056, height: 40.8042995550813)))
                imageMap.regionsMain.append(MappedImage.region(name: "punctiforme bien localisée", bounds: CGRect(x: 627.683423606481, y: 294.660951737321, width: 155.113972707005, height: 78.390932443325)))
                imageMap.regionsMain.append(MappedImage.region(name: "sans irradiation", bounds: CGRect(x: 634.910956384944, y: 391.954662216625, width: 135.655230611144, height: 52.816585688765)))
                break
            case "Souffle cardiaque - Arbre décisionnel.png":
                imageMap.regionsMain.append(MappedImage.region(name: "souffle cardiaque", bounds: CGRect(x: 393.815104166667, y: 177.44140625, width: 321.940104166667, height: 66.6341145833333)))
                imageMap.regionsMain.append(MappedImage.region(name: "systolique", bounds: CGRect(x: 110.807291666667, y: 350.390625, width: 246.321614583333, height: 65.1367187499999)))
                imageMap.regionsMain.append(MappedImage.region(name: "systolo-diastolique", bounds: CGRect(x: 429.752604166667, y: 351.139322916667, width: 285.25390625, height: 52.4088541666666)))
                imageMap.regionsMain.append(MappedImage.region(name: "diastolique", bounds: CGRect(x: 763.671875, y: 345.149739583333, width: 238.834635416667, height: 67.3828125)))
                imageMap.regionsMain.append(MappedImage.region(name: "timbre", bounds: CGRect(x: 444.0, y: 932.0, width: 272.5, height: 55.5)))
                imageMap.regionsMain.append(MappedImage.region(name: "dur et rapeux", bounds: CGRect(x: 131.5, y: 1043.5, width: 226.0, height: 42.5)))
                imageMap.regionsMain.append(MappedImage.region(name: "doux et en jet de vapeur", bounds: CGRect(x: 134.0, y: 1143.0, width: 209.0, height: 77.0)))
                imageMap.regionsMain.append(MappedImage.region(name: "doux et aspiratif", bounds: CGRect(x: 794.5, y: 1047.5, width: 234.5, height: 49.0)))
                imageMap.regionsMain.append(MappedImage.region(name: "roulement ( grondement )", bounds: CGRect(x: 797.0, y: 1134.0, width: 228.0, height: 79.5)))
                imageMap.regionsMain.append(MappedImage.region(name: "foyer tricuspidien", bounds: CGRect(x: 199.0, y: 611.5, width: 24.5, height: 28.0)))
                imageMap.regionsMain.append(MappedImage.region(name: "foyer aortique", bounds: CGRect(x: 170.0, y: 563.0, width: 35.0, height: 16.5)))
                imageMap.regionsMain.append(MappedImage.region(name: "foyer pulmonaire", bounds: CGRect(x: 218.5, y: 550.5, width: 23.0, height: 36.0)))
                imageMap.regionsMain.append(MappedImage.region(name: "foyer mitral", bounds: CGRect(x: 246.5, y: 598.5, width: 30.0, height: 51.5)))
            case "fracture_femur.png":
                imageMap.regionsMain.append(MappedImage.region(name: "fracture cervico-trochantérienne", bounds: CGRect(x: 369.0, y: 120.0, width: 403.234, height: 22.5156)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture per-trochantérienne", bounds: CGRect(x: 368.438, y: 159.656, width: 367.414, height: 27.6328)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture sous-trochantérienne", bounds: CGRect(x: 371.508, y: 207.758, width: 372.531, height: 21.4922)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture tronchantéro-diaphysaire", bounds: CGRect(x: 370.0, y: 247.0, width: 401.188, height: 23.5391)))
            case "fracture_sup_humerus.png":
                imageMap.regionsMain.append(MappedImage.region(name: "fracture du col anatomique", bounds: CGRect(x: 128.262, y: 89.7832, width: 149.25, height: 150.416)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture du col chirurgical", bounds: CGRect(x: 12.8262, y: 250.693, width: 264.686, height: 145.752)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture de la grosse tubérosité", bounds: CGRect(x: 12.8262, y: 406.939, width: 415.102, height: 148.084)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture de la petite tubérosité", bounds: CGRect(x: 11.6601, y: 562.02, width: 417.434, height: 148.084)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture luxation antérieure", bounds: CGRect(x: 125.93, y: 715.934, width: 610.992, height: 150.416)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture luxation postérieure", bounds: CGRect(x: 129.428, y: 876.844, width: 608.66, height: 145.752)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture comminutive tête humérale", bounds: CGRect(x: 15.1582, y: 1034.26, width: 726.428, height: 143.42)))
            case "fractures métacarpe.png":
                imageMap.regionsMain.append(MappedImage.region(name: "fracture diaphysaire transversale", bounds: CGRect(x: 222.656, y: 450.0, width: 126.562, height: 522.656)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture diaphysaire oblique", bounds: CGRect(x: 431.25, y: 433.594, width: 117.188, height: 539.062)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture dipahysaire spiroïde", bounds: CGRect(x: 614.062, y: 433.594, width: 82.0312, height: 543.75)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture métaphysaire proximale", bounds: CGRect(x: 782.812, y: 445.312, width: 91.4062, height: 532.031)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture métaphysaire distale", bounds: CGRect(x: 965.625, y: 450.0, width: 126.562, height: 522.656)))
                imageMap.regionsMain.append(MappedImage.region(name: "fracture comminutive", bounds: CGRect(x: 1164.84, y: 431.25, width: 98.4375, height: 550.781)))
            case "corps femme back.png":
                imageMap.regionsMain.append(MappedImage.region(name: "fesse gauche", bounds: CGRect(x: 179.8857421875, y: 795.4189453125, width: 144.0791015625, height: 178.1806640625)))
                imageMap.regionsMain.append(MappedImage.region(name: "fesse droite", bounds: CGRect(x: 340.1630859375, y: 768.1376953125, width: 138.9638671875, height: 204.609375)))
                imageMap.regionsMain.append(MappedImage.region(name: "scapulaire gauche", bounds: CGRect(x: 171.3603515625, y: 343.5732421875, width: 124.470703125, height: 184.1484375)))
                imageMap.regionsMain.append(MappedImage.region(name: "scapulaire droite", bounds: CGRect(x: 362.3291015625, y: 353.8037109375, width: 96.3369140625, height: 158.572265625)))
                imageMap.regionsMain.append(MappedImage.region(name: "cervical", bounds: CGRect(x: 279.283308931186, y: 264.584187408492, width: 104.172035139092, height: 56.2401171303075)))
                imageMap.regionsMain.append(MappedImage.region(name: "dorsal", bounds: CGRect(x: 299.095168374817, y: 328.493411420205, width: 54.322840409956, height: 254.358711566618)))
                imageMap.regionsMain.append(MappedImage.region(name: "basithoracique postérieur gauche", bounds: CGRect(x: 187.893118594436, y: 537.476573938507, width: 105.450219619327, height: 38.9846266471449)))
                imageMap.regionsMain.append(MappedImage.region(name: "basithoracique postérieur droit", bounds: CGRect(x: 361.087115666179, y: 529.168374816984, width: 84.9992679355784, height: 47.9319180087848)))
                imageMap.regionsMain.append(MappedImage.region(name: "fosse lombaire gauche", bounds: CGRect(x: 201.953147877013, y: 600.746705710102, width: 86.2774524158126, height: 59.4355783308931)))
                imageMap.regionsMain.append(MappedImage.region(name: "fosse lombaire droite", bounds: CGRect(x: 354.696193265007, y: 603.303074670571, width: 61.3528550512445, height: 60.7137628111274)))
                imageMap.regionsMain.append(MappedImage.region(name: "lombaire", bounds: CGRect(x: 291.426061493411, y: 692.136896046852, width: 74.1346998535871, height: 54.3228404099561)))
                imageMap.regionsMain.append(MappedImage.region(name: "axillaire gauche", bounds: CGRect(x: 209.622254758419, y: 1241.11713030747, width: 103.532942898975, height: 60.7137628111275)))
                imageMap.regionsMain.append(MappedImage.region(name: "axillaire droit", bounds: CGRect(x: 341.275256222547, y: 1244.95168374817, width: 93.3074670571011, height: 48.571010248902)))
                imageMap.regionsMain.append(MappedImage.region(name: "mollet gauche", bounds: CGRect(x: 212.817715959004, y: 1336.98096632504, width: 88.194729136164, height: 178.945827232797)))
                imageMap.regionsMain.append(MappedImage.region(name: "mollet droit", bounds: CGRect(x: 334.245241581259, y: 1343.37188872621, width: 77.96925329429, height: 143.156661786237)))
                imageMap.regionsMain.append(MappedImage.region(name: "talon gauche", bounds: CGRect(x: 258.193265007321, y: 1607.9560761347, width: 48.571010248902, height: 40.9019033674963)))
                imageMap.regionsMain.append(MappedImage.region(name: "talon droit", bounds: CGRect(x: 325.297950219619, y: 1613.06881405564, width: 40.2628111273792, height: 28.1200585651538)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon d'achille gauche", bounds: CGRect(x: 256.915080527086, y: 1554.91142020498, width: 37.0673499267936, height: 36.4282576866763)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon d'achille droit", bounds: CGRect(x: 339.357979502196, y: 1562.58052708638, width: 25.5636896046851, height: 20.4509516837481)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon d'achille droit", bounds: CGRect(x: 329.771595900439, y: 1551.07686676428, width: 47.2928257686676, height: 42.8191800878478)))
                imageMap.regionsMain.append(MappedImage.region(name: "plante du pied droit", bounds: CGRect(x: 246.689604685212, y: 1657.80527086384, width: 52.4055636896047, height: 47.2928257686676)))
                imageMap.regionsMain.append(MappedImage.region(name: "plante du pied droit", bounds: CGRect(x: 324.019765739385, y: 1672.50439238653, width: 65.1874084919473, height: 32.5937042459736)))
            case "corps femme front.png":
                //Regions:
                imageMap.regionsMain.append(MappedImage.region(name: "oeil droit", bounds: CGRect(x: 265.606187862026, y: 101.586430417349, width: 23.2802236373091, height: 53.9677911592164)))
                imageMap.regionsMain.append(MappedImage.region(name: "oeil gauche", bounds: CGRect(x: 320.984901665928, y: 112.168350252489, width: 41.6222180182193, height: 35.2730661171349)))
                imageMap.regionsMain.append(MappedImage.region(name: "nez", bounds: CGRect(x: 295.941024722762, y: 148.499608353138, width: 21.5165703314523, height: 29.6293755383933)))
                imageMap.regionsMain.append(MappedImage.region(name: "lèvres", bounds: CGRect(x: 276.893569019509, y: 195.765516950099, width: 58.5532897544441, height: 22.222031653795)))
                imageMap.regionsMain.append(MappedImage.region(name: "menton", bounds: CGRect(x: 283.948182242936, y: 224.68943116615, width: 52.556868514531, height: 28.9239142160506)))
                imageMap.regionsMain.append(MappedImage.region(name: "oreille droite", bounds: CGRect(x: 232.802236373091, y: 127.688499344028, width: 19.0474557032529, height: 51.1459458698457)))
                imageMap.regionsMain.append(MappedImage.region(name: "oreille gauche", bounds: CGRect(x: 359.538191420372, y: 134.743112567455, width: 20.0, height: 46.9131779357895)))
                imageMap.regionsMain.append(MappedImage.region(name: "épaule droite", bounds: CGRect(x: 102.997353062034, y: 323.454016294127, width: 86.0662813258093, height: 75.8370921518401)))
                imageMap.regionsMain.append(MappedImage.region(name: "épaule gauche", bounds: CGRect(x: 419.044025471563, y: 305.464752574389, width: 98.7645851279778, height: 102.644622400863)))
                imageMap.regionsMain.append(MappedImage.region(name: "Cou", bounds: CGRect(x: 258.674231332357, y: 248.052342606149, width: 103.094802342606, height: 56.2335285505125)))
                imageMap.regionsMain.append(MappedImage.region(name: "thoracique gauche", bounds: CGRect(x: 335.526720351391, y: 340.525256222548, width: 78.1021229868228, height: 66.2306002928258)))
                imageMap.regionsMain.append(MappedImage.region(name: "thoracique droit", bounds: CGRect(x: 194.94289897511, y: 345.523792093704, width: 77.4773060029283, height: 55.6087115666179)))
                
                imageMap.regionsMain.append(MappedImage.region(name: "sein droit", bounds: CGRect(x: 185.889058437301, y: 415.163988198678, width: 107.23012099609, height: 94.1790865327503)))
                imageMap.regionsMain.append(MappedImage.region(name: "sein gauche", bounds: CGRect(x: 335.799589435125, y: 415.163988198678, width: 111.462888930146, height: 92.4154332268936)))
                imageMap.regionsMain.append(MappedImage.region(name: "bras droit", bounds: CGRect(x: 102.644622400863, y: 391.178303239026, width: 61.3751350438148, height: 182.361751825588)))
                imageMap.regionsMain.append(MappedImage.region(name: "bras gauche", bounds: CGRect(x: 444.793363737072, y: 368.250810262889, width: 79.0116681023822, height: 153.437837609537)))
                imageMap.regionsMain.append(MappedImage.region(name: "coude droit", bounds: CGRect(x: 78.3062067800395, y: 565.779980518844, width: 90.6517799210368, height: 77.2480147965255)))
                imageMap.regionsMain.append(MappedImage.region(name: "avant bras droit", bounds: CGRect(x: 74.0734388459834, y: 651.140800522311, width: 58.9060204156153, height: 190.474557032529)))
                imageMap.regionsMain.append(MappedImage.region(name: "coude gauche", bounds: CGRect(x: 456.433475555726, y: 600.700315974808, width: 87.1244733093233, height: 42.327679340562)))
                imageMap.regionsMain.append(MappedImage.region(name: "avant-bras gauche", bounds: CGRect(x: 468.073587374381, y: 658.548144406909, width: 74.4261695071546, height: 150.615992320166)))
                imageMap.regionsMain.append(MappedImage.region(name: "poignet droit", bounds: CGRect(x: 62.4333270273288, y: 823.626093835101, width: 74.0734388459834, height: 45.5022552911041)))
                imageMap.regionsMain.append(MappedImage.region(name: "poignet gauche", bounds: CGRect(x: 486.107613469985, y: 851.625549048316, width: 83.1006588579795, height: 33.7401171303075)))
                imageMap.regionsMain.append(MappedImage.region(name: "hanche droite", bounds: CGRect(x: 156.259682898908, y: 821.156979206901, width: 107.935582318433, height: 113.932003558346)))
                imageMap.regionsMain.append(MappedImage.region(name: "hanche gauche", bounds: CGRect(x: 387.386530014641, y: 849.126281112738, width: 80.6013909224012, height: 77.4773060029282)))
                imageMap.regionsMain.append(MappedImage.region(name: "organes genitaux", bounds: CGRect(x: 279.71541430888, y: 897.346802019913, width: 53.9677911592164, height: 59.2587510767867)))
                imageMap.regionsMain.append(MappedImage.region(name: "epigastrique", bounds: CGRect(x: 283.925319520494, y: 549.594865535439, width: 79.7489053137089, height: 92.2396977122417)))
                imageMap.regionsMain.append(MappedImage.region(name: "hypochondre droit", bounds: CGRect(x: 204.656829299036, y: 560.163997564967, width: 80.2293204059601, height: 74.464339298945)))
                imageMap.regionsMain.append(MappedImage.region(name: "flanc droit", bounds: CGRect(x: 203.049045995781, y: 646.211646383399, width: 67.683015331927, height: 87.4238948037391)))
                imageMap.regionsMain.append(MappedImage.region(name: "flanc gauche", bounds: CGRect(x: 364.601957591631, y: 653.866273117367, width: 80.1721431610326, height: 87.0210197124775)))
                imageMap.regionsMain.append(MappedImage.region(name: "genou droit", bounds: CGRect(x: 201.116666489456, y: 1182.83869952274, width: 100.984427877121, height: 104.393184936264)))
                imageMap.regionsMain.append(MappedImage.region(name: "genou gauche", bounds: CGRect(x: 324.258015251009, y: 1171.76023908052, width: 103.967090303871, height: 105.24537420105)))
                imageMap.regionsMain.append(MappedImage.region(name: "jambe droite", bounds: CGRect(x: 210.490748402101, y: 1297.88425026882, width: 87.3493996405478, height: 217.73435715278)))
                imageMap.regionsMain.append(MappedImage.region(name: "jambe gauche", bounds: CGRect(x: 332.353813266475, y: 1302.57129122514, width: 82.2362640518328, height: 203.247139651421)))
                imageMap.regionsMain.append(MappedImage.region(name: "cheville droite", bounds: CGRect(x: 252.248022376606, y: 1552.68884043979, width: 63.0620055941515, height: 43.4616525040774)))
                imageMap.regionsMain.append(MappedImage.region(name: "cheville gauche", bounds: CGRect(x: 343.006179076297, y: 1553.96712433697, width: 62.6359109617587, height: 43.4616525040774)))
                imageMap.regionsMain.append(MappedImage.region(name: "pied droit", bounds: CGRect(x: 231.795480021746, y: 1634.92510449162, width: 65.618573388509, height: 63.9141948589374)))
                imageMap.regionsMain.append(MappedImage.region(name: "pied gauche", bounds: CGRect(x: 351.954166356549, y: 1628.95977963812, width: 82.6623586842258, height: 62.2098163293656)))
                imageMap.regionsMain.append(MappedImage.region(name: "fosse iliaque droite", bounds: CGRect(x: 185.540497436517, y: 741.681314882244, width: 94.2122733097342, height: 71.620554709951)))
                imageMap.regionsMain.append(MappedImage.region(name: "fosse iliaque gauche", bounds: CGRect(x: 361.144216691069, y: 767.900073206442, width: 81.8510248901904, height: 67.4802342606149)))
                
                imageMap.regionsMain.append(MappedImage.region(name: "hypogastre", bounds: CGRect(x: 280.714120473902, y: 818.589293094272, width: 66.8138060716992, height: 71.1398798461258)))
                imageMap.regionsMain.append(MappedImage.region(name: "main droite", bounds: CGRect(x: 47.5868115186923, y: 882.038375119195, width: 81.2340519864545, height: 56.2389590675454)))
                imageMap.regionsMain.append(MappedImage.region(name: "main gauche", bounds: CGRect(x: 494.133760012279, y: 890.209847804223, width: 72.1012295737762, height: 47.5868115186923)))
                imageMap.regionsMain.append(MappedImage.region(name: "cuisse droite", bounds: CGRect(x: 171.120251521762, y: 959.427028195048, width: 122.572090275419, height: 171.600926385587)))
                imageMap.regionsMain.append(MappedImage.region(name: "cuisse gauche", bounds: CGRect(x: 335.511054949972, y: 977.692673020405, width: 104.306445450063, height: 157.661355334657)))
                imageMap.regionsMain.append(MappedImage.region(name: "rétrosternal", bounds: CGRect(x: 278.043557833089, y: 346.148609077599, width: 48.1109077598829, height: 55.6087115666178)))
                imageMap.regionsMain.append(MappedImage.region(name: "périombilical", bounds: CGRect(x: 285.541361639824, y: 669.803806734993, width: 58.1079795021963, height: 66.8554172767203)))
                imageMap.regionsMain.append(MappedImage.region(name: "abdominale", bounds: CGRect(x: 281.940084850197, y: 737.947526433994, width: 74.7754138080958, height: 72.9366741242902)))
            case "dermatomes.png":
                imageMap.regionsMain.append(MappedImage.region(name: "Dysesthésie", bounds: CGRect(x: 667.390625, y: 103.0390625, width: 166.375, height: 30.25)))
                imageMap.regionsMain.append(MappedImage.region(name: "Hypoesthésie", bounds: CGRect(x: 669.28125, y: 133.2890625, width: 168.265625, height: 23.6328125)))
                imageMap.regionsMain.append(MappedImage.region(name: "hyperesthésie", bounds: CGRect(x: 670.2265625, y: 158.8125, width: 177.71875, height: 26.46875)))
                imageMap.regionsMain.append(MappedImage.region(name: "Anesthésie", bounds: CGRect(x: 671.171875, y: 186.2265625, width: 140.8515625, height: 19.8515625)))
                imageMap.regionsMain.append(MappedImage.region(name: "branche V1 du trijumeau droit", bounds: CGRect(x: 356.022951432621, y: 48.7113897332358, width: 65.1873009665362, height: 64.470956999871)))
                imageMap.regionsMain.append(MappedImage.region(name: "branche V1 du trijumeau gauche", bounds: CGRect(x: 423.717456282485, y: 56.949345349886, width: 41.5479500665836, height: 50.1440776665663)))
                imageMap.regionsMain.append(MappedImage.region(name: "Branche V2 du trujumeau droit", bounds: CGRect(x: 364.890625, y: 138.9609375, width: 31.1953125, height: 40.6484375)))
                imageMap.regionsMain.append(MappedImage.region(name: "branche V2 du trijumeau gauche", bounds: CGRect(x: 425.390625, y: 137.0703125, width: 17.9609375, height: 33.0859375)))
                imageMap.regionsMain.append(MappedImage.region(name: "Branche V3 du trijumeau droit", bounds: CGRect(x: 362.0546875, y: 185.28125, width: 36.8671875, height: 38.7578125)))
                imageMap.regionsMain.append(MappedImage.region(name: "Branche V3 du trijumeau gauche", bounds: CGRect(x: 417.828125, y: 185.28125, width: 29.3046875, height: 28.359375)))
                imageMap.regionsMain.append(MappedImage.region(name: "Nerf trijumeau", bounds: CGRect(x: 64.28125, y: 146.5234375, width: 164.484375, height: 32.140625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C2 droit", bounds: CGRect(x: 361.109375, y: 218.3671875, width: 46.3203125, height: 38.7578125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C2 gauche", bounds: CGRect(x: 424.4453125, y: 219.3125, width: 34.9765625, height: 19.8515625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C3 droit", bounds: CGRect(x: 311.0078125, y: 263.7421875, width: 88.859375, height: 20.796875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C3 gauche", bounds: CGRect(x: 421.609375, y: 261.8515625, width: 89.8046875, height: 17.9609375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C4 droit", bounds: CGRect(x: 242.9453125, y: 293.9921875, width: 164.484375, height: 28.359375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C4 gauche", bounds: CGRect(x: 428.2265625, y: 293.9921875, width: 161.6484375, height: 34.9765625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C5 droit", bounds: CGRect(x: 214.5859375, y: 334.640625, width: 34.9765625, height: 49.15625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C5 gauche", bounds: CGRect(x: 569.078125, y: 335.5859375, width: 38.7578125, height: 62.390625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D2 droit", bounds: CGRect(x: 282.6484375, y: 345.984375, width: 116.2734375, height: 26.46875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D2 gauche", bounds: CGRect(x: 430.1171875, y: 342.203125, width: 125.7265625, height: 45.375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D3 droit", bounds: CGRect(x: 294.9375, y: 389.46875, width: 100.203125, height: 41.59375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D3 gauche", bounds: CGRect(x: 432.0078125, y: 388.5234375, width: 103.0390625, height: 46.3203125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D4 droit", bounds: CGRect(x: 295.8828125, y: 438.625, width: 106.8203125, height: 43.484375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D4 gauche", bounds: CGRect(x: 433.8984375, y: 437.6796875, width: 104.9296875, height: 40.6484375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D5 droit", bounds: CGRect(x: 288.3203125, y: 485.890625, width: 111.546875, height: 28.3593749999999)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D5 gauche", bounds: CGRect(x: 434.84375, y: 486.8359375, width: 100.203125, height: 30.2499999999999)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D6 droit", bounds: CGRect(x: 294.9375, y: 518.03125, width: 103.0390625, height: 32.140625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D6 gauche", bounds: CGRect(x: 433.8984375, y: 521.8125, width: 96.4218749999999, height: 22.6875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D7 droit", bounds: CGRect(x: 300.609375, y: 551.1171875, width: 97.3671875, height: 24.578125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D7 gauche", bounds: CGRect(x: 434.84375, y: 549.2265625, width: 86.0234374999999, height: 20.796875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C6", bounds: CGRect(x: 47.265625, y: 783.6640625, width: 100.203125, height: 31.1953125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C6 gauche", bounds: CGRect(x: 666.4453125, y: 779.8828125, width: 110.6015625, height: 54.828125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C7 droit", bounds: CGRect(x: 86.0234375, y: 830.9296875, width: 34.03125, height: 98.3125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C7 gauche", bounds: CGRect(x: 680.625, y: 838.4921875, width: 71.84375, height: 106.8203125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C8 droit", bounds: CGRect(x: 147.46875, y: 814.859375, width: 23.6328125, height: 99.2578125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C8 gauche", bounds: CGRect(x: 641.8671875, y: 808.2421875, width: 36.8671875, height: 105.875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C6 droit", bounds: CGRect(x: 140.8515625, y: 675.8984375, width: 28.359375, height: 112.4921875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C6 gauche", bounds: CGRect(x: 625.796875, y: 639.03125, width: 62.390625, height: 136.125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D2 droit", bounds: CGRect(x: 248.6171875, y: 413.1015625, width: 28.359375, height: 86.0234375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D2 gauche", bounds: CGRect(x: 538.828125, y: 403.6484375, width: 34.9765625, height: 83.1875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D1 droit", bounds: CGRect(x: 246.7265625, y: 503.8515625, width: 25.5234375, height: 151.25)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D1 droit", bounds: CGRect(x: 214.5859375, y: 640.921875, width: 24.578125, height: 97.3671875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D1 gauche", bounds: CGRect(x: 543.5546875, y: 516.140625, width: 48.2109375, height: 179.609375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D1 gauche", bounds: CGRect(x: 592.7109375, y: 668.3359375, width: 28.359375, height: 75.625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C6 droit", bounds: CGRect(x: 225.9296875, y: 414.046875, width: 19.8515625, height: 146.5234375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C6 gauche", bounds: CGRect(x: 573.8046875, y: 409.3203125, width: 24.578125, height: 106.8203125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D8 droit", bounds: CGRect(x: 306.28125, y: 576.640625, width: 99.2578125, height: 31.1953125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D8 gauche", bounds: CGRect(x: 428.2265625, y: 580.421875, width: 87.9140624999999, height: 15.125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D9 droit", bounds: CGRect(x: 307.2265625, y: 607.8359375, width: 100.203125, height: 34.03125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D9 gauche", bounds: CGRect(x: 430.1171875, y: 603.109375, width: 78.4609375, height: 18.90625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D10 droit", bounds: CGRect(x: 308.171875, y: 646.59375, width: 104.9296875, height: 32.140625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D10 gauche", bounds: CGRect(x: 430.1171875, y: 638.0859375, width: 89.8046874999999, height: 22.6875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D11 droit", bounds: CGRect(x: 310.0625, y: 682.515625, width: 96.421875, height: 34.03125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D11 gauche", bounds: CGRect(x: 429.171875, y: 674.0078125, width: 95.4765624999999, height: 34.9765625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D12 droit", bounds: CGRect(x: 311.0078125, y: 719.3828125, width: 95.4765625, height: 53.8828125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D12 gauche", bounds: CGRect(x: 434.84375, y: 721.2734375, width: 76.5703125, height: 30.25)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L1 droit", bounds: CGRect(x: 318.5703125, y: 776.1015625, width: 96.421875, height: 78.4609375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L1 gauche", bounds: CGRect(x: 432.953125, y: 774.2109375, width: 82.2421874999999, height: 63.3359375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L2 droit", bounds: CGRect(x: 260.90625, y: 859.2890625, width: 81.296875, height: 181.5)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L2 gauche", bounds: CGRect(x: 465.09375, y: 861.1796875, width: 86.9687499999999, height: 199.4609375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L3 droit", bounds: CGRect(x: 346.9296875, y: 989.7421875, width: 48.2109375, height: 102.09375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L3 gauche", bounds: CGRect(x: 414.046875, y: 991.6328125, width: 53.8828125, height: 103.984375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L4 droit", bounds: CGRect(x: 357.328125, y: 1111.6875, width: 51.9921875, height: 461.3125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L4 gauche", bounds: CGRect(x: 413.1015625, y: 1114.5234375, width: 40.6484375, height: 457.53125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L5 droit", bounds: CGRect(x: 300.609375, y: 1122.0859375, width: 51.9921875, height: 315.734375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L5 gauche", bounds: CGRect(x: 465.09375, y: 1122.0859375, width: 34.03125, height: 326.1328125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome S1 droit", bounds: CGRect(x: 315.734375, y: 1457.671875, width: 35.921875, height: 45.375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome S1 gauche", bounds: CGRect(x: 458.4765625, y: 1459.5625, width: 61.4453124999999, height: 53.8828125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C2", bounds: CGRect(x: 1320.6015625, y: 142.7421875, width: 163.5390625, height: 138.015625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C3", bounds: CGRect(x: 1334.78125, y: 291.15625, width: 130.453125, height: 85.078125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C4", bounds: CGRect(x: 1339.5078125, y: 379.0703125, width: 133.2890625, height: 46.3203125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome C5", bounds: CGRect(x: 1337.6171875, y: 422.5546875, width: 136.125, height: 38.7578125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D1", bounds: CGRect(x: 1248.7578125, y: 466.0390625, width: 314.7890625, height: 37.8125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D2", bounds: CGRect(x: 1251.59375, y: 506.6875, width: 308.171875, height: 34.0312499999999)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D3", bounds: CGRect(x: 1247.8125, y: 544.5, width: 303.4453125, height: 21.7421875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D4", bounds: CGRect(x: 1252.5390625, y: 578.53125, width: 296.828125, height: 22.6875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D5", bounds: CGRect(x: 1256.3203125, y: 605.9453125, width: 284.5390625, height: 30.25)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D6", bounds: CGRect(x: 1263.8828125, y: 639.03125, width: 267.5234375, height: 34.9765625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D7", bounds: CGRect(x: 1269.5546875, y: 677.7890625, width: 260.90625, height: 25.5234375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D8", bounds: CGRect(x: 1274.28125, y: 712.765625, width: 250.5078125, height: 36.8671875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D9", bounds: CGRect(x: 1279.953125, y: 755.3046875, width: 239.1640625, height: 28.359375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D10", bounds: CGRect(x: 1280.8984375, y: 787.4453125, width: 237.2734375, height: 30.25)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D11", bounds: CGRect(x: 1281.84375, y: 817.6953125, width: 239.1640625, height: 33.0859375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome D12", bounds: CGRect(x: 1285.625, y: 851.7265625, width: 235.3828125, height: 64.28125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L1", bounds: CGRect(x: 1282.7890625, y: 919.7890625, width: 252.3984375, height: 45.375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L2", bounds: CGRect(x: 1269.5546875, y: 971.78125, width: 28.359375, height: 77.515625)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome L2", bounds: CGRect(x: 1488.8671875, y: 969.890625, width: 75.625, height: 84.1328125)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome S3", bounds: CGRect(x: 1340.453125, y: 985.9609375, width: 139.90625, height: 45.375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome S4", bounds: CGRect(x: 1365.9765625, y: 1037.0078125, width: 78.4609375, height: 25.5234375)))
                imageMap.regionsMain.append(MappedImage.region(name: "dermatome S5, Coccyx", bounds: CGRect(x: 1376.375, y: 1068.203125, width: 49.15625, height: 50.1015625)))
            case "veines mb inf.png":
                imageMap.regionsMain.append(MappedImage.region(name: "veine cave inférieure", bounds: CGRect(x: 171.853587115666, y: 30.2086383601757, width: 234.284773060029, height: 31.5512445095168)))
                imageMap.regionsMain.append(MappedImage.region(name: "veine iliaque commune", bounds: CGRect(x: 485.352122986823, y: 99.3528550512445, width: 254.423865300146, height: 29.5373352855051)))
                imageMap.regionsMain.append(MappedImage.region(name: "veine iliaque interne", bounds: CGRect(x: 549.797218155198, y: 155.742313323572, width: 221.530014641288, height: 34.2364568081991)))
                imageMap.regionsMain.append(MappedImage.region(name: "veine iliaque externe", bounds: CGRect(x: 567.251098096633, y: 226.900439238653, width: 222.87262079063, height: 29.5373352855052)))
                imageMap.regionsMain.append(MappedImage.region(name: "ligament inguinal", bounds: CGRect(x: 563.89458272328, y: 291.345534407028, width: 193.335285505124, height: 25.5095168374817)))
                imageMap.regionsMain.append(MappedImage.region(name: "veines glutéales inférieure et supérieure", bounds: CGRect(x: 564.56588579795, y: 347.734992679356, width: 258.45168374817, height: 59.7459736456808)))
                imageMap.regionsMain.append(MappedImage.region(name: "veine obturatrice", bounds: CGRect(x: 608.200585651537, y: 438.360907759883, width: 187.293557833089, height: 30.8799414348463)))
                imageMap.regionsMain.append(MappedImage.region(name: "veine fémorale", bounds: CGRect(x: 605.515373352855, y: 522.945095168375, width: 165.811859443631, height: 27.5234260614934)))
                imageMap.regionsMain.append(MappedImage.region(name: "veine poplitée", bounds: CGRect(x: 561.209370424597, y: 935.125183016105, width: 159.770131771596, height: 28.194729136164)))
                imageMap.regionsMain.append(MappedImage.region(name: "petite veine saphène", bounds: CGRect(x: 516.90336749634, y: 1200.96120058565, width: 127.547584187409, height: 53.7042459736458)))
                imageMap.regionsMain.append(MappedImage.region(name: "grande veine saphène", bounds: CGRect(x: 517.57467057101, y: 1328.50878477306, width: 147.686676427526, height: 53.7042459736458)))
                imageMap.regionsMain.append(MappedImage.region(name: "veine tibiale", bounds: CGRect(x: 561.880673499268, y: 1077.44143484627, width: 155.071010248902, height: 32.2225475841874)))
                imageMap.regionsMain.append(MappedImage.region(name: "antérieure", bounds: CGRect(x: 724.336017569546, y: 1077.44143484627, width: 108.079795021962, height: 30.2086383601759)))
                imageMap.regionsMain.append(MappedImage.region(name: "postérieure", bounds: CGRect(x: 587.39019033675, y: 1112.34919472914, width: 121.505856515373, height: 22.1530014641289)))
            case "pied.png":
                imageMap.regionsMain.append(MappedImage.region(name: "tendon tibial antérieur", bounds: CGRect(x: 160.015625, y: 374.73046875, width: 249.8203125, height: 40.00390625)))
                imageMap.regionsMain.append(MappedImage.region(name: "malléole médiale", bounds: CGRect(x: 853.9609375, y: 355.953125, width: 182.875, height: 31.83984375)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon calcanéen", bounds: CGRect(x: 839.265625, y: 441.67578125, width: 202.46875, height: 22.04296875)))
                imageMap.regionsMain.append(MappedImage.region(name: "malléole latérale", bounds: CGRect(x: 1365.84765625, y: 364.1171875, width: 177.9765625, height: 23.67578125)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon long fibulaire", bounds: CGRect(x: 71.84375, y: 1020.5078125, width: 226.14453125, height: 28.57421875)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon court fibulaire", bounds: CGRect(x: 150.21875, y: 1083.37109375, width: 153.484375, height: 23.67578125)))
                imageMap.regionsMain.append(MappedImage.region(name: "malléole latérale", bounds: CGRect(x: 42.453125, y: 1213.1796875, width: 178.79296875, height: 25.30859375)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon court fibulaire", bounds: CGRect(x: 184.5078125, y: 1530.76171875, width: 239.20703125, height: 27.7578125)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon du 3ième fibulaire", bounds: CGRect(x: 670.26953125, y: 1116.84375, width: 315.1328125, height: 27.7578125)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon du long extenseur des orteils", bounds: CGRect(x: 779.66796875, y: 1240.12109375, width: 173.89453125, height: 93.0703125)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon du long extenseur de l'hallux", bounds: CGRect(x: 1399.3203125, y: 1267.87890625, width: 226.14453125, height: 59.59765625)))
                imageMap.regionsMain.append(MappedImage.region(name: "tendon tibial antérieur", bounds: CGRect(x: 1431.9765625, y: 1054.796875, width: 146.953125, height: 65.3125)))
                imageMap.regionsMain.append(MappedImage.region(name: "perimalléolaire externe", bounds: CGRect(x: 299.62109375, y: 1175.625, width: 133.890625, height: 123.27734375)))
                imageMap.regionsMain.append(MappedImage.region(name: "base du 5ième métatarsien", bounds: CGRect(x: 436.77734375, y: 1393.60546875, width: 70.2109375, height: 67.76171875)))
                imageMap.regionsMain.append(MappedImage.region(name: "face latérale du talon", bounds: CGRect(x: 254.71875, y: 1300.53515625, width: 117.5625, height: 139.60546875)))
                imageMap.regionsMain.append(MappedImage.region(name: "face médiale du talon", bounds: CGRect(x: 633.53125, y: 555.15625, width: 171.4453125, height: 144.50390625)))
                imageMap.regionsMain.append(MappedImage.region(name: "zone d'insertion du tendon calcaneen", bounds: CGRect(x: 1141.3359375, y: 557.60546875, width: 126.54296875, height: 84.08984375)))
                imageMap.regionsMain.append(MappedImage.region(name: "hallux", bounds: CGRect(x: 1306.25, y: 1489.94140625, width: 121.64453125, height: 151.03515625)))
                imageMap.regionsMain.append(MappedImage.region(name: "2ième orteil", bounds: CGRect(x: 1221.34375, y: 1507.0859375, width: 46.53515625, height: 130.625)))
                imageMap.regionsMain.append(MappedImage.region(name: "3ième orteil", bounds: CGRect(x: 1173.17578125, y: 1489.94140625, width: 32.65625, height: 112.6640625)))
                imageMap.regionsMain.append(MappedImage.region(name: "4ième orteil", bounds: CGRect(x: 1133.171875, y: 1470.34765625, width: 26.94140625, height: 104.5)))
                imageMap.regionsMain.append(MappedImage.region(name: "5ième orteil", bounds: CGRect(x: 1088.26953125, y: 1438.5078125, width: 31.83984375, height: 71.84375)))
                imageMap.regionsMain.append(MappedImage.region(name: "plantaire", bounds: CGRect(x: 212.265625, y: 704.55859375, width: 505.35546875, height: 48.16796875)))
                imageMap.regionsMain.append(MappedImage.region(name: "perimalléolaire médial", bounds: CGRect(x: 578.83203125, y: 435.14453125, width: 148.5859375, height: 98.78515625)))
                imageMap.regionsMain.append(MappedImage.region(name: "face médiale du pied", bounds: CGRect(x: 355.953125, y: 564.953125, width: 184.5078125, height: 80.0078125)))
                imageMap.regionsMain.append(MappedImage.region(name: "hallux", bounds: CGRect(x: 61.23046875, y: 655.57421875, width: 151.03515625, height: 50.6171875)))
                imageMap.regionsMain.append(MappedImage.region(name: "MTP de l'Hallux", bounds: CGRect(x: 217.98046875, y: 596.79296875, width: 113.48046875, height: 80.0078125)))
                imageMap.regionsMain.append(MappedImage.region(name: "face médiale du 1/3 inférieur de la jambe", bounds: CGRect(x: 535.5625, y: 75.109375, width: 231.04296875, height: 229.41015625)))
                imageMap.regionsMain.append(MappedImage.region(name: "talon", bounds: CGRect(x: 1124.19140625, y: 663.73828125, width: 194.3046875, height: 80.82421875)))
                imageMap.regionsMain.append(MappedImage.region(name: "dos du pied", bounds: CGRect(x: 1157.6640625, y: 1144.6015625, width: 163.28125, height: 283.29296875)))
                imageMap.regionsMain.append(MappedImage.region(name: "cou du pied", bounds: CGRect(x: 1213.99609375, y: 1031.12109375, width: 113.48046875, height: 92.25390625)))
                imageMap.regionsMain.append(MappedImage.region(name: "face dorso-latérale du pied", bounds: CGRect(x: 444.94140625, y: 1277.67578125, width: 129.80859375, height: 132.2578125)))
            default:
                break
            }
            imageMap.saveToFile(imageMap.name)
            //  imageMap.regionsMain.append(MappedImage.region(name: "test", bounds: CGRect(x: <#T##Double#>, y: <#T##Double#>, width: <#T##Double#>, height: <#T##Double#>)))
            //ex.value=imageMap.name
            
        }
        
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //        setDefaultAtcd()
        //        setDefaultMedicament()
        //        setDefaultMotif()
        //        setDefaultLocalisation()
        //        setDefaultEtablissement()
        //        setDefaultMedecin()
        //        setDefaultPosologie()
        //        setDefaultProfession()
        //        setDefaultConclusionRx()
        //        setDefaultEvenement()
        //        setDefaultAllergie()
        //        Donnees.selectiontextDict["libre"]=["test"]
        setDefautTextDict()
        // MARK: Uncomment to read data files
        
      //  DataSave.loadDataFiles()
        
        configImageMapped()
        /*var filemgr = NSFileManager.defaultManager()
         if filemgr.fileExistsAtPath(filePathPatients) {
         print("File exists")
         do {
         let readFile = try String(contentsOfFile: filePathPatients, encoding: NSASCIIStringEncoding)
         print("\(readFile)")
         // the above prints "some text"
         } catch let error as NSError {
         print("Error: \(error)")
         }
         }*/
        // Get the document directory url
        
        
        //var documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        // var documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    func applicationDidFinishLaunching(_ application: UIApplication) {
        DropDown.startListeningToKeyboard()
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        DataSave.saveDataFiles()
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
    }
    
    
}

