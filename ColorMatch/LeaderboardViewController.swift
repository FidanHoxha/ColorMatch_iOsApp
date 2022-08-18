import UIKit

class ScoreListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [ScoreTableItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your Score List"
        getAllItems()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.backgroundView = UIImageView(image: UIImage(named: "gradient-background.png")!)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done , target: self, action: #selector(didTapBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        let addScoreAlert = UIAlertController(title: "Add New Score", message: "Add player name and score                               (ex. John Doe - 12650 points)", preferredStyle: .alert)
        addScoreAlert.addTextField(configurationHandler: nil)
        addScoreAlert.addAction(UIAlertAction(title: "Submit Score", style: .cancel, handler: { [weak self] _ in
            guard let field = addScoreAlert.textFields?.first, let addedScore = field.text, !addedScore.isEmpty else {
                return
            }

            self?.createScore(score: addedScore)
        }))

        present(addScoreAlert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(model.score!) - \(model.createdAt!)"
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let scoreRow = models[indexPath.row]
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit Score", style: .default, handler: { _ in

            let editScoreAlert = UIAlertController(title: "Edit Score", message: "Edit Your Score", preferredStyle: .alert)
            editScoreAlert.addTextField(configurationHandler: nil)
            editScoreAlert.textFields?.first?.text = scoreRow.score
            editScoreAlert.addAction(UIAlertAction(title: "Save Score", style: .cancel, handler: { [weak self] _ in
                guard let field = editScoreAlert.textFields?.first, let newScore = field.text, !newScore.isEmpty else {
                    return
                }

                self?.updateScore(item: scoreRow, newScore: newScore)
            }))

            self.present(editScoreAlert, animated: true)

        }))
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
    
    // ========== Core Data Functions ==========
    
    func getAllItems() {
        do {
            models = try context.fetch(ScoreTableItem.fetchRequest())
            
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
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print("Error in updateScore function of Core Data")
        }
    }
}
