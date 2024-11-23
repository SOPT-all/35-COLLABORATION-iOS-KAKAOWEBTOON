//
//  RecommandHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/23/24.
//

import UIKit

class RecommandHeaderView: UICollectionReusableView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
