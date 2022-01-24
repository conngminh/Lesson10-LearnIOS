//
//  ViewController.swift
//  Lesson10
//
//  Created by Lê Công Minh on 24/01/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var timer: Timer? //bước 1: khởi tạo timer
    var second = 0 // Bước 2: biến second để hẹn giờ
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoading()
    }

    func setupLoading() {
        loading.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:  #selector(hideLoading), userInfo: nil, repeats: true) //bước 1.1: khởi tạo timer
    }
    
    @objc func hideLoading() {
        second += 1
        if second == 10 {
            loading.stopAnimating()
            loading.hidesWhenStopped = true
            //dừng timer
            timer?.invalidate()
            timer = nil //huỷ toàn bộ timer
            //
            
        }
        print(second)
    }
}

