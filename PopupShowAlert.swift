//
//  PopupShowAlert.swift
//  Lesson10
//
//  Created by Lê Công Minh on 28/01/2022.
//

import UIKit

class PopupShowAlert: UIViewController {

    @IBOutlet weak var viewAlert: UIView!
    @IBOutlet weak var imgAlert: UIImageView!
    @IBOutlet weak var lbAlert: UILabel!

    @IBOutlet weak var btClose: UIButton!
    var alertStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        viewAlert.layer.cornerRadius = 10
        viewAlert.layer.masksToBounds = true
        view.isOpaque = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        lbAlert.text = alertStr
    }
    
    
    @IBAction func tapOnClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
