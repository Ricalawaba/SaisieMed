//
//  rapportViewController.swift
//  FoodTracker
//
//  Created by Eric Ricalens on 14/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//
// TODO: Plntage lors de l'export mail de rapport non "patient"
import UIKit
import MessageUI

extension UIPrintPageRenderer {
    func printToPDF() -> NSData {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, self.paperRect, nil)
        self.prepareForDrawingPages(NSMakeRange(0, self.numberOfPages()))
        let bounds = UIGraphicsGetPDFContextBounds()
        for i in 0..<self.numberOfPages() {
            UIGraphicsBeginPDFPage();
            self.drawPageAtIndex(i, inRect: bounds)
        }
        UIGraphicsEndPDFContext();
        return pdfData;
    }
    
}
class rapportViewController: UIViewController ,MFMailComposeViewControllerDelegate  {
    @IBAction func patientButtonAction(sender: UIBarButtonItem) {
        self.navigationController!.popToViewController(DataSave.lastPatientVC!,animated: true)
    }
    
    @IBAction func accueilButtonAction(sender: UIBarButtonItem) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        for aViewController in viewControllers {
            if(aViewController is patientTableViewController){
                self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
        
    }
    @IBAction func MailData(sender: UIBarButtonItem) {
        let email = MFMailComposeViewController()
        email.mailComposeDelegate = self
        email.setToRecipients(["drricalens@gmail.com"])
        
        email.setSubject("Synthèse clinique de \(patient.nomPrenom), \(patient.age) ans")
        let messageBody=webView.stringByEvaluatingJavaScriptFromString("document.body.innerHTML")!
        let documents=patient.getDocuments()
        var x=0
        for doc in documents{
            
            let image = UIImage( contentsOfFile: fileInDocumentsDirectory( doc))
            x = x + 1
            email.addAttachmentData( UIImageJPEGRepresentation(image!, CGFloat(1.0))!, mimeType: "image/jpeg", fileName: "document_\(x).jpg")
            
            
        }
        email.setMessageBody(messageBody, isHTML: true) // or true, if you prefer
        presentViewController(email, animated: true, completion: nil)
    }
    @IBAction func done(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var webView: UIWebView!
    var patient=patients.patient()
    var uneCategorie: categorieExamen.Categorie?=nil
    var directHTML : String?
    
    // Delegate requirement
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func createPdfFile(printFormatter: UIViewPrintFormatter) -> NSData {
        let renderer = UIPrintPageRenderer()
        renderer.addPrintFormatter(printFormatter, startingAtPageAtIndex: 0);
        let paperSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)
        let printableRect = CGRectMake(0, 0, paperSize.width, paperSize.height)
        let paperRect = CGRectMake(0, 0, paperSize.width, paperSize.height);
        renderer.setValue(NSValue(CGRect: paperRect), forKey: "paperRect")
        renderer.setValue(NSValue(CGRect: printableRect), forKey: "printableRect")
        return renderer.printToPDF()
    }
    @IBAction func savePDF(sender: AnyObject) {
        
    }
    func savePdf(filename: String){
        // FIXME: Non implémenté
    }
    
    func pdfToFile(pathfile: String) {
        let pdfData = createPdfFile(webView.viewPrintFormatter())
        pdfData.writeToFile(pathfile, atomically: true)
    }
    override func viewDidAppear(animated: Bool) {
        var myHTMLString:String="<head><meta name=\"viewport\" content=\"width=600;initial-scale=1.0\"></head>"
        if directHTML != nil {
            myHTMLString += directHTML!
        }
        else if uneCategorie == nil  {
            myHTMLString += patient.DetailedString()
            
        } else {
            myHTMLString = "<H2>\(uneCategorie!.nom)</H2>"
            let detailstr=uneCategorie!.formattedDetaiString()
            
            if !detailstr.isEmpty {
                myHTMLString += "<h2>\(uneCategorie!.nom)</h2><p>\(detailstr)</p>"
            }
        }
      //  myHTMLString += "</div></body>"
        // let url = NSBundle.mainBundle().URLForResource("examenclinique", withExtension: "png")
        let url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        webView.loadHTMLString(myHTMLString, baseURL: url)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        let url = NSBundle.mainBundle().URLForResource("test", withExtension: "html")
        //
        //        do {
        //            let html = try NSString(contentsOfURL: url!, encoding: NSUTF8StringEncoding)
        //            webView.loadHTMLString(html as String, baseURL: url?.URLByDeletingLastPathComponent)
        //        }
        //        catch {
        //            NSLog("Page not loading")
        //        }
        webView.scalesPageToFit=true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
