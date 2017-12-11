//
//  SignUpAndSignInVC.swift
//  SamadeA-ToDoLists
//
//  Created by AbdulSamade on 10/27/17.
//  Copyright © 2017 AbdulSamade. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpAndSignInVC: UIViewController {

    var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func signinButton(_ sender: Any) {
        
        
        Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) {
            (user, error) in
            
            if user != nil && error == nil {
                Common.shared.user = user
                self.performSegue(withIdentifier: "toToDoLists", sender: "")
                print("LOGIN : The user is logged in now as \(user?.email!)")
                print("LOGIN : The user is logged in now as \(user?.email!)")
                print("LOGIN : The user is logged in now as \(user?.email!)")
            } else {
                print("Here is the error: \(error)")
                print("Here is the user: \(user)")
            }
            
        }

    }
    
    @IBAction func signupButton(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Signup", message: "Sign up", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                
                Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!)
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        self.performSegue(withIdentifier: "toToDoLists", sender: "")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Auth.auth().createUser(withEmail: "abdul_samade001@yahoo.com", password: "Password") { (user, error) in }
        
    }
}
