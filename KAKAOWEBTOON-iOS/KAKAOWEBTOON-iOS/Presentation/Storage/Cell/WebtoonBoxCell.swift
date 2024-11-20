//
//  WebToonBoxCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/20/24.
//

import UIKit

class WebtoonBoxCell: UITableViewCell {

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
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
        self.backgroundColor = .primaryBlue
    }
    
    private func setupLayout() {
        
    }
}
