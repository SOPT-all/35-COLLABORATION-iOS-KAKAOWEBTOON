//
//  CategoryTabView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/21/24.
//

import UIKit

import SnapKit

class CategoryTabView: UIView {
    
    // MARK: - Properties
    
    private let title: String
    
    // MARK: - UI Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appleSDGothicNeo(.body2_sb_13)
        label.applyStyle(.body2_sb_13)
        label.textColor = .dg4
        label.textAlignment = .center
        return label
    }()
    
    private let yellowUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow2
        view.isHidden = true
        view.setupCornerRadius(1)
        return view
    }()
    
    // MARK: - Init
    
    init(_ title: String) {
        self.title = title
        super.init(frame: .zero)
        
        setupHierarchy()
        setupStyle()
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupHierarchy() {
        self.addSubviews(titleLabel, yellowUnderLine)
    }
    
    private func setupStyle() {
        self.backgroundColor = .clear
        self.titleLabel.text = title
    }
    
    private func setupLayer() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(5)
        }
        
        yellowUnderLine.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalTo(titleLabel)
            $0.height.equalTo(2)
        }
    }
    
    // MARK: - Funcs
    
    func isSelected() {
        titleLabel.textColor = .primaryWhite
        yellowUnderLine.isHidden = false
    }
    
}
