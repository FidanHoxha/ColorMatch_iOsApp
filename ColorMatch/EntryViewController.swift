import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet weak var playerNameField: UITextField!
    
    var gameDuration = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTap30sBtn(_ sender: Any) {
        gameDuration = 30
    }
    
    @IBAction func didTap60sBtn(_ sender: Any) {
        gameDuration = 60
    }
    
    @IBAction func didTap90sBtn(_ sender: Any) {
        gameDuration = 90
    }
    
    // When Play Game button is tapped
    @IBAction func didTapPlayGameBtn() {
        
        // User input error checking
        if (playerNameField.text != nil) && (gameDuration != 0) {
            
            // Create instances of view controllers
            let GameVC = storyboard?.instantiateViewController(withIdentifier: "game") as! GameViewController
            
            // Send user input to other view controllers
            GameVC.playerName = playerNameField.text!
            GameVC.gameDurationStr = String(gameDuration)
            
            // Go to Game View
            GameVC.modalPresentationStyle = .fullScreen
            present(GameVC, animated: true)
        }
        else if playerNameField == nil {
            // Handle empty player name field error with alerts
            print("Please enter player name")
        }
        else {
            // Handle no game duration selected error with alerts
            print("Please select a game duration")
        }
        
    }
    
    // Go to the Leaderboard View when Leaderboard button is tapped
    @IBAction func didTapLeaderboardBtn() {
        let LeaderboardVC = storyboard?.instantiateViewController(withIdentifier: "leaderboard") as! LeaderboardViewController
        LeaderboardVC.modalPresentationStyle = .fullScreen
        present(LeaderboardVC, animated: true)
    }
    

}

