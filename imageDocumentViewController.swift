//
//  imageDocumentViewController.swift
//
//
//  Created by Eric Ricalens on 26/07/2016.
//
//

import UIKit

 protocol mappedImageDelegate {
  func regionSelected(sender:MappedImage,region: MappedImage.region)
  //func actionSelected(sender:MappedImage,region:MappedImage.region,action:String)
    func selectionDone(sender:MappedImage,fulltext:String)
  func zoneAdded(sender:MappedImage,region:MappedImage.region)
 }

class imageDocumentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
    @IBAction func doneButtonAction(sender: AnyObject) {
        var fullString=""
        for zone in imageMapped!.regionsMain {
            if zone.action.isEmpty { continue}
            fullString += zone.name + " "
            
        }
        print("imagemap result: ",fullString)
        if let del=delegate {
                del.selectionDone(imageMapped!, fulltext: fullString)
        }
    }
    @IBAction func refreshButtonAction(sender: UIBarButtonItem) {
        for zone in imageMapped!.regionsMain {
            if zone.action == "" {
                let overlay: UIView = UIView(frame: zone.bounds)
                
                overlay.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.5)
                self.imageView.addSubview(overlay)
                zone.action=zone.name
                
            }else {
                for subview:UIView in self.imageView.subviews { //where subview.bounds==zone.bounds {
                    // print(subview.frame,point)
                    if subview.frame.contains(zone.bounds.origin){
                        subview.removeFromSuperview()
                    }
                }
                zone.action=""
                // self.imageView.vie
                // self.imageView.subviews[0].removeFromSuperview()
            }
        }
        
    }
    @IBAction func editZoneAction(sender: AnyObject) {
        editMode = !editMode
        let but=sender as? UIBarButtonItem
        but?.title="Edit \(editMode)"
    }
    var imageMapped:MappedImage? {
        didSet {
            imageView.image=imageMapped?.image
            //imageMapped.
        }
    }
    var editMode:Bool=false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.delegate=self
        imageView.userInteractionEnabled=true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageDocumentViewController.tap(_:))))
        
        
    }
    var firstPoint:CGPoint?
    var delegate:mappedImageDelegate?
    var savedZoom:CGFloat?
    var savedBounds:CGRect?
    func tap(gesture: UIGestureRecognizer) {
        let point = gesture.locationInView(gesture.view)
        
     //   print("touch:", point) // You can check for their tag and do different things based on tag
        
        if editMode {
            if let firstPointU=firstPoint {
                let reg=imageMapped?.addZone(CGRect(origin: firstPointU, size: CGSize(width: point.x-firstPointU.x, height: point.y-firstPointU.y)),viewController: self)
                if let del=delegate {
                    if let regg=reg {
                    del.zoneAdded(imageMapped!, region: regg)
                    }
                }
                firstPoint=nil
            } else {
                firstPoint=point
            }
        } else if let zone=imageMapped!.regionHittedAt(point) {
            print("hit zone: ",zone.name," at point ",point)
            if zone.action=="" {
                let overlay: UIView = UIView(frame: zone.bounds)
                //overlay.
                overlay.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.5)
                savedZoom=self.scrollView.zoomScale
                savedBounds=self.scrollView.bounds
             //   let bounds=self.scrollView.
                self.imageView.addSubview(overlay)
                zone.action=zone.name
               // self.scrollView.setZoomScale(savedZoom, animated: true)
            } else {
                for subview:UIView in self.imageView.subviews { //where subview.bounds==zone.bounds {
                   // print(subview.frame,point)
                    if subview.frame.contains(point){
                    subview.removeFromSuperview()
                    }
                }
                zone.action=""
               // self.imageView.vie
               // self.imageView.subviews[0].removeFromSuperview()
            }
            if let del=delegate {               
                    del.regionSelected(imageMapped!, region: zone)
            }
        }
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateMinZoomScaleForSize(view.frame.size)
    }
    private func updateConstraintsForSize(size: CGSize) {
        
        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        
        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        
        view.layoutIfNeeded()
    }
    private func updateMinZoomScaleForSize(size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        
        scrollView.zoomScale = minScale
    }
    
}
extension imageDocumentViewController: UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func scrollViewDidZoom(scrollView: UIScrollView) {
        updateConstraintsForSize(view.frame.size)
        if savedZoom != nil {
            self.scrollView.bounds=savedBounds!
            self.scrollView.zoomScale=savedZoom!
            savedZoom=nil
        }
    }
}