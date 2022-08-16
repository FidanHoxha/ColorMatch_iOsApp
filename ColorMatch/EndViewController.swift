//
//  EndViewController.swift
//  ColorMatch
//
//  Created by Fidan Hoxha on 16.8.22.
//

import UIKit

class EndViewController: UIViewController {
    
    @IBOutlet weak var correctAnsLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var multiplierLabel: UILabel!
    
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    @IBOutlet weak var firstResultLabel: UILabel!
    
    @IBOutlet weak var secondResultLabel: UILabel!
    
    var playerName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(playerName!)

    }

}
