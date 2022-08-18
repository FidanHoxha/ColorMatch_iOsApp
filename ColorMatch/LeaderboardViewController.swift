import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [ScoreTableItem]()
    
    override func viewDidLoad() {
        print("View did load gets called")
        super.viewDidLoad()
        title = "Score Table"
        getAllItems()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))

    }
    
    @objc private func didTapAdd() {
//        let alert = UIAlertController(title: "New Item", message: "Enter New Item", preferredStyle: .alert)
//        alert.addTextField(configurationHandler: nil)
//        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
//            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
//                return
//            }
//
//            self?.createScore(score: text) // changed function here
//        }))
//
//        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.score! // changed here
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = models[indexPath.row]
//        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
//        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
//
//            let alert = UIAlertController(title: "Edit Item", message: "Edit Your Item", preferredStyle: .alert)
//            alert.addTextField(configurationHandler: nil)
//            alert.textFields?.first?.text = item.score // changed here
//            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in
//                guard let field = alert.textFields?.first, let newScore = field.text, !newScore.isEmpty else {
//                    return
//                }
//
//                self?.updateItem(item: item, newScore: newScore) //changed here
//            }))
//
//            self.present(alert, animated: true)
//
//        }))
//        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
//            self?.deleteItem(item: item)
//        }))
//
//        present(sheet, animated: true)
    }
    
    func getAllItems() {
        do {
            models = try context.fetch(ScoreTableItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            // Error
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
            // Error
        }
    }
    
    func deleteItem(item: ScoreTableItem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            // Error
        }
    }
    
    func updateItem(item: ScoreTableItem, newScore: String) {
        item.score = newScore
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            // Error
        }
    }
}
