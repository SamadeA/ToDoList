
import UIKit
import Firebase
import FirebaseDatabase



class AddViewController: UIViewController {
    
  var ref: DatabaseReference!
    

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if titleTextField.text == nil {return}
        if let masterTVC = segue.destination as? MasterTVC {
            masterTVC.toDoLists.append(List(name: titleTextField.text!, items: [notesTextField.text!]))
            let ref = Database.database().reference(withPath: "List")
      
            let groceryItem = GroceryItem(name: titleTextField.text!,
                                                      addedByUser: "Mr Wasay",
                                                      completed: false)
            print(titleTextField.text!)
            let groceryItemRef = ref.child((titleTextField.text!.lowercased()))
            groceryItemRef.setValue(groceryItem.toAnyObject())
        }
    }
}
