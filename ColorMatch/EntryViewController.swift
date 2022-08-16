//
//  EntryViewController.swift
//  ColorMatch
//
//  Created by Fidan Hoxha on 15.8.22.
//

import UIKit

class EntryViewController: UIViewController {
    
    
    @IBOutlet weak var playerNameField: UITextField!
    
    var gameDuration = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTap20sBtn(_ sender: Any) {
        gameDuration = 20
    }
    
    @IBAction func didTap40sBtn(_ sender: Any) {
        gameDuration = 40
    }
    
    @IBAction func didTap60sBtn(_ sender: Any) {
        gameDuration = 60
    }
    
    // When Play Game button is tapped
    @IBAction func didTapPlayGameBtn() {
        // Calls function which saves user input
        saveUserInput()
        
        // Go to Game View
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
    
    func saveUserInput() {
        let playerName = playerNameField.text
        print("Player name is \(playerName!)")
        print("Game duration is \(gameDuration)")
        print("Function works")
    }

}

