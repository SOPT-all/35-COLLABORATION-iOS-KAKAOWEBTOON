//
//  ToonCategoryHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/24/24.
//

import UIKit

import SnapKit

class ToonCategoryHeaderView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    let newButton = UIButton.createKindButton(type: .new)
    let doneButton = UIButton.createKindButton(type: .done)
    let monButton = UIButton.createKindButton(type: .mon)
    let theButton = UIButton.createKindButton(type: .the)
    let wedButton = UIButton.createKindButton(type: .wed)
    let thuButton = UIButton.createKindButton(type: .thu)
    let firButton = UIButton.createKindButton(type: .fir)
    let satButton = UIButton.createKindButton(type: .sat)
    let sunButton = UIButton.createKindButton(type: .sun)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                newButton,
                monButton,
                theButton,
                theButton,
                wedButton,
                thuButton,
                firButton,
                satButton,
                sunButton,
                doneButton
            ]
        )
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
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
    
    // MARK: - Private Func
    
    private func setupHierarchy() {
        self.addSubview(stackView)
    }
    
    private func setupStyle() {
        self.backgroundColor = .clear
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
        }
    }
    
    // MARK: -  @objc Func
    @objc
    private func kindButtonTapped() {
        
    }
}

