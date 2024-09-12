//
//  LoginViewController.swift
//  CatstaGram
//
//  Created by 김민규 on 9/5/24.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?

    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }
    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // Optional
        // 값이 있을 수도 없을 수도
        let text = sender.text ?? ""    // 물음표 뒤에 값을 초기값으로 사용 -> optional
        
//        if text .isValidEmail() {
//            self.loginButton.backgroundColor = .facebook
//        } else {
//            self.loginButton.backgroundColor = .disabledButton
//        }
//        ==> 삼항연산자로 한 줄로 작성할 수 있음
        self.loginButton.backgroundColor 
        = text.isValidEmail() ? .facebook : .disabledButton
        
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor
        = text.count > 2 ? .facebook : .disabledButton
        
        self.password = text
    }
    
    
    @IBAction func loginButtionDidTap(_ sender: UIButton) {
        // 회원가입정보를 전달받아서, 그것과 textField 데이터가 일치하면,
        // 로그인이 되어야 함
        guard let userInfo = self.userInfo else { return }
        // -> guard를 이용하면 값이 없는 경우 login버튼이 실행되지않음
        if userInfo.email == self.email
            && userInfo.password == self.password {
            // Enabled 체크여부 확인 --> 체크해제시 동작안함
            let vc = storyboard?
                .instantiateViewController(withIdentifier: "TabBarVC") as!UITabBarController
//            vc.modalPresentationStyle = .fullScreen // fullScreen으로 화면 전환
//            self.present(vc, animated: true, completion: nil) ==> 로그인 화면이 남아있음
            // 로그인 화면이 남아있지 않음 --> 메모리 사용량 감소
            self.view.window?.windowScene?.keyWindow?.rootViewController = vc
        } else {
            
        }
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
        // ARC -> 강한참조 / 약한참조 -> ARC 낮춰줌
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    private func setupAttribute(){
        // registerButton
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
