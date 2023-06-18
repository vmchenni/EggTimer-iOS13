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
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    
    var player: AVAudioPlayer?
    
    let softTime = 5
    let mediumTime = 8
    let hardTime = 12
    let eggTimes = ["Soft":3,
                    "Medium":4,
                    "Hard":7
                    
    ]

    var secondsRemaining : Int = 60
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    @IBAction func hardnessSelected(_ sender: UIButton) {
//        print(sender.currentTitle)
        
        timer.invalidate()
        var hardness = sender.currentTitle!
        
        totalTime = eggTimes [hardness]!
        progressBar.progress=0.0
        secondsPassed = 0
        titleLable.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0,target: self, selector: #selector(updateTimer),userInfo: nil,repeats: true)

    }
    @objc func updateTimer(){
        if secondsPassed <= totalTime{
            progressBar.progress = Float(secondsPassed) / Float (totalTime)
            print(progressBar.progress)
            secondsPassed += 1
        }else{
            timer.invalidate()
            titleLable.text = "DONE!"
            playSound()
        }
    }
    func playSound() {
        let url=Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}
