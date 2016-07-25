//
//  ViewController.swift
//  SpectraStopwatch
//
//  Created by Jocelyn Tran on 7/23/16.
//  Copyright © 2016 Jocelyn Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 0 // dont need to declare type like javascript
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    //    var n: Int = 0
    //    var x: Double = 2.3424342
    //    var s: String = "hello world"
    //    var a:[String] = ["hola", "mundo"]
    
    
    @IBAction func startTime(sender: AnyObject) {
        alternateButtons()
        validateTimer()
    }
    
    
    
    @IBAction func stopTime(sender: AnyObject) {
        alternateButtons()
        timer.invalidate()
        counter = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeLabel.text = "00:00:00"
        stopButton.hidden = true
        stopButton.enabled = false
    }
    func validateTimer() {
        
        // let is like var, but immutable constant
        let repeatingFunction: Selector = #selector(ViewController.updateTime)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: repeatingFunction, userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        counter+=1
        
        let (strMinutes, strSeconds, strMilliseconds) = calculateTimeUnits()
        
        // concatenate minutes, seconds, and milliseconds, then assign them to the UILabel
        
        timeLabel.text = "\(strMinutes):\(strSeconds):\(strMilliseconds)"
        // slash and parens will display variable value
    }
    
    func alternateButtons() {
        startButton.hidden = !startButton.hidden
        startButton.enabled = !startButton.enabled
        stopButton.hidden = !stopButton.hidden
        stopButton.enabled = !stopButton.enabled
    }
    
    func calculateTimeUnits() -> (String, String, String) {
        var remainingCounter = counter
        
        // calculate elapsed minutes
        let minutes = remainingCounter / 6000
        remainingCounter -= minutes * 6000
        
        // calculate elapsed seconds
        let seconds = remainingCounter / 100
        remainingCounter -= seconds * 100
        
        // calculate elasped milliseconds
        let milliseconds = remainingCounter
        
        // add the leading zero for minutes, seconds, and milliseconds, then store them as string constants
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        return (strMinutes, strSeconds, strMilliseconds)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

