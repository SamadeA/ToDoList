

import UIKit




class DetailViewController: UIViewController {

   
    @IBOutlet weak var itemTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if itemTextField.text == nil {return}
        if let itemTVC = segue.destination as? ItemsTVC {
            itemTVC.list.items.append(itemTextField.text!)
        }
        
        
    }

}

