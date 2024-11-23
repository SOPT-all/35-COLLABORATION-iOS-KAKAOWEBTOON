//
//  UIImageView+.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/23/24.
//

import UIKit

extension UIImageView {
    
    static func createDivider() -> UIImageView {
        let lineImage = UIImageView()
        lineImage.image = .icHomeLine
        lineImage.contentMode = .scaleAspectFit
        return lineImage
    }
}
