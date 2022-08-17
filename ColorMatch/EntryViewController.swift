import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet weak var playerNameField: UITextField!
    
    
    @IBOutlet weak var btn30s: UIButton!
    @IBOutlet weak var btn60s: UIButton!
    @IBOutlet weak var btn90s: UIButton!
    
    var gameDuration = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background of all game duration buttons to Teal
        setTealBtnBackground()
    }
    
    // Set game duration and highlight based on button tapped
    @IBAction func didTap30sBtn(_ sender: Any) {
        gameDuration = 30
        setTealBtnBackground()
        btn30s.backgroundColor = UIColor.systemIndigo
    }
    
    @IBAction func didTap60sBtn(_ sender: Any) {
        gameDuration = 60
        setTealBtnBackground()
        btn60s.backgroundColor =  UIColor.systemIndigo
    }
    
    @IBAction func didTap90sBtn(_ sender: Any) {
        gameDuration = 90
        setTealBtnBackground()
        btn90s.backgroundColor =  UIColor.systemIndigo
    }
    
    // When Play Game button is tapped
    @IBAction func didTapPlayGameBtn() {
        
        // User input error checking
        if (playerNameField.text != nil) && (gameDuration != 0) {
            
            // Send player name and game duration to Game View
            let GameVC = storyboard?.instantiateViewController(withIdentifier: "game") as! GameViewController
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
    
    // Set the background of all game duration buttons to teal (unhighlighted)
    func setTealBtnBackground() {
        btn30s.backgroundColor =  UIColor.systemTeal
        btn60s.backgroundColor =  UIColor.systemTeal
        btn90s.backgroundColor =  UIColor.systemTeal
    }

}

