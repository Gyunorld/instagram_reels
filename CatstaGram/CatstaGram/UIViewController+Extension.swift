//
//  UIViewController+Extension.swift
//  CatstaGram
//
//  Created by 김민규 on 9/9/24.
//

import UIKit

// 텍스트의 구간별 색상을 다르게 할 때 사용
extension UIViewController {
    func generateButtonAttribute(_ button: UIButton,
                                 texts: String..., // ... => 복수의 파라미터를 받을 수 있음
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString{  // 속성이 적용된 String으로 변경
        // UIButton에 입력된 text를 가져옴
        guard let wholeText = button.titleLabel?.text else {fatalError("버튼에 텍스트가 없음")}
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        // 설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        // 설정하고자 하는 색상들
        let customColors = colors
        
        // attribute 객체를 생성함
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        // 텍스트에 맞는 설정을 추가
        texts.indices.forEach { index in
            attributedString.addAttribute(.font,
                                           value: customFonts[index],
                                           range: customTextsRanges[index])
            attributedString.addAttribute(.foregroundColor,
                                           value: customColors[index],
                                           range: customTextsRanges[index])
        }
        return attributedString
    }
}
