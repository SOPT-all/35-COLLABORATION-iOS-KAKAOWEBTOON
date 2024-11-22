//
//  HashTagView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/21/24.
//

import UIKit

import SnapKit

class HashTagView: UIView {
    
    // MARK: - Properties
    
    private let hashTagText: String
    
    // MARK: - UI Properties
    
    private lazy var hashTagLabel: UILabel = {
        let label = UILabel()
        label.text = "#" + self.hashTagText
        label.font = .appleSDGothicNeo(.caption4_eb_10)
        label.applyStyle(.caption4_eb_10)
        label.textColor = .primaryWhite
        return label
    }()
    
    // MARK: - Init

    init(_ text: String) {
        self.hashTagText = text
        super.init(frame: .zero)
        
        setupHeirarchy()
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupHeirarchy() {
        self.addSubview(hashTagLabel)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black4
        self.setupBorder(1, color: .grey4)
        self.setupCornerRadius(5)
    }
    
    private func setupLayout() {
        hashTagLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(3)
            $0.centerY.equalToSuperview()
        }
    }
    
}
