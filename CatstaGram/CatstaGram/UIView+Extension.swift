//
//  UIView+Extension.swift
//  CatstaGram
//
//  Created by 김민규 on 9/9/24.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
