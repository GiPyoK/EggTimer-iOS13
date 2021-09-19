//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 6, "Hard": 7]
    var timer = Timer()
    var alarmPlayer: AVAudioPlayer?
    
    
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
        progressView.progress = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timePassed < timeNeeded {
                timePassed += 1
                self.progressView.progress = Float(timePassed) / Float(timeNeeded)
            } else {
                self.titleLabel.text = "\(hardness) egg done"
                timer.invalidate()
                self.playAlarm()
            }
        }
    }
    
    func playAlarm() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            alarmPlayer = try AVAudioPlayer(contentsOf: url)
             
            guard let alarmPlayer = alarmPlayer else { return }
            
            alarmPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}
