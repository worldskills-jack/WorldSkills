//
//  LoginViewController.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "LOGGED") {
            print("Logged")

            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBarController
            self.view.window?.rootViewController = vc
            self.view.window?.makeKeyAndVisible()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

    @IBAction func loginButton(_ sender: Any) {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}

        let buttonID = "login"
        
        userManager.userAuth(email: email, password: password, buttonID: buttonID) { (error) in

        }
        
    }
    
}
