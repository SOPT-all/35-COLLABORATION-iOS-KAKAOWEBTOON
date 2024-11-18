//
//  FontLiteral.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/18/24.
//

import UIKit

enum KakaoWebtoonFont {
    
    case head_sb_22
    case title1_eb_17, title2_sb_16
    case body1_r_14, body2_sb_13, body3_sb_12, body4_sb_12, body5_r_12, body6_l_12, body7_eb_12
    case caption1_r_10, caption2_l_10, caption3_eb_8, caption4_eb_10
    
    var size: CGFloat {
        switch self {
        case .head_sb_22: return 22
        case .title1_eb_17: return 17
        case .title2_sb_16: return 16
        case .body1_r_14: return 14
        case .body2_sb_13: return 13
        case .body3_sb_12, .body4_sb_12, .body5_r_12, .body6_l_12, .body7_eb_12: return 12
        case .caption1_r_10, .caption2_l_10, .caption4_eb_10: return 10
        case .caption3_eb_8: return 8
        }
    }
    
    var weight: UIFont.Weight {
        switch self {
        case .head_sb_22, .title2_sb_16, .body2_sb_13, .body3_sb_12, .body4_sb_12:
            return .semibold
        case .title1_eb_17, .body7_eb_12, .caption3_eb_8, .caption4_eb_10:
            return .heavy
        case .body1_r_14, .body5_r_12, .caption1_r_10:
            return .regular
        case .body6_l_12, .caption2_l_10:
            return .light
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .head_sb_22: return 26.4
        case .title1_eb_17: return 20.4
        case .title2_sb_16: return 19
        case .body1_r_14: return 16.8
        case .body2_sb_13: return 18
        case .body3_sb_12: return 14.4
        case .body4_sb_12: return 14
        case .body5_r_12: return 15.6
        case .body6_l_12, .body7_eb_12: return 14.4
        case .caption1_r_10, .caption2_l_10, .caption4_eb_10: return 12
        case .caption3_eb_8: return 9.6
        }
    }
    
    var letterSpacing: CGFloat {
        switch self {
        case .head_sb_22: return -0.22
        case .title1_eb_17: return -0.17
        case .title2_sb_16, .body2_sb_13, .body4_sb_12, .caption1_r_10: return 0
        case .body1_r_14: return -0.14
        case .body3_sb_12, .body6_l_12: return -0.12
        case .body5_r_12: return -0.13
        case .body7_eb_12, .caption2_l_10, .caption4_eb_10 : return -0.1
        case .caption3_eb_8: return -0.08
        }
    }
    
    func font() -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}

extension UIFont {
    
    static func appleSDGothicNeo(_ fontName: KakaoWebtoonFont) -> UIFont {
        return fontName.font()
    }
    
}
