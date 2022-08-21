import Foundation
import CoreData

// An extension of our ScoreTableItem class
extension ScoreTableItem {

    // A fetch request through which we query our Score List Items
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScoreTableItem> {
        return NSFetchRequest<ScoreTableItem>(entityName: "ScoreTableItem")
    }

    // Properties saved in Core Data
    @NSManaged public var score: String?
    @NSManaged public var createdAt: Date?

}

extension ScoreTableItem : Identifiable {

}
