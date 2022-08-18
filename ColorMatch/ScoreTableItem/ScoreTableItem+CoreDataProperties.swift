import Foundation
import CoreData


extension ScoreTableItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScoreTableItem> {
        return NSFetchRequest<ScoreTableItem>(entityName: "ScoreTableItem")
    }

    @NSManaged public var score: String?
    @NSManaged public var createdAt: Date?

}

extension ScoreTableItem : Identifiable {

}
