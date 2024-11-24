//
//  UINavigationBar+.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/20/24.
//

import UIKit

import SnapKit

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

extension UINavigationBar {
    
    func setupSearchBar() -> UITextField {
        let searchBackView: UIView = {
            let view = UIView()
            view.backgroundColor = .black1
            view.setupCornerRadius(8)
            return view
        }()
        
        let searchTextField: UITextField = {
            let textField = UITextField()
            textField.backgroundColor = .black1
            textField.placeholder = "작품, 작가, 장르를 입력하세요"
            textField.textColor = .primaryWhite
            textField.font = .appleSDGothicNeo(.title2_sb_16)
            textField.setupPlaceholder(text: "작품, 작가, 장르를 입력하세요.")
            textField.configureDefaultSettings()
            textField.addCustomClearButton()
            textField.clearButtonMode = .never
            return textField
        }()
        
        self.addSubview(searchBackView)
        searchBackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(57)
            $0.height.equalTo(40)
        }
        
        searchBackView.addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.height.equalTo(25)
        }
        
        return searchTextField
    }
}
