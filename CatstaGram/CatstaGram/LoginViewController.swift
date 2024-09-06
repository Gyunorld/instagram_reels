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
        // 화면전환
        // 1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController // as로 타입 다운캐스팅
        
        // 3. 화면전환 메소드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
//        화면이 아래에서 위로 전환
        self.navigationController?.pushViewController(registerViewController, animated: true)
//        상세로 들어갈 때 navigation사용
    }
    
}
