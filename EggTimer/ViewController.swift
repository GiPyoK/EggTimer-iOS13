//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 6, "Hard": 7]
    var timer = Timer()
    
    
    override func viewDidLoad() {
        progressView.progress = 0
    }
        
    @IBAction func hardnessSelected(_ sender: UIButton) {
        // Check if button title exists
        guard let hardness = sender.currentTitle else { return }
        
        // Stop any on going timer
        timer.invalidate()
        
        // Get the right time according to the button
        let timeNeeded = eggTimes[hardness]!
        var timePassed = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timePassed < timeNeeded {
                timePassed += 1
                self.progressView.progress = Float(timePassed) / Float(timeNeeded)
            } else {
                self.titleLabel.text = "\(hardness) egg done"
                timer.invalidate()
            }
        }
    }
}
