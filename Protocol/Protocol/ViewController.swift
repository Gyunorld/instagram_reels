//
//  ViewController.swift
//  Protocol
//
//  Created by 김민규 on 9/9/24.
//

import UIKit

protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}

// protocol
class Person : Flyable, Runnable {
    func run() {
        print("달린다")
    }
    
    func fly() {
        print("날았다")
    }
}


protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {
    
    let person = Person()
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate : ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        person.fly()
        person.run()
    }


}

