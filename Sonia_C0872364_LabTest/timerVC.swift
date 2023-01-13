//
//  timerVC.swift
//  Sonia_C0872364_LabTest
//
//  Created by MacStudent on 2022-11-04.
//

import UIKit

class timerVC: UIViewController {

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timerPicker: UIDatePicker!
    @IBOutlet weak var timerLabel: UILabel!
    var secondsElapsed = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBtn.layer.cornerRadius = 0.5 * cancelBtn.frame.size.height
        startBtn.layer.cornerRadius = 0.5 * startBtn.frame.size.height
        pauseBtn.layer.cornerRadius = 0.5 * startBtn.frame.size.height
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelBtnAction() {
        timerLabel.text = "00:00:00"
        secondsElapsed = 0
        timerLabel.isHidden = true
        timerPicker.isHidden = false
        pauseBtn.isHidden = true
        startBtn.isHidden = false
        
    }
    
    
    @IBAction func statBtnACtion() {
        startBtn.isHidden = true
        pauseBtn.isHidden = false
        timerLabel.isHidden = false
        timerPicker.isHidden = true
        let currentTime = timerPicker.countDownDuration
        self.secondsElapsed = Int(currentTime)
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed -= 1
            let finalTime = self.secondsToHoursMinutesSeconds(Int(self.secondsElapsed))
            self.timerLabel.text = finalTime
            
        }
    }
    
    
    @IBAction func pauseBtnAction() {
        timer.invalidate()        
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
