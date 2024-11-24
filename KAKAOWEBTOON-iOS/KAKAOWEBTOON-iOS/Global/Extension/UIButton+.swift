//
//  UIButton.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/24/24.
//
import UIKit

enum kindType: String {
    case new = "신작"
    case done = "완결"
    case mon = "월"
    case the = "화"
    case wed = "수"
    case thu = "목"
    case fir = "금"
    case sat = "토"
    case sun = "일"
}

extension UIButton {
    
    static func createKindButton(
        type: kindType
    ) -> UIButton {
        let btn = UIButton()
        btn.setTitle(type.rawValue, for: .normal)
        btn.titleLabel?.font = .appleSDGothicNeo(.body1_r_14)
        btn.setTitleColor(.grey5, for: .normal)
        btn.sizeToFit()
        btn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
        return btn
    }
}
