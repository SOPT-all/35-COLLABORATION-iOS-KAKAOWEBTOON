//
//  RecommandHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/23/24.
//

import UIKit

import SnapKit

class RecommandHeaderView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    private let recommandLabel: UILabel = {
        let label = UILabel()
        label.text = "나를 위한 추천 웹툰"
        label.font = .appleSDGothicNeo(.body1_r_14)
        label.applyStyle(.body1_r_14)
        label.textColor = .primaryWhite
        return label
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
    
    private func setupHierarchy() {
        self.addSubview(recommandLabel)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black3
    }
    
    private func setupLayout() {
        recommandLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(11)
        }
    }
}
