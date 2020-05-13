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
    
    let eggTime = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    var secondsPassed = 0.0
    var totalTime = 0.0
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totalTime = Double(eggTime[hardness]!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        progressBar.progress = 0.0
        secondsPassed = 0.0
        titleLabel.text = hardness
    }
    
    @objc func updateCounter() {
        
        progressBar.progress = Float(secondsPassed) / Float(totalTime)
        
        if secondsPassed < totalTime {
            print("\(secondsPassed) seconds to the end of the world")
            secondsPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }

    }
    

}
