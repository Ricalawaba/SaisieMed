//
//  selectNumberViewController.swift
//  SaisieMed
//
//  Created by Eric Ricalens on 25/06/2016.
//  Copyright © 2016 Eric Ricalens. All rights reserved.
//

import UIKit
protocol numberSelectedDelegate {
    func numberSelected(sender:selectNumberViewController, number:String)
    
}
class selectNumberViewController: UIViewController {
    var delegate:numberSelectedDelegate?
    var numberResult:String=""
    
    @IBOutlet weak var numberPickView: NumbersPickerView!
    
        @IBAction func valideNumberAction(sender: UIButton) {
        if let del=delegate  {
            del.numberSelected(self, number: numberResult)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        numberPickView.onNumberSelected =   { (number: String) in
                                            self.numberResult = number    }
        
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
