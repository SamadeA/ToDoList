import UIKit
import Firebase
//import FirebaseAuth

class MasterTVC: UITableViewController {
    var list: [GroceryItem] = []
    var toDoLists: [List] = []
    let channelRefHand: DatabaseHandle? = nil
    let ref = Database.database().reference(withPath: "List")
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getDataFromFirebase()

         ref.queryOrdered(byChild: "completed").observe(.value, with: { snapshot in
            var newItems: [GroceryItem] = []
            
            for item in snapshot.children {
                let groceryItem = GroceryItem(snapshot: item as! DataSnapshot)
                newItems.append(groceryItem)
                 print(groceryItem.name)
            }
            self.list = newItems
            self.tableView.reloadData()
            print(self.list[3].name)
        })
    }
    deinit {
        if let refHandle = channelRefHand {
            ref.removeObserver(withHandle: refHandle)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoLists", for: indexPath) as? ListOfListCell
        cell?.textLabel?.text = list[(indexPath.row)].name
        cell?.row = indexPath.row
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ItemsTVC {
            if let cell = sender as? ListOfListCell {
                nextVC.list = toDoLists[cell.row]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoLists.remove(at:(indexPath.row))
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(toDoLists.count, "<<<")
        tableView.reloadData()
    }
    
    @IBAction func unwindToMaster(segue: UIStoryboardSegue) {
        print("We print unwind back to Master TVC")
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Goodbye!")
            navigationController?.popViewController(animated: true)
        } catch let error {
            print("Error while signin out: %@", error)
        }
    }
    
//    func getDataFromFirebase() {
//
//        let ref = Database.database().reference()
//        let id = Auth.auth().currentUser?.uid
//        ref.child("Users").child(id!).observe(.value) { (snapShot) in
//            print("*** We made it!")
//            if let value = snapShot.value as? [String: Any] {
//                print("\n Here is the value from the database: ", value, "******", "\n")
//                    self.toDoLists.append(List(name: value["list"] as! String, items: [String]()))
//                print("my value \(value)")
//                self.tableView.reloadData()
//
//            }
//        }
//
//    }

}
