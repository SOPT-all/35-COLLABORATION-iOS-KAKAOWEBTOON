//
//  UITextField+.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/23/24.
//

import UIKit

extension UITextField {
    
    func configureDefaultSettings() {
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.autocapitalizationType = .none
        self.clearButtonMode = .always
        self.clearsOnBeginEditing = false
    }
    
    func setupLeftView(_ size: Int) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    func setupPlaceholder(
        text: String,
        color: UIColor = .grey6,
        font: UIFont = .appleSDGothicNeo(.body1_r_14),
        letterSpacing: CGFloat = KakaoWebtoonFont.body1_r_14.letterSpacing
    ) {
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: color,
                .font: font,
                .kern: letterSpacing
            ]
        )
        self.attributedPlaceholder = attributedString
    }
    
}

extension UITextField {
    
    func addCustomClearButton() {
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(.icDelete, for: .normal)
        clearButton.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        clearButton.contentMode = .scaleAspectFit
        clearButton.addTarget(self, action: #selector(clearText(sender:)), for: .touchUpInside)
        self.rightView = clearButton
        self.rightViewMode = .whileEditing
    }
    
    @objc
    private func clearText(sender: AnyObject) {
        self.text = ""
        sendActions(for: .editingChanged)
    }

}

extension UITextFieldDelegate {

}
