//
//  pluginFormViewController.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 03/07/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit

class pluginFormViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var examen:Examen?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.minimumZoomScale = 0.5
        self.scrollView.maximumZoomScale = 10.0
        self.scrollView.contentMode = .ScaleAspectFit
        imageView.sizeToFit()
        self.scrollView.contentSize=imageView.frame.size
       // imageView.frame = CGRectMake(0,0,imageView.image,image_height);
        imageView.center = scrollView.center
//        if examen?.type == .imagefilename {
//            
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
     
        
        return self.imageView
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
