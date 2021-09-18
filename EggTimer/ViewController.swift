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
    
    let eggTimes: [String: Int] = ["Soft": 1, "Medium": 2, "Hard": 3]
    var timer = Timer()
        
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        guard let hardness = sender.currentTitle else { return }
        
        var timeRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeRemaining > 0 {
                print("\(timeRemaining) seconds")
                timeRemaining -= 1
            } else {
                self.titleLabel.text = "\(hardness) egg done"
                timer.invalidate()
            }
        }
    }
}
