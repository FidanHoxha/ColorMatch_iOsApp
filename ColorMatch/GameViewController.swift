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
    
    var gameDurationStr: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        var gameDuration = Int(gameDurationStr!)
    }

    @IBAction func didTapNoBtn(_ sender: Any) {
    }
    
    @IBAction func didTapYesBtn(_ sender: Any) {
    }
    
}
