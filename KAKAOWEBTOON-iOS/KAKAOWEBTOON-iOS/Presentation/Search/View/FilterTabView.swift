//
//  FilterTabView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/23/24.
//

import UIKit

class FilterTabView: UIView {
    
    // MARK: - UI Properties
    
    

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    private func setupHierarchy() {
        
    }
    
    private func setupStyle() {
        self.backgroundColor = .black3
    }
    
    private func setupLayout() {
        
    }
    
}
