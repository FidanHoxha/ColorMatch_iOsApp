//
//  GameViewController.swift
//  ColorMatch
//
//  Created by Fidan Hoxha on 15.8.22.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var correctAnsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var multiplierLabel: UILabel!
    
    @IBOutlet weak var dot1: UILabel!
    @IBOutlet weak var dot2: UILabel!
    @IBOutlet weak var dot3: UILabel!
    @IBOutlet weak var dot4: UILabel!
    
    @IBOutlet weak var firstCardLabel: UILabel!
    @IBOutlet weak var secondCardLabel: UILabel!
    
    var gameDurationStr: String = ""
    var myTimer = Timer()
    var substractTime = 1
    var secondCardFontColor = ""
    var correctAnsCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "\(gameDurationStr)s"

        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerAction), userInfo: nil, repeats: Int(gameDurationStr)! > 0)
        
        colorSetting()
        
        
    }
    
    @IBAction func didTapNoBtn(_ sender: Any) {
        if firstCardLabel.text != secondCardFontColor {
            answeredCorrectly()
        }
        else {
            answeredIncorrectly()
        }
        correctAnsLabel.text = String(correctAnsCounter)
        colorSetting()
    }
    
    @IBAction func didTapYesBtn(_ sender: Any) {
        if firstCardLabel.text == secondCardFontColor {
            answeredCorrectly()
        }
        else {
            answeredIncorrectly()
        }
        correctAnsLabel.text = String(correctAnsCounter)
        colorSetting()
    }
    
    @objc func TimerAction() {
        var gameDuration = Int(gameDurationStr)!
        gameDuration -= substractTime
        substractTime += 1
        timeLabel.text = "\(gameDuration)s"
        if(gameDuration <= 0) {
            myTimer.invalidate()
            let EndVC = storyboard?.instantiateViewController(withIdentifier: "end") as! EndViewController
            EndVC.modalPresentationStyle = .fullScreen
            present(EndVC, animated: true)
        }
    }
    
    func colorSetting() {
        
        firstCardLabel.text = pickRandomColor()
        secondCardLabel.text = pickRandomColor()
        
        switch pickRandomColor() {
        case "black":
            secondCardLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0);
            secondCardFontColor = "black"
        case "blue":
            secondCardLabel.textColor = UIColor(red: 0/255, green: 140/255, blue: 255/255, alpha: 1.0);
            secondCardFontColor = "blue"
        case "red":
            secondCardLabel.textColor = UIColor(red: 255/255, green: 20/255, blue: 27/255, alpha: 0.8);
            secondCardFontColor = "red"
        case "yellow":
            secondCardLabel.textColor = UIColor(red: 255/255, green: 207/255, blue: 0/255, alpha: 1.0);
            secondCardFontColor = "yellow"
        default: print("An error has occurred!")
        }
        
    }
    
    func pickRandomColor() -> String {
        let randomNumber = Int.random(in: 1...4)
        var randomColor = ""

        switch randomNumber {
        case 1: randomColor = "black"
        case 2: randomColor = "blue"
        case 3: randomColor = "red"
        case 4: randomColor = "yellow"
        default: print("An error has occurred!")
        }
        
        return randomColor
    }
    
    func answeredCorrectly() {
        correctAnsCounter += 1
        print("Correct answer!")
    }
    
    func answeredIncorrectly() {
        print("Incorrect answer, counter not increasing")
    }
    
}
