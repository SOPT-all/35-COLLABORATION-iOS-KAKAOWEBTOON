//
//  UIBarButtonItem+.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/20/24.
//

import UIKit

enum KWBarButtonType {
    
    case coin
    case research
    case menu
    case back
    case arrow
    case heart
    case seeMore
    
    var image: UIImage? {
        switch self {
        case .coin: return .icCoin
        case .research: return .icResearch
        case .menu: return .icMenu
        case .back: return .icBack
        case .arrow: return .icArrowLeft
        case .heart: return .icHeart
        case .seeMore: return .icSeeMore
        }
    }
    
}

extension UIBarButtonItem {
    
    static func setupBarButton(
        type: KWBarButtonType,
        target: Any?,
        action: Selector
    ) -> UIBarButtonItem {
        let button = UIBarButtonItem(
            image: type.image,
            style: .plain,
            target: target,
            action: action
        )
        button.tintColor = .primaryWhite
        return button
    }
    
    static func setupBarButtons(
        buttonTypes: [KWBarButtonType],
        target: Any?,
        actions: [Selector],
        spacing: CGFloat = 0
    ) -> UIBarButtonItem {
        var buttons: [UIButton] = []
        
        for (index, type) in buttonTypes.enumerated() {
            let button = UIButton()
            button.setImage(type.image, for: .normal)
            
            if actions.indices.contains(index) {
                button.addTarget(target, action: actions[index], for: .touchUpInside)
            }
            
            buttons.append(button)
        }
        
        let itemsStackView = UIStackView(arrangedSubviews: buttons)
        itemsStackView.distribution = .equalSpacing
        itemsStackView.axis = .horizontal
        itemsStackView.alignment = .center
        itemsStackView.spacing = spacing
        
        return UIBarButtonItem(customView: itemsStackView)
    }
    
}
