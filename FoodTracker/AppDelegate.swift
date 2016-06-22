//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 08/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // MARK: - Antécédents : liste initiale
    func setDefaultAtcd() {
        Donnees.selectiontextDict["atcd"] = [
            "", "Accident Ischémique Transitoire (AIT)", "Accident vasculaire cérébral (AVC)", "Alcool", "Amygdalectomie", "Angor", "Appendicectomie", "Artérite", "Arthrose cervicale", "Arthrose lombaire", "Asthme", "Bronchopneumopathie obstructive", "Cholecystite", "Cholécystectomie", "Colique néphrétique", "Coxarthrose", "DNID", "Dents de sagesse", "Diabète insulino requérant", "Diabète type I", "Eczéma", "Embolie pulmonaire", "Epilepsie", "Fibrillation auriculaire", "Fibrillation auriculaire paroxystique", "Fibrillation auriculaire permanente", "Fibroscopie gastrique", "Gastrite", "Gonarthrose", "Hypercholestérolémie", "Hypertension artérielle", "Infarctus myocardique", "Insuffisance cardiaque", "Insuffisance aortique", "Insuffisance mitrale", "Insufisance veineuse des membres inférieurs", "Interruption volontaire grossesse", "Kyste ovarien","Pyélonéphrite", "Néoplasie colique", "Néoplasie mammaire", "Néoplasie prostatique ", "Néoplasie pulmonaire", "Néoplasie rénale", "Néoplasique colique", "Néphrectomie", "Occlusion", "Oedeme aigue du poumon", "Pace-Maker", "Péritonite", "Pneumopathie", "Polypes coliques", "Polypes utérins", "Prothèse de genou", "Prothèse de hanche", "RGO", "Rectite hémorragique", "Retrécissement aortique", "Réduction mammaire", "Rétrécissement mitral", "Rhizarthrose", "Splénectomie", "Stérilet", "Syndrome anxio-depressif", "Tabagisme", "Tablier abdominal", "Thrombose veineuse profonde", "Traumatisme crânien grave", "Ulcère gastrique", "Urticaire", "Valvulopathie", "Varicectomie","Infection urinaire","Emphysème bronchique","Insuffisance respiratoire","Insuffisance rénale",
                "Mélanome","Colites","Colique hépatique","Phlegmon","Choc anaphylactique","Arret cardio-respiratoire","Trauma cranien grave","Ischémie aigue des membres inférieurs",
                "Artéropâthie oblitérante des membres inférieurs","Maladie de parkinson","Maladie d'alzheimer","Syndrome confusionnel","Tentative d'autolyse","Méningite",
                
        ]
        Donnees.selectiontextDict["atcd"]=Donnees.selectiontextDict["atcd"]?.sort()
    }
    // MARK: - Médicaments : liste initiale
    func setDefaultMedicament() {
        Donnees.selectiontextDict["medicament"] = [
            "ABILIFY 5", "AMIODARONE 200", "AMLODIPINE 10", "AMLODIPINE 5", "AMLOR 5", "AVLOCARDYL 40", "AVLOCARDYL 40", "BACLOFENE 10", "CLONAZEPAM 2,5", "CO-APROVEL 150/12.5", "COUMADINE 2", "COUMADINE 5", "CYMBALTA 60", "DEPAKINE CHRONO 500", "DIGOXINE 0,25", "DOLIPRANE 1000", "DOLIPRANE 500", "ESOMEPRAZOLE 20", "ESOMEPRAZOLE 40", "FLECAINE 100", "FLECAINE 100 LP", "FUROSEMIDE 20", "FUROSEMIDE 40", "IRBESARTAN 150", "IRBESARTAN 300", "KARDEGIC 160", "KARDEGIC 75", "KEPRA 500", "LANTUS 100UI/ml", "LEVOTHYROXINE 100", "LEVOTHYROXINE 125", "LEVOTHYROXINE 150", "LEVOTHYROXINE 25", "LEVOTHYROXINE 50", "LEVOTHYROXINE 75", "METFORMINE 1000", "METFORMINE 500", "METFORMINE 850", "METOPROLOL 25", "OMEPRAZOLE 10", "OMEPRAZOLE 20", "PARACETAMOL 1000", "PARACETAMOL 500", "PAROXETINE 20", "PLAVIX 75", "PREVISCAN", "PROPRANOLOL 40", "RAMIPRIL 5", "SERESTA 10", "SEROPLEX 20", "SIMVASTATINE 20", "STILNOX", "TRAMADOL 100 LP", "TRAMADOL 50"
            ].sort()

    }
        // MARK: - Motifs : liste initiale
    func setDefaultMotif() {
        Donnees.selectiontextDict["motif"] = [
             "", "Accident de la voie publique", "Acouphènes", "Adénopathies", "Agression/Rixe", "Altération de l'état général", "Amaurose transitoire", "Anorexie", "Aphasie", "Aucun", "Brulures cutanées", "Brulures occulaires", "Brulures urinaires", "Certificat médical", "Cervicalgie", "Céphallée", "Chute de sa hauteur", "Chute en 2R", "Chute par maladresse", "Coxalgie", "Cruralgie", "Début brutal", "Désorientation temporospatiale", "Diarrhée", "Douleur abdominale", "Douleur bras", "Douleur cuisse", "Douleur dentaire", "Douleur epaule", "Douleur épigastrique", "Douleur fesse", "Douleur généralisée", "Douleur lombaire", "Douleur mollet", "Douleur pelvienne", "Douleur pharyngée", "Douleur thoracique", "Dyspnée", "Eruption cutanée", "Gonalgie", "Hématurie", "Hyperthermie", "Lombalgie", "Malaise", "Nausées", "Otalgie", "Palpitations", "Perte de connaissance", "Infection urinaire", "Plaie abdominale", "Plaie arcade", "Plaie avant-bras", "Plaie cuisse", "Plaie de la face", "Plaie de la main", "Plaie du crane", "Rachialgie", "Rétention urinaire", "Sans perte de connaissance", "Sciatalgie", "Surdité brusque", "Syndrome rhinopharyngée", "Toux", "Trauma crânien", "Trauma epaule", "Trauma main", "Troubles de l'appétit", "Troubles du langage", "Vertiges", "Vomissements", "d'aggravation progressive",
                 "Douleur cheville", "Douleur poignet","Trauma cheville","Trauma poignet","Dorsalgie","Scapulalgie","Arret des matières et des gaz","Piqures d'insectes",
                 "Morsure de chien","Morsure de chat","Morsure de serpent","Gonalgie","Douleur genou","Douleur cervicale","Rachialgie","Etat de faiblesse","Perte de poids",
                 "Talalgie","Douleur talon","Crise convulsive","Anurie","Epigastralgie","Crise d'angoisse"
            ].sort()
    }
        // MARK: - Localisation : liste initiale
    func setDefaultLocalisation() {
        Donnees.selectiontextDict["localisation"] = [
            "Bureau",
            "I.O.A",
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
        Donnees.selectiontextDict["etablissement"] = [
            "CH Albi", "CH Castres", "CHU Purpan ( Toulouse)", "CHU Rangueuil (Toulouse)", "CHU Toulouse", "Canada", "Clin. Carrié (Auch)", "Clin. Claude Bernard (Albi)", "Clin. Escudié", "Clin. Sidobre (Castres)", "Clin. St-Jean Languedoc (Toulouse)", "Clin. Toulouse-Lautrec (Albi)", "Clin. Union (Toulouse)", "Clin. des Cèdres (Toulouse)"
            ].sort()
    }
    // MARK: - Medecin : liste initiale
    func setDefaultMedecin() {
        Donnees.selectiontextDict["medecin"] = [
            " Pas de médecin traitant","Dr Chatillon B.", "Dr Paquié C.", "Dr Mariambourg G.", "Dr Moruzi M.", "Dr Moruzi S.",
            "Dr De la porte C.","Dr Fargues P.","Dr Bensoussan L-C.","Dr Arhire Andréi.","Dr Arhire Anca","Dr Louis C.",
            " Médecin traitant","Dr Olivier C.","Dr Hacker", "Dr Villacreces B.","Dr Marolda S.","Dr Baux D.","Dr Laur D.", "Dr Mylonas P.",
            "Dr Charles X.","Dr Lafon-Cantié", "Dr Boulanger", "Dr Peltier J.p","Dr Fargues P.","Dr Mezières J.", "Dr Gorostis","Dr Rouzaud",
            "Dr Pages P.", "Dr Prudhomme L.", "Dr Cuinat", "Dr Dary", "Dr Guiraud-Chaumeil", "Dr Pascal","Dr Adad","Dr Avram","Dr Eleftérion P.",
            "Dr Gipoulou","Dr Mullens"
            ].sort()
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
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        setDefaultAtcd()
        setDefaultMedicament()
        setDefaultMotif()
        setDefaultLocalisation()
        setDefaultEtablissement()
        setDefaultMedecin()
        setDefaultPosologie()
        setDefaultProfession()
        setDefaultConclusionRx()

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

