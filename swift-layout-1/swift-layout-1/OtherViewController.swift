//
//  OtherViewController.swift
//  swift-layout-1
//
//  Created by Elad Rahmim on 9/12/15.
//  Copyright (c) 2015 Elad Rahmim. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    
    var lbl = String()
    @IBOutlet weak var counterLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = lbl
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
