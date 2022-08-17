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
        else if let text = playerNameField.text, text.isEmpty {
            // Player has not entered his name
            handleEmptyNameField()
        }
        else {
            // Player has not selected game duration
            handleNoGameDurationSelected()
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
    
    // Function to handle empty player name field error with alert
    func handleEmptyNameField() {
        
        let emptyPlayerNameAlert = UIAlertController(title: "Empty Player Name Field", message: "Please type your player name in the white field.", preferredStyle: .alert)
        
        emptyPlayerNameAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in print("User dismissed emptyPlayerNameAlert")}))
        
        present(emptyPlayerNameAlert, animated: true)
    }
    
    // Function to handle no game duration selected error with alerts
    func handleNoGameDurationSelected() {
        
        let durationNotSelectedAlert = UIAlertController(title: "Game Duration Not Selected", message: "Please click one of the blue buttons to select the duration of the game.", preferredStyle: .alert)
        
        durationNotSelectedAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in print("User dismissed durationNotSelectedAlert")}))
        
        present(durationNotSelectedAlert, animated: true)
    }


}

