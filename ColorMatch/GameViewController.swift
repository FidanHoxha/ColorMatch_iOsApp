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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "\(gameDurationStr)s"

        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerAction), userInfo: nil, repeats: Int(gameDurationStr)! > 0)
        
    }
    
    var substractTime = 1
    
    @objc func TimerAction() {
        var gameDuration = Int(gameDurationStr)!
        gameDuration -= substractTime
        substractTime += 1
        timeLabel.text = "\(gameDuration)s"
        print(gameDuration)
        // colorTesting()
        if(gameDuration <= 0) {
            myTimer.invalidate()
            let EndVC = storyboard?.instantiateViewController(withIdentifier: "end") as! EndViewController
            EndVC.modalPresentationStyle = .fullScreen
            present(EndVC, animated: true)
        }
    }

    @IBAction func didTapNoBtn(_ sender: Any) {
    }
    
    @IBAction func didTapYesBtn(_ sender: Any) {
    }
    
}
