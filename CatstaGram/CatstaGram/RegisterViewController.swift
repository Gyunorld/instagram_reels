//
//  RegisterViewController.swift
//  CatstaGram
//
//  Created by 김민규 on 9/6/24.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Properties
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
    }
    
    
    //MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField: self.isValidEmail = text.isValidEmail()
        case nameTextField: self.isValidName = text.count > 2
        case nicknameTextField: self.isValidNickName = text.count > 2
        case passwordTextField: self.isValidPassword = text.isValidPassword()
        default:
            fatalError("Missing TextField...")
        }
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
