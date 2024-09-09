//
//  SecondViewController.swift
//  Protocol
//
//  Created by 김민규 on 9/9/24.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate { // 상속과 같은 형태로 위임(delegate)
    // 기능을 정의
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
    
    
    @IBOutlet weak var textField: UITextField!
    var previousViewController : ViewController?
    
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
     dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousViewController?.delegate = self
    }
    
}
