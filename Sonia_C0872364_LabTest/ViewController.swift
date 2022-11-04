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
    @IBOutlet weak var resetBtnlabel: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var secondsElapsed = 0
    var timer = Timer()
    var lapsData: [String] = []
    
    @IBAction func startBtn() {
        
        startBtnLabel.isHidden = true
        stopBtnLabel.isHidden = false
        lapBtnLabel.isHidden = false
        resetBtnlabel.isHidden = true
        
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed += 1
            let finalTime = self.secondsToHoursMinutesSeconds(Int(self.secondsElapsed))
            self.timerLabel.text = finalTime
            
        }
        
    }
    
    
    @IBAction func lapBtn() {
        let currentLapValue = timerLabel.text
        lapsData.append(currentLapValue!)
        
        tableView.isHidden = false
        tableView.reloadData()
        
    }
    
    
   
    @IBAction func stopBtn() {
        timer.invalidate()
        stopBtnLabel.isHidden = true
        startBtnLabel.isHidden = false
        lapBtnLabel.isHidden = true
        resetBtnlabel.isHidden = false
    }
    
    
    @IBAction func resetBtn() {
        timerLabel.text = "00:00:00"
        secondsElapsed = 0
        self.lapsData = []
        tableView.isHidden = true
        tableView.reloadData()
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


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = lapsData[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.text = "Lap \(indexPath.row+1)"
        cell.detailTextLabel?.textColor = .black
        return cell
    }
    
    
    
}
  
