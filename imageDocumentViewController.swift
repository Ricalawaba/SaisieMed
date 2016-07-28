//
//  imageDocumentViewController.swift
//
//
//  Created by Eric Ricalens on 26/07/2016.
//
//

import UIKit

class imageDocumentViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    var imageMapped:MappedImage? {
        didSet {
            imageView.image=imageMapped?.image
            
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
    
    func tap(gesture: UIGestureRecognizer) {
        let point = gesture.locationInView(gesture.view)
        
        print("touch:", point) // You can check for their tag and do different things based on tag
        
        if editMode {
            if let firstPointU=firstPoint {
                imageMapped?.addZone(CGRect(origin: firstPointU, size: CGSize(width: point.x-firstPointU.x, height: point.y-firstPointU.y)),viewController: self)
                firstPoint=nil
            } else {
                firstPoint=point
            }
        } else if let zone=imageMapped!.regionHittedAt(point) {
            print("hit zone:",zone.name)
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
    }
}