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
//            showAlert(titleAlert: "Please enter your username", titleAction1: "Agree", titleAction2: "Dissmiss")
            let vc = PopupShowAlert(nibName: "PopupShowAlert", bundle: nil)
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overFullScreen
            vc.alertStr = "Please enter your username"
            present(vc, animated: true, completion: nil)
            return
        }
        
        if tfPassword.text == "" {
            //SHOW ALERT
//            showAlert(titleAlert: "Please enter your password", titleAction1: "Agree", titleAction2: "Dissmiss")
            let vc = PopupShowAlert(nibName: "PopupShowAlert", bundle: nil)
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overFullScreen
            vc.alertStr = "Please enter your password"
            present(vc, animated: true, completion: nil)
            return
        }
        
        showAlert(titleAlert: "LoginSuccess", titleAction1: "YES", titleAction2: "NO")
    }
    
    func showAlert(titleAlert: String, titleAction1: String, titleAction2: String) {
        //SHOW ALERT
        let alert = UIAlertController(title: titleAlert, message: nil, preferredStyle: .alert)
        let actionYes = UIAlertAction(title: titleAction1, style: .default, handler: nil)
        let actionNo = UIAlertAction(title: titleAction2, style: .destructive) { action in
            self.tfUser.text = ""
            self.tfPassword.text = ""
        }
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        present(alert, animated: true, completion: nil)
    }
    
}
