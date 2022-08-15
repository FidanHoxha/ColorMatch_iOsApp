//
//  EntryViewController.swift
//  ColorMatch
//
//  Created by Fidan Hoxha on 15.8.22.
//

import UIKit

class EntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Go to the Game View when Play Game button is tapped
    @IBAction func didTapPlayGameBtn() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    // Go to the Leaderboard View when Leaderboard button is tapped
    @IBAction func didTapLeaderboardBtn() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "leaderboard") as! LeaderboardViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

