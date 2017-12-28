//
//  ViewController.swift
//  DigitalClock
//
//  Created by Jaime Jazareno III on 28/12/2017.
//  Copyright © 2017 Jaime Jazareno III. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var colourSegment: UISegmentedControl!
    @IBOutlet weak var backgroundColourSegment: UISegmentedControl!
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateTimer()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        settingsButton.alpha = 0.25
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settings(_ sender: Any) {
        if settingsView.isHidden == true {
            settingsButton.setTitle("Hide Settings", for: UIControlState.normal)
            settingsView.isHidden = false
            settingsButton.alpha = 1
            
        }
        else{
            settingsButton.setTitle("Show Settings", for: UIControlState.normal)
            settingsView.isHidden = true
            settingsButton.alpha = 0.25
        }
    }
    
    @IBAction func clockColour(_ sender: Any) {
        if colourSegment.selectedSegmentIndex == 0 {
            label.textColor = UIColor.white
        }
        else if colourSegment.selectedSegmentIndex == 1 {
            label.textColor = UIColor.black
        }
        else if colourSegment.selectedSegmentIndex == 2 {
            label.textColor = UIColor.red
        }
        else if colourSegment.selectedSegmentIndex == 3 {
            label.textColor = UIColor.green
        }
    }
    
    @IBAction func clockBackgroundColour(_ sender: Any) {
        
        if backgroundColourSegment.selectedSegmentIndex == 0 {
            label.backgroundColor = UIColor.black
        }
        else if backgroundColourSegment.selectedSegmentIndex == 1 {
            label.backgroundColor = UIColor.white
        }
        else if backgroundColourSegment.selectedSegmentIndex == 2 {
            label.backgroundColor = UIColor.yellow
        }
        else if backgroundColourSegment.selectedSegmentIndex == 3 {
            label.backgroundColor = UIColor.blue
        }
        
    }
    @objc func updateTimer(){
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        label.text = timeFormatter.string(from: Date())
    }

}

