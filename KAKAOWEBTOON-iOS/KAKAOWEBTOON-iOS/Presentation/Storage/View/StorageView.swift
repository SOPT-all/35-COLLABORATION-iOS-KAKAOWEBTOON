//
//  StorageView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/19/24.
//

import UIKit

import SnapKit

class StorageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        
    }
    
    func setupStyle() {
        self.backgroundColor = .black3
        
    }
    
    func setupLayout() {
        
    }
}
