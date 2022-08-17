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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func didTapPlayAgainBtn(_ sender: Any) {
        let EntryVC = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        EntryVC.modalPresentationStyle = .fullScreen
        present(EntryVC, animated: true)
    }
    
    
    @IBAction func didTapLeaderboardBtn(_ sender: Any) {
        let LeaderboardVC = storyboard?.instantiateViewController(withIdentifier: "leaderboard") as! LeaderboardViewController
        LeaderboardVC.modalPresentationStyle = .fullScreen
        present(LeaderboardVC, animated: true)
    }
}
