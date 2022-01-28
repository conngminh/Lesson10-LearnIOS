//
//  ViewController.swift
//  Lesson10
//
//  Created by Lê Công Minh on 24/01/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var secondLoading: UIActivityIndicatorView!
    
    var timer: Timer? //bước 1: khởi tạo timer
    var second = 0 // Bước 2: biến second để hẹn giờ
    var showLoginSecond = 0
    var secondTimer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoading()
        setupSecondLoading()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        secondTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showLoginScreen), userInfo: nil, repeats: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginScreen")
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @objc func showLoginScreen() {
        showLoginSecond += 1
        if showLoginSecond == 5 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginScreen")
            //CÁCH SET FULL MÀN HÌNH
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overFullScreen
            //
            present(vc, animated: true, completion: nil)
            
            // Dừng timer
            secondTimer?.invalidate()
            secondTimer = nil
            
        }
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
    
    func setupSecondLoading() {
        secondLoading.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.secondLoading.stopAnimating()
            self.secondLoading.hidesWhenStopped = true
        }
    }
}

