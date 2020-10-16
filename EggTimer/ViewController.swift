//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var textLabel: UILabel!

    var eggTime = ["Soft":3, "Medium":4, "Hard":7]
    var timer = Timer()
    var secondPassed = 0
    var total = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        timer.invalidate()
        
        progressBar.progress = 0
        secondPassed = 0
        textLabel.text = hardness
        
        total = eggTime[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
        @objc func updateCounter() {
            //example functionality
                if secondPassed < total
                {
                    secondPassed += 1
                    progressBar.progress = Float(secondPassed) / Float(total)
                    textLabel.textColor = UIColor.black
                }else{
                    textLabel.text = "DONE!"
                    textLabel.textColor = UIColor.green
                    timer.invalidate()
                }
            }
        }
