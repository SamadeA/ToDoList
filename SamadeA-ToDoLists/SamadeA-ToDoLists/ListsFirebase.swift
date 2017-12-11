import Foundation
import Firebase

struct ListFirebase {
    
    var name: String
    let ref: DatabaseReference?
    var items: [String]
    var completed: Bool
    
    init(name: String, items:[String], completed: Bool) {
        self.name = name
        self.items = items
        self.completed = completed
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        name = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        items = [snapshotValue["items"] as! String]
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "items": items,
            "completed": completed
        ]
    }
    
//    func updateClouds(_ indexPath: Int) {
//        let toDoLists = toDoLists(name: ItemsTVC[String], completed: true)
//        let toDoListsRef = self.ref.child(name[ItemsTVC].lowercased())
//        toDoListsRef.setValue(toDoListsRef.toAnyObject())
//    }
}




