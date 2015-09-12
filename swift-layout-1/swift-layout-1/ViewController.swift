//
//  ViewController.swift
//  swift-layout-1
//
//  Created by Elad Rahmim on 9/12/15.
//  Copyright (c) 2015 Elad Rahmim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! OtherViewController
        
        if segue.identifier == "signup_view"{
            vc.lbl = "sign up"
        }
        else if segue.identifier == "signin_view"{
            vc.lbl = "sign in"
        }

        
    }


}

