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
    @IBOutlet weak var imgAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageAvatar()
    }
    
    func setupImageAvatar() {
        imgAvatar.layer.cornerRadius = 50
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.borderWidth = 1
        imgAvatar.layer.borderColor = UIColor.darkGray.cgColor
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
    
    
    @IBAction func tabOnLogOut(_ sender: Any) {
        let alert = UIAlertController(title: "Do you want to log out?", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Yes", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "No", style: .destructive, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
    
    
}
