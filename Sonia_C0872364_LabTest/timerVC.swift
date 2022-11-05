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
        
        
    }
    
    
    @IBAction func statBtnACtion() {
        startBtn.isHidden = true
        pauseBtn.isHidden = false
        timerLabel.isHidden = false
        timerPicker.isHidden = true
        let currentTime = getTime(sender: timerPicker)
        self.secondsElapsed = Int(currentTime) ?? 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed -= 1
            self.timerLabel.text = "\(self.secondsElapsed)"
        }
    }
    
    
    @IBAction func pauseBtnAction() {
        
    }
    
    private func getTime(sender:UIDatePicker) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        let ouptputTime = dateFormatter.string(from: sender.date)
        let timeArray = ouptputTime.components(separatedBy: ":")
        let calHours = Int(timeArray[0]) ?? 0 * 3600
        let calMinutes = Int(timeArray[1]) ?? 0 * 60
        let calSeconds = Int(timeArray[2]) ?? 0
        let finalTime = calHours + calMinutes + calSeconds
        return "\(finalTime)"
    }
    
}
