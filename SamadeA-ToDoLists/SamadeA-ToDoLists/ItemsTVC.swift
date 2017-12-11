

import UIKit

class ItemsTVC: UITableViewController {

    //Here we have items which has default values, however we are overwriting the values from the other viewcontroller that is passing toDoLists to this view controller.
    var list: List!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.ref.observe(.value, with: { snapshot in
//            print(snapshot.value)
//        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    //Here is where we are defining the number Of Rows to be displayed in the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //The number of rows in the table will be equal to the number of items in the items array.
        return list.items.count
    }
    
    //Here is where we are configuring the cell.  We are once again (as in the MasterTVC), defining the function that the tableview calls every time it needs to prepare a cell to display.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Here we are creating the cell same as in MasterTVC except we have a different custom cell: ItemCell.  
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCellID") as? ItemCell
        
        //here we are setting the label same as in MasterTVC
        cell?.itemLabel.text = list.items[indexPath.row]
        return cell!
    }

    @IBAction func unwindToItems(segue: UIStoryboardSegue) {}

}
