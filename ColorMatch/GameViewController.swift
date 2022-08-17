import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var correctAnsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var multiplierLabel: UILabel!
    
    // Multiplier dot labels that will be manipulated
    @IBOutlet weak var dot1: UILabel!
    @IBOutlet weak var dot2: UILabel!
    @IBOutlet weak var dot3: UILabel!
    @IBOutlet weak var dot4: UILabel!
    
    @IBOutlet weak var firstCardLabel: UILabel!
    @IBOutlet weak var secondCardLabel: UILabel!
    
    // Initializing variables that will store game info data
    var secondCardFontColor = ""
    var gameDurationStr: String = ""
    var correctAnsCounter = 0
    var score = 0
    var multiplier = 1
    
    // Declaring a timer that will decrease and its substracting value
    var myTimer = Timer()
    var timeToSubtract = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display initial game duration
        timeLabel.text = "\(gameDurationStr)s"

        // Initialize the timer which calls function TimerAction every second until it goes to 0
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerAction), userInfo: nil, repeats: Int(gameDurationStr)! > 0)
        
        // Function which sets card meaning and font color
        colorSetter()
        
    }
    
    @IBAction func didTapNoBtn(_ sender: Any) {
        
        checkAnswer("No")
        
        correctAnsLabel.text = String(correctAnsCounter)
        scoreLabel.text = String(score)
        
        colorSetter()
    }
    
    @IBAction func didTapYesBtn(_ sender: Any) {
        
        checkAnswer("Yes")
        
        correctAnsLabel.text = String(correctAnsCounter)
        scoreLabel.text = String(score)
        
        colorSetter()
    }
    
    @objc func TimerAction() {
        var gameDuration = Int(gameDurationStr)!
        gameDuration -= timeToSubtract
        timeToSubtract += 1
        timeLabel.text = "\(gameDuration)s"
        if(gameDuration <= 0) {
            myTimer.invalidate()
            let EndVC = storyboard?.instantiateViewController(withIdentifier: "end") as! EndViewController
            EndVC.modalPresentationStyle = .fullScreen
            present(EndVC, animated: true)
        }
    }
    
    func colorSetter() {
        firstCardLabel.text = pickRandomColor()
        secondCardLabel.text = pickRandomColor()
        
        switch pickRandomColor() {
        case "black":
            secondCardLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0);
            secondCardFontColor = "black"
        case "blue":
            secondCardLabel.textColor = UIColor(red: 0/255, green: 140/255, blue: 255/255, alpha: 1.0);
            secondCardFontColor = "blue"
        case "red":
            secondCardLabel.textColor = UIColor(red: 255/255, green: 20/255, blue: 27/255, alpha: 0.8);
            secondCardFontColor = "red"
        case "yellow":
            secondCardLabel.textColor = UIColor(red: 255/255, green: 207/255, blue: 0/255, alpha: 1.0);
            secondCardFontColor = "yellow"
        default: print("An error has occurred!")
        }
        
    }
    
    func pickRandomColor() -> String {
        let randomNumber = Int.random(in: 1...4)
        var randomColor = ""

        switch randomNumber {
        case 1: randomColor = "black"
        case 2: randomColor = "blue"
        case 3: randomColor = "red"
        case 4: randomColor = "yellow"
        default: print("An error has occurred!")
        }
        
        return randomColor
    }
    
    func checkAnswer(_ btnTapped: String) {
        if (btnTapped == "No") && (firstCardLabel.text != secondCardFontColor) ||
            (btnTapped == "Yes") && (firstCardLabel.text == secondCardFontColor) {
                correctAnsCounter += 1
                score += (50 * multiplier)
                print("Score increased by \(50 * multiplier)")
                increaseMultiplier()
                print("Correct answer!")
        }
        else {
            decreaseMultiplier()
            print("Incorrect answer, counter not increasing")
        }
    }
    
    func increaseMultiplier() {
        // If multiplier has not reached its maximum value (10)
        if multiplier != 10 {
            if dot1.textColor == UIColor.white {
                dot1.textColor = UIColor.systemPink
                print("reached level 1")
            }
            else if dot2.textColor == UIColor.white {
                dot2.textColor = UIColor.systemPink
                print("reached level 2")

            }
            else if dot3.textColor == UIColor.white {
                dot3.textColor = UIColor.systemPink
                print("reached level 3")

            } else if dot4.textColor == UIColor.white {
                dot4.textColor = UIColor.systemPink
                print("reached level 4")
            }
            else {
                multiplier += 1
                multiplierLabel.text = String(multiplier)
                resetMultiplierDots()
                print("reached level 5")
            }
        }
    }
    
    func decreaseMultiplier() {
        // Reset multiplier dots
        resetMultiplierDots()
        
        // If multiplier is higher that its minimum value (1)
        if multiplier != 1 {
            multiplier -= 1
            multiplierLabel.text = String(multiplier)
        }
    }
    
    func resetMultiplierDots() {
        dot1.textColor = UIColor.white
        dot2.textColor = UIColor.white
        dot3.textColor = UIColor.white
        dot4.textColor = UIColor.white
    }
    
}
