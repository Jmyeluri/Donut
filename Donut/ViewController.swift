//
//  ViewController.swift
//  Donut
//
//  Created by Jayaram Yeluri on 7/12/16.
//  Copyright © 2016 Jayaram Yeluri. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  
    @IBOutlet weak var borderView: UIView!
    
    @IBOutlet weak var Charity: UILabel!
    @IBOutlet weak var Fact: UILabel!
    var num = 0
    @IBAction func donut(sender: AnyObject) {
        
        Fact.alpha = 0
        
        if let asset = NSDataAsset(name: "data", bundle: NSBundle.mainBundle()) {
            
            
            let jsonObj = JSON(data: asset.data)
             let count = jsonObj["Donut"].count
            let rand = Int(arc4random_uniform(UInt32(count)))
            num = rand
            let fact = jsonObj["Donut"][rand]["fact"].stringValue
            let charity = jsonObj["Donut"][rand]["charity"].stringValue
            Fact.text = fact
            Charity.text = "To " + (charity)
            
            
            UIView.animateWithDuration(0.7, delay: 0.2, options: [.CurveEaseIn],animations: {
                self.Fact.alpha += 1
            }, completion: nil)
            
            
            
            
            if jsonObj != JSON.null {
                //print("jsonData:\(jsonObj)")
            }
            else {
                print("could not get json from file, make sure that file contains valid json.")
            }
            
        } else {
            print("Invalid filename/path.")
        }

        
        
        
        
        
    }
  
    
    @IBOutlet weak var CharityName: UILabel!
    
    @IBAction func LINK(sender: AnyObject) {
        let asset = NSDataAsset(name: "data", bundle: NSBundle.mainBundle())
        
        let jsonObj = JSON(data: asset!.data)
        let link = jsonObj["Donut"][num]["link"].stringValue
        
        
        UIApplication.sharedApplication().openURL(NSURL(string: link)!)
        print("hi")

        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderView.layer.borderWidth = 7
        
      let bCol = UIColor(red: 190.0/255.0, green: 233.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        CharityName.layer.borderColor = bCol.CGColor
        CharityName.layer.borderWidth = 3
            
        borderView.layer.borderColor = bCol.CGColor
        
        
        
        
        
     /*   let image = UIImage(named: "donut.png") as UIImage?
        let button   = UIButton(type: UIButtonType.Custom) as UIButton
        button.frame = CGRectMake(150, 200, 100, 100)
        
        button.setImage(image, forState: .Normal)
         button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
 */
        
    }
    
    
    func buttonAction(sender: UIButton!) {
        print("buttonAction")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
  
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }


}

