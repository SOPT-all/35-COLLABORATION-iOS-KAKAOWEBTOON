//
//  UILabel+.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/18/24.
//

import UIKit

extension UILabel {
    func applyStyle(fontStyle: KakaoWebtoonFont) {
        let text = self.text ?? " "
        
        let lineHeight = fontStyle.lineHeight
        let letterSpacing = fontStyle.letterSpacing
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes.updateValue(letterSpacing, forKey: .kern)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        
        attributes.updateValue(paragraphStyle, forKey: .paragraphStyle)
        attributes.updateValue((lineHeight - font.lineHeight) / 2, forKey: .baselineOffset)
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        self.attributedText = attributedString
    }
}
