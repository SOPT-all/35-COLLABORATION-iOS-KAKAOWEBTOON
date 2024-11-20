//
//  UINavigationBar+.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/20/24.
//

import UIKit

enum KWNavigationBarType {
    
    case title(String)
    case logo(UIImage?)
    case basic
    
}

extension UINavigationBar {
    
    func setupNavigationBarStyle(_ type: KWNavigationBarType) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .black3
        appearance.shadowColor = nil
        
        switch type {
        case .title(let string):
            let titleFont = UIFont.appleSDGothicNeo(.title1_eb_17)
            let titleAttributes: [NSAttributedString.Key: Any] = [
                .font: titleFont,
                .foregroundColor: UIColor.primaryWhite,
                .kern: KakaoWebtoonFont.title1_eb_17.letterSpacing
            ]
            
            appearance.titleTextAttributes = titleAttributes
            topItem?.title = string
            
        case .logo(let image):
            let logoImageView = UIImageView(image: image)
            logoImageView.contentMode = .scaleAspectFit
            topItem?.titleView = logoImageView
            
        case .basic:
            topItem?.title = nil
            topItem?.titleView = nil
        }
        
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
    }
    
}
