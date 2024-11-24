//
//  ToonCategorySectionCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/24/24.
//

import UIKit

import SnapKit

class ToonCategorySectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.backgroundColor = .gray
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
}

