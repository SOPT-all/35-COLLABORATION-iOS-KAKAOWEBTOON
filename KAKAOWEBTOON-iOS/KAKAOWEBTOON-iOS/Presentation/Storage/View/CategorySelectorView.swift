//
//  CategorySelectorView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/21/24.
//

import UIKit

import SnapKit

class CategorySelectorView: UIView {
    
    // MARK: - UI Properties
    
    private let recentTab = CategoryTabView("최근 감상")
    private let saveTab = CategoryTabView("찜한 작품")
    private let buyTab = CategoryTabView("구매 작품")
    private let downloadTab = CategoryTabView("다운로드")
    private let commentTab = CategoryTabView("댓글")
    
    private lazy var CategoryTabStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [recentTab, saveTab, buyTab, downloadTab, commentTab])
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
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
        self.addSubviews(CategoryTabStackView)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black3
        recentTab.isSelected()
    }
    
    private func setupLayout() {
        CategoryTabStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(0)
            $0.horizontalEdges.equalToSuperview().inset(26)
            $0.height.equalTo(28)
        }
    }
    
}
