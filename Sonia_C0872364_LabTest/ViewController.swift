//
//  ViewController.swift
//  Sonia_C0872364_LabTest
//
//  Created by MacStudent on 2022-11-04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startBtnLabel: UIButton!
    @IBOutlet weak var stopBtnLabel: UIButton!
    @IBOutlet weak var lapBtnLabel: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    var secondsElapsed = 0
    var timer = Timer()

    @IBAction func startBtn() {
        
        startBtnLabel.isHidden = true
        stopBtnLabel.isHidden = false
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed += 1
            let finalTime = self.secondsToHoursMinutesSeconds(Int(self.secondsElapsed))
            self.timerLabel.text = finalTime
            
        }
        
    }
    
    
    @IBAction func lapBtn() {
        
    }
    
    
    @IBAction func stopBtn() {
        self.timer.invalidate()
    }
    
    
    
    private func secondsToHoursMinutesSeconds(_ seconds: Int) -> (String) {
        let calHours = seconds / 3600
        let calMinutes = (seconds % 3600) / 60
        let calSeconds = (seconds % 3600) % 60
        let finalTime = "\(calHours) : \(calMinutes): \(calSeconds)"
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm:ss"
        
        let date = dateFormatterGet.date(from: finalTime)!
        
        return dateFormatterPrint.string(from: date)
    }

}
  
