//
//  ResultHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/23/24.
//

import UIKit

import SnapKit

class ResultHeaderView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    private let resultCountLabel: UILabel = {
        let label = UILabel()
        label.text = "웹툰 0"
        label.font = .appleSDGothicNeo(.body1_r_14)
        label.applyStyle(.body1_r_14)
        label.textColor = .primaryWhite
        return label
    }()
    
    private let downChevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icHomeArrowBottom
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let sortLabel: UILabel = {
        let label = UILabel()
        label.text = "인기순"
        label.font = .appleSDGothicNeo(.body1_r_14)
        label.applyStyle(.body1_r_14)
        label.textAlignment = .right
        label.textColor = .grey6
        return label
    }()
    
    // MARK: - Life Cycle
    
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
        self.addSubviews(resultCountLabel, downChevronImageView, sortLabel)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black3
    }
    
    private func setupLayout() {
        resultCountLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(13)
        }
        
        downChevronImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.size.equalTo(12)
        }
        
        sortLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(downChevronImageView.snp.leading).offset(-3)
        }
    }
}
