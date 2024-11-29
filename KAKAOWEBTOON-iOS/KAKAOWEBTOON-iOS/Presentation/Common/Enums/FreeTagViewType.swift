//
//  FreeTagViewType.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/26/24.
//

import UIKit

enum FreeTagViewType: String {
    
    case free = "연재무료"
    case three = "3다무"
    case up = "up"
    case clock = "시계"
    
    var backgroundColor: UIColor {
        switch self {
        case .free, .clock: return .yellow2
        case .three: return .primaryWhite
        case .up: return .primaryRed
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .free, .three, .clock: return .black4
        case .up: return .primaryWhite
        }
    }
    
}
