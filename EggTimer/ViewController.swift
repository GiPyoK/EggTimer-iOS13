//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
        
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        guard let hardness = sender.currentTitle else { return }
        
        var timeRemaining = eggTimes[hardness]!
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeRemaining > 0 {
                print("\(timeRemaining) seconds")
                timeRemaining -= 1
            } else {
                timer.invalidate()
            }
        }
    }
}
