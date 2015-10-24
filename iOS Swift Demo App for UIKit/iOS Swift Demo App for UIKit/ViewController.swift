//
//  ViewController.swift
//  iOS Swift Demo App for UIKit
//
//  Created by Elad Rahmim on 10/24/15.
//  Copyright © 2015 Elad Rahmim. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var headerView: UIView!
    var DataSource:NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return DataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? UITableViewCell
        cell!.separatorInset = UIEdgeInsetsZero
        cell!.layoutMargins = UIEdgeInsetsZero
        cell!.preservesSuperviewLayoutMargins = false
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        cell?.textLabel?.text = "\(DataSource.objectAtIndex(indexPath.row) as! String)"
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert:UIAlertController = UIAlertController(title: "Message", message: "Thanks For Clicking", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close Alert View", style: UIAlertActionStyle.Default, handler: {addAction in
            UIView.animateWithDuration(2.5, animations: {self.headerView.backgroundColor = UIColor.blueColor()}, completion: {_ in
                print("animate complete")
            })
        }))
        
        
        alert.addAction(UIAlertAction(title: "Change header Color", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated:true, completion:nil)

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        DataSource.addObject(textField.text!)
        
        TableView.reloadData()
        textField.text = ""
        return true
    }

}

