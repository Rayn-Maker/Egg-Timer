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
    
    let eggTimes: [String:Int] = ["Soft":5,"Medium":7,"Hard":12]
    
    var totalTime:Float = 0.0
    var secondsRemaining:Float = 0.0
    
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton){
        if timer.isValid {
            timer.invalidate()
        }
        progressBar.progress = 0.0
        
        secondsRemaining = 0.0
        
        let hardness = sender.currentTitle!
        
        totalTime = Float(eggTimes[hardness]!)
        
        startTimer()
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining <= self.totalTime {
                self.secondsRemaining += 1
                self.progressBar.progress = Float(self.secondsRemaining/self.totalTime)
                
                } else {
                    self.playSound()
                    Timer.invalidate()
                }
            }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

}
