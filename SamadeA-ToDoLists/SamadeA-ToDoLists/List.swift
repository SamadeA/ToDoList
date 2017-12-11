

import Foundation

//Here we are modeling a real world thing in code.  This is why we call it a model.  This is the blueprint for the objects that we are going to create.  Struct stands for structure.  Structs are passed (assigned: let newStruct = originalStruct), by copy, this means (changes to originalStruct do not affect newStruct, this isn't true for classes.  If you change the property on an assigned class, it changes for both: let newClass = firstClass, changes to newClass affect firstClass).

class List {
    
    //A todo list has a name
    var name: String
    
    //A todo list has a list of items.
    var items: [String]
    init(name: String,items:[String]) {
        self.name = name
        self.items = items
    }
}
