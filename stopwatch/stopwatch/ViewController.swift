//
//  ViewController.swift
//  stopwatch
//
//  Created by Elad Rahmim on 10/10/15.
//  Copyright © 2015 Elad Rahmim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var Laps : [String] = []
    var timer = NSTimer()
    var Seconds : Int = 0
    var Minutes : Int = 0
    var fractions : Int = 0
    
    var StopWatchString : String = ""
    
    var startStopWatch : Bool = true
    var addLap : Bool = true
    
    @IBOutlet weak var StopWatchLabel: UILabel!
    @IBOutlet weak var LapTableView: UITableView!
    @IBOutlet weak var Start: UIButton!
    @IBOutlet weak var Lap: UIButton!
    
    @IBAction func StartStop(sender: AnyObject) {
        
        if startStopWatch == true{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: ("updateStopWatch"), userInfo: nil, repeats: true)
            startStopWatch = false
            
            Start.setTitle("Stop", forState: UIControlState.Normal)
            Lap.setTitle("lap", forState: UIControlState.Normal)
            
            addLap = true
        }
        else{
            timer.invalidate()
            startStopWatch = true
            
            Start.setTitle("Start", forState: UIControlState.Normal)
            Lap.setTitle("Reset", forState: UIControlState.Normal)
            
            addLap = false
        }
    }
    
    @IBAction func LapReset(sender: AnyObject) {
        if addLap == true{
            Laps.insert(StopWatchString, atIndex: 0)
            LapTableView.reloadData()
        }
        else{
            addLap = false
            Lap.setTitle("lap", forState: UIControlState.Normal)
            
            Laps.removeAll(keepCapacity: false)
            LapTableView.reloadData()
            
            _ = 0
            _ = 0
            _ = 0
            
            StopWatchString = "00:00:00"
            StopWatchLabel.text = StopWatchString
            
        }
    }
    
    
    func updateStopWatch(){
        fractions += 1
        
        if fractions == 100{
            Seconds += 1
            fractions = 0
        }
        
        if Seconds == 60{
            Minutes += 1
            Seconds = 0
        }
        
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = Seconds > 9 ? "\(Seconds)" : "0\(Seconds)"
        let minutesString = Minutes > 9 ? "\(Minutes)" : "0\(Minutes)"
        
        StopWatchString = "\(minutesString):\(secondsString):\(fractionsString)"
        StopWatchLabel.text = StopWatchString
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Laps.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        
        cell.backgroundColor = self.view.backgroundColor
        cell.textLabel?.text = "Lap \(Laps.count-indexPath.row)"
        cell.detailTextLabel?.text = Laps[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LapTableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        LapTableView.separatorInset = UIEdgeInsetsZero
        
        StopWatchLabel.text = "00:00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



