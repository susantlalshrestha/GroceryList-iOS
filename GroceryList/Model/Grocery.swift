//
//  Grocery.swift
//  GroceryList
//
//  Created by SusantShrestha on 1/26/24.
//

import Foundation
import Firebase

struct GroceryItem {
    //MARK: - This will be the item saved on Firebase
    let ref: DatabaseReference? //reference this item in the database
    let key: String //the key
    let name: String //the name of the item
    let addedByUser: String //which user added this
    var completed: Bool //boolean if the grocery has been marked as complete
    
    init (key: String = "", name: String, addedByUser: String, completed: Bool) {
        self.ref = nil
        self.key = key
        self.name = name
        self.addedByUser = addedByUser
        self.completed = completed
    }
    
    init?(snapshot: DataSnapshot) {
        //MARK: - Database is taking a snapshot of the grocery item once it has been initialized and stored on the database. Snapshot is taken from the database. Will retrieve what has been uploaded
        guard
            //Use the value to get information about uploaded grocery item
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let addedByUser = value["addedByUser"] as? String,
            let completed = value["completed"] as? Bool else {
            return nil //if not completed yet, will return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
        self.addedByUser = addedByUser
        self.completed = completed
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "addedByUser": addedByUser,
            "completed": completed
        ]
    }
}
