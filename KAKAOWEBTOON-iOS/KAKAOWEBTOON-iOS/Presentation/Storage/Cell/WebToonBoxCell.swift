//
//  WebToonBoxCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/20/24.
//

import UIKit

import SnapKit

class WebToonBoxCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let webtoonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black1
        imageView.setupCornerRadius(5)
        return imageView
    }()

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
    
    func setupHierarchy() {
        self.addSubviews(webtoonImageView)
    }
    
    func setupStyle() {
        self.backgroundColor = .clear
    }
    
    func setupLayout() {
        webtoonImageView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview().inset(11)
            $0.width.equalTo(160)
        }
    }
}
