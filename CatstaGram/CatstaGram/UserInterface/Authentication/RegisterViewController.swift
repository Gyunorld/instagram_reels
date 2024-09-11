//
//  RegisterViewController.swift
//  CatstaGram
//
//  Created by 김민규 on 9/6/24.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    // closure를 통해서 전달
//    var passEmail: ((email) -> Void)?
//    var passName: ((name) -> Void)?
//    var passNickname: ((nickname) -> Void)?
//    var passPassword: ((password) -> Void)? ==>  비효율적이므로 구조체를 만들어서 전달
    
    var userInfo: ((UserInfo) -> Void)?
    
    // 유효성검사를 위한 프로퍼티
    var isValidEmail = false{
        didSet{ // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidName = false{
        didSet{ // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidNickName = false{
        didSet{ // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false{
        didSet{ // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var popToLoginButton: UIButton!
    //Textfields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
        setupAttribute()
        
        // bug fix
        // 스와이프해서 뒤로 가기
        self.navigationController?
            .interactivePopGestureRecognizer?.delegate = nil
    }
    
    
    //MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField: 
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
            
        case nicknameTextField:
            self.isValidNickName = text.count > 2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        default:
            fatalError("Missing TextField...")
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        // 뒤로가기
        self.navigationController?
            .popViewController(animated: true)
    }
    
    @IBAction func registerButtonDidtap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    
    //MARK: - Helpers
    private func setUpTextField(){
        
        textFields.forEach {tf in
            tf.addTarget(self,
                         action:#selector(textFieldEditingChanged(_:)),
                         for: .editingChanged)
        }
    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> 버튼 활성화
    private func validateUserInfo(){
        if isValidEmail
            && isValidName
            && isValidNickName
            && isValidPassword {
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebook
            }
            
        } else {
            // 유효성검사 -> 유효하지않음
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.disabledButton
            }
        }
    }
    
    private func setupAttribute(){
        // registerButton
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self
            .popToLoginButton
            .setAttributedTitle(attributes, for: .normal)
    }
}

// 정규표현식 --> 유효성 검사 실행
extension String {
    // 대문자, 소문자, 특수문자, 숫자 8자 이상일 때, -> True
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)

        return passwordValidation.evaluate(with: self)
    }
    
    // @ 2글자
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
