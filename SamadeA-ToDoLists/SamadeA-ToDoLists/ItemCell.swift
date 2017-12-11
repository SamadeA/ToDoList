

import UIKit
//Here is a custom cell, it is a subclass of UITableViewCell
class ItemCell: UITableViewCell {
    
    //Here is a connection to the storyboard.  IB stands for Interface Builder.  Outlet denotes a connection to the interface builder.  weak is something we haven't gone over.  It is a keyword that makes sure this label is deallocated from memory when it isn't needed anymore.  itemLabel is of type UILabel, and UILabel has a property on it called text which is a string that is displayed. 
    @IBOutlet weak var itemLabel: UILabel!
    
}
