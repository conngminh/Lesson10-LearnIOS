//
//  LoginVC.swift
//  Lesson10
//
//  Created by Lê Công Minh on 28/01/2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func tapOnLogin(_ sender: Any) {
        if tfUser.text == "" {
            //SHOW ALERT
            showAlert(titleAlert: "Please enter your username", titleAction: "Agree")
            return
        }
        
        if tfPassword.text == "" {
            //SHOW ALERT
            showAlert(titleAlert: "Please enter your password", titleAction: "Agree")
            return
        }
        
        showAlert(titleAlert: "LoginSuccess", titleAction: "OK")
    }
    
    func showAlert(titleAlert: String, titleAction: String) {
        //SHOW ALERT
        let alert = UIAlertController(title: titleAlert, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: titleAction, style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
