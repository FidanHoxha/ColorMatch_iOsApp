import UIKit

class EndViewController: UIViewController {
    
    @IBOutlet weak var correctAnsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var multiplierTextLabel: UILabel!
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var firstResultLabel: UILabel!
    @IBOutlet weak var secondResultLabel: UILabel!
    
    // Variables that will hold data passed from other views
    var correctAnsCounter: String = ""
    var score: String = ""
    var multiplier: String = ""
    var multiplierBonus = 0
    var totalScore = 0
    var playerName: String = ""
    var gameDurationStr: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayGameResult()
    }

    // When Play Again button is tapped
    @IBAction func didTapPlayAgainBtn(_ sender: Any) {
        let EntryVC = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        
        // Fill the playerName field with previously entered name if Play Again button is tapped
        EntryVC.previousGameName = playerName
        
        // Go to Entry View
        EntryVC.modalPresentationStyle = .fullScreen
        present(EntryVC, animated: true)
    }
    
    // Go to the Score List View when Score List button is tapped
    @IBAction func didTapScoreListBtn(_ sender: Any) {
        // Navigation sends directly to Score List View
        let NavigationVC = storyboard?.instantiateViewController(withIdentifier: "navigation") as! UINavigationController
        NavigationVC.modalPresentationStyle = .fullScreen
        present(NavigationVC, animated: true)
    }
    
    // Display game data to labels
    func displayGameResult() {
        correctAnsLabel.text = correctAnsCounter
        scoreLabel.text = score
        multiplierTextLabel.text = "Multiplier x\(multiplier) bonus: "
        // Cast multiplier to Int, calculate bonus and cast back to String
        multiplierLabel.text = String(Int(multiplier)! * 250)
        totalScoreLabel.text = calculateTotalScore()
        firstResultLabel.text = "\(playerName) has scored a total"
        secondResultLabel.text = "of \(totalScore) points in \(gameDurationStr)s"
    }
    
    func calculateTotalScore() -> String {
        // Calculate multiplier bonus and add to score
        multiplierBonus = Int(multiplier)! * 250
        totalScore = Int(score)! + multiplierBonus
        return String(totalScore)
    }
    
}
