//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 08/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

// TODO: Import image libray et camera, Categorie "Documents Scannés"
// TODO: Protocoles médicaux
// TODO: Formatage examen/categorie


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
        Donnees.selectiontextDict["atcd"]=Donnees.selectiontextDict["atcd"]?.sort()
    }
    // MARK: - Médicaments : liste initiale
    func setDefaultMedicament() {
        Donnees.selectiontextDict["medicament"] = [ "ABILIFY 5", "AMIODARONE 200", "AMLODIPINE 10", "AMLODIPINE 5", "AMLOR 5", "AVLOCARDYL 40", "AVLOCARDYL 40", "BACLOFENE 10", "BISOPROLOL 1,25", "BISOPROLOL 2,5", "BRICANYL 5mg/2ml", "CLONAZEPAM 2,5", "CO-APROVEL 150/12.5", "COUMADINE 2", "COUMADINE 5", "CRESTOR 20", "CYMBALTA 60", "DEPAKINE CHRONO 500", "DIFFU-K", "DIGOXINE 0,25", "DOLIPRANE 1000", "DOLIPRANE 500", "ESOMEPRAZOLE 20", "ESOMEPRAZOLE 40", "EUPRESSYL 60", "EZETROL", "FENOFIBRATE 300", "FIXICAL D3", "FLECAINE 100", "FLECAINE 100 LP", "FUROSEMIDE 20", "FUROSEMIDE 40", "FUROSEMIDE 500", "IRBESARTAN 150", "IRBESARTAN 300", "KARDEGIC 160", "KARDEGIC 75", "KEPRA 500", "LANTUS 100UI/ml", "LERCAN 20", "LEVOTHYROXINE 100", "LEVOTHYROXINE 125", "LEVOTHYROXINE 150", "LEVOTHYROXINE 25", "LEVOTHYROXINE 50", "LEVOTHYROXINE 75", "LOSARTAN 100", "METFORMINE 1000", "METFORMINE 500", "METFORMINE 850", "METOPROLOL 25", "MIANSERINE 30", "MONO-TILDIEM LP 200", "OMEPRAZOLE 10", "OMEPRAZOLE 20", "PANTOPRAZOLE 40", "PARACETAMOL 1000", "PARACETAMOL 500", "PAROXETINE 20", "PINAVERIUM 100", "PLAVIX 75", "PREVISCAN", "PROPRANOLOL 40", "RAMIPRIL 5", "SERESTA 10", "SERETIDE DISKUS 500", "SEROPLEX 20", "SIMVASTATINE 20", "SIMVASTATINE 40", "SPIRIVA 18", "STILNOX", "TAMSULOSINE 0,4", "TARDYFERON", "TRAMADOL 100 LP", "TRAMADOL 50", "TRINITRINE 5 patch", "XEROQUEL LP 50", "ZOPICLONE 7,5", ]   .sort()

    }
        // MARK: - Motifs : liste initiale
    func setDefaultMotif() {
        Donnees.selectiontextDict["motif"] = [ "", "Accident de la voie publique", "Acouphènes", "Adénopathies", "Agression/Rixe", "Ait", "Altération de l'état général", "Amaurose transitoire", "Anorexie", "Anurie", "Aphasie", "Arret des matières et des gaz", "Aucun", "Brulures cutanées", "Brulures occulaires", "Brulures urinaires", "Certificat médical", "Cervicalgie", "Céphallée", "Chute de sa hauteur", "Chute en 2R", "Chute par maladresse", "Coxalgie", "Crise convulsive", "Crise d'angoisse", "Cruralgie", "Début brutal", "Désorientation temporospatiale", "Diarrhée", "Dorsalgie", "Douleur abdominale", "Douleur bras", "Douleur cervicale", "Douleur cheville", "Douleur cuisse", "Douleur dentaire", "Douleur epaule", "Douleur épigastrique", "Douleur fesse", "Douleur genou", "Douleur généralisée", "Douleur lombaire", "Douleur mollet", "Douleur pelvienne", "Douleur pharyngée", "Douleur poignet", "Douleur talon", "Douleur thoracique", "Dyspnée", "Epigastralgie", "Eruption cutanée", "Etat de faiblesse", "Frissons", "Gonalgie", "Gonalgie", "Hernie inguinale", "Hématurie", "Hyperthermie", "Infection urinaire", "Lombalgie", "Malaise", "Morsure de chat", "Morsure de chien", "Morsure de serpent", "Nausées", "Otalgie", "Palpitations", "Perte de connaissance", "Perte de poids", "Piqures d'insectes", "Plaie abdominale", "Plaie arcade", "Plaie avant-bras", "Plaie cuisse", "Plaie de la face", "Plaie de la main", "Plaie du crane", "Plaie abdominale","Plaie face","Plaie jambe","Plaie cuisse","Plaie doigt","Rachialgie",  "Rétention urinaire", "Sans perte de connaissance", "Scapulalgie", "Sciatalgie", "Sonde urinaire obstruée", "Surdité brusque", "Syndrome rhinopharyngée", "Tachycardie", "Talalgie", "Toux", "Trauma bassin", "Trauma cheville", "Trauma crânien", "Trauma epaule", "Trauma genou", "Trauma main", "Trauma poignet","Trauma coude", "Tremblements", "Troubles de l'appétit", "Troubles du langage", "Vertiges", "Vomissements", "d'aggravation progressive", ].sort()
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
        Donnees.selectiontextDict["etablissement"] = [ "CH Albi", "CH Castres", "CHU Purpan ( Toulouse)", "CHU Rangueuil (Toulouse)", "CHU Toulouse", "Canada", "Clin. Carrié (Auch)", "Clin. Claude Bernard (Albi)", "Clin. Escudié", "Clin. Pasteur ( Toulouse )", "Clin. Sidobre (Castres)", "Clin. St-Jean Languedoc (Toulouse)", "Clin. Toulouse-Lautrec (Albi)", "Clin. Union (Toulouse)", "Clin. des Cèdres (Toulouse)", "Clin. de l'Union (Toulouse)", "Clin. au Mans", ].sort()
    }
    // MARK: - Medecin : liste initiale
    func setDefaultMedecin() {
        Donnees.selectiontextDict["medecin"] = [ " Médecin traitant", " Pas de médecin traitant", "Dr Adad", "Dr Alzieu (CCB)", "Dr Arhire Anca (Sidobre)", "Dr Arhire Andréi (Sidobre)", "Dr Avram", "Dr Berthoumieu", "Dr Baux D.", "Dr Bensoussan L-C.", "Dr Boige-Martin (Aussillon)", "Dr Boulanger-Rayssac (Sidobre)", "Dr Bouyssou", "Dr Castex B. (Roquecourbe)", "Dr Charles X.", "Dr Chatillon B.", "Dr Cuinat L. (CCB)", "Dr Dary (CCB)", "Dr De Germay (Union)", "Dr De la porte C. (Sidobre)", "Dr Eleftérion P. (Revel)", "Dr Farge P.", "Dr Fargues P. (Sidobre)", "Dr Gipoulou", "Dr Gorostis", "Dr Guiraud-Chaumeil (CCB)", "Dr Hacker (Sidobre)", "Dr Lafon-Cantié (Sidobre)", "Dr Laur D.", "Dr Lefèvre D.", "Dr Louis C.", "Dr Mariambourg G.", "Dr Marolda S.", "Dr Mezières J.", "Dr Moruzi M.", "Dr Moruzi S.", "Dr Mullens", "Dr Mylonas P.", "Dr Novas", "Dr Olivier C.", "Dr Pages F. (La crouzette)", "Dr Pages P. (CCB)", "Dr Paquié C.", "Dr Pascal", "Dr Peltier J.p", "Dr Pistre (Vabre)", "Dr Prudhomme L.", "Dr Puech C", "Dr Ramon J.p (Castres)", "Dr Rouzaud", "Dr Villacreces B.", "Dr Goutner", "Dr siget Martinez", ].sort()
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
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
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
        
        DataSave.loadDataFiles()
        
       
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
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {

       DataSave.saveDataFiles()
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
    }


}

