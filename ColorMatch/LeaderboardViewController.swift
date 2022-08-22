import UIKit

// Our class with Delegate and DataSource protocols for table view
class ScoreListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Creating the context from AppDelegate so we can modify the database through it
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Creating a table view and identifying its cell
    let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    // Variable to store the array of items
    private var models = [ScoreTableItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your Score List"
        getAllItems()
        // Adding the tableview as a subview and modifying some attributes
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.backgroundView = UIImageView(image: UIImage(named: "gradient-background.png")!)
        
        // Adding the Back and Add buttons in the navigation bar
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done , target: self, action: #selector(didTapBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    // When the Add button is tapped
    @objc private func didTapAdd() {
        // Creating an alert with a text field to get user input (score)
        let addScoreAlert = UIAlertController(title: "Add New Score", message: "Add player name and score                               (ex. John Doe - 12650 points)", preferredStyle: .alert)
        addScoreAlert.addTextField(configurationHandler: nil)
        addScoreAlert.addAction(UIAlertAction(title: "Submit Score", style: .cancel, handler: { [weak self] _ in
            guard let field = addScoreAlert.textFields?.first, let addedScore = field.text, !addedScore.isEmpty else {
                return
            }
            
            // Calling createScore function and passing the data in text field as an argument                                                                                  
            self?.createScore(score: addedScore)
        }))

        present(addScoreAlert, animated: true)
    }
    
    // Function for number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    // Creating a table cell, customising it and filling it with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(model.score!) - \(model.createdAt!)"
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
        return cell
    }
    
    // When a row in table view is clicked, open a sheet with 3 actions (Cancel, Edit and Delete)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let scoreRow = models[indexPath.row]
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        // Cancel action closes the sheet
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        // Edit action opens an alert with a text field to change the score
        sheet.addAction(UIAlertAction(title: "Edit Score", style: .default, handler: { _ in

            let editScoreAlert = UIAlertController(title: "Edit Score", message: "Edit Your Score", preferredStyle: .alert)
            editScoreAlert.addTextField(configurationHandler: nil)
            editScoreAlert.textFields?.first?.text = scoreRow.score
            editScoreAlert.addAction(UIAlertAction(title: "Save Score", style: .cancel, handler: { [weak self] _ in
                guard let field = editScoreAlert.textFields?.first, let newScore = field.text, !newScore.isEmpty else {
                    return
                }
                
                // Calling updateScore function and passing the data in text field (new/edited score) as an argument
                self?.updateScore(item: scoreRow, newScore: newScore)
            }))

            self.present(editScoreAlert, animated: true)

        }))
        
        // Delete action which calls the deleteScore function for that row
        sheet.addAction(UIAlertAction(title: "Delete Score", style: .destructive, handler: { [weak self] _ in
            self?.deleteScore(item: scoreRow)
        }))

        present(sheet, animated: true)
    }
    
    // Go to Entry View when Back button is tapped
    @objc private func didTapBack() {
        let EntryVC = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        EntryVC.modalPresentationStyle = .fullScreen
        present(EntryVC, animated: true)
    }
    
    // ========== Core Data CRUD Operations ==========
    
    func getAllItems() {
        do { 
            // Getting and storing the array of items
            models = try context.fetch(ScoreTableItem.fetchRequest())
            
            // Reloading the UI from the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print("Error in getAllItems function of Core Data")
        }
    }
    
    func createScore(score: String) {
        let newScore = ScoreTableItem(context: context)
        newScore.score = score
        newScore.createdAt = Date()
        
        // Save the change and present the now changed list
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Error in createScore function of Core Data")
        }
    }
    
    func deleteScore(item: ScoreTableItem) {
        context.delete(item)
        
        // Save the change and present the now changed list
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Error in deleteScore function of Core Data")
        }
    }
    
    func updateScore(item: ScoreTableItem, newScore: String) {
        item.score = newScore
        
        // Save the change and present the now changed list
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Error in updateScore function of Core Data")
        }
    }
}
