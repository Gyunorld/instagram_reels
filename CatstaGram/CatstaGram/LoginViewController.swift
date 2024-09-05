//
//  LoginViewController.swift
//  CatstaGram
//
//  Created by 김민규 on 9/5/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // Optional
        // 값이 있을 수도 없을 수도
        let text = sender.text ?? ""    // 물음표 뒤에 값을 초기값으로 사용 -> optional
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    
    @IBAction func loginButtionDidTap(_ sender: UIButton) {
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
    }
    
}
