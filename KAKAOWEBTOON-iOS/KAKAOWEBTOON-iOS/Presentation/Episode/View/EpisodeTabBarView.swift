//
//  EpisodeTabBarView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/23/24.
//

import UIKit

import SnapKit

class EpisodeTabBarView: UICollectionReusableView {
    
    // MARK: - Properties
    
    private let tabTitles = ["회차", "정보", "이용권", "댓글"]
    
    // MARK: - UI Properties

    private var buttons: [UIButton] = []
    private let episodeTabBarStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 13
        return view
    }()
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow2
        view.setupCornerRadius(1)
        return view
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
        setupTargets()
        
        // 초기 선택 index 0
        selectTab(at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Func
    
    private func setupHierarchy() {
        addSubviews(episodeTabBarStackView, underlineView)
        
        for (index, title) in tabTitles.enumerated() {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.grey2, for: .normal)
            button.setTitleColor(.yellow2, for: .selected)
            button.titleLabel?.font = UIFont.appleSDGothicNeo(.body5_r_12)
            button.tag = index
            episodeTabBarStackView.addArrangedSubview(button)
            buttons.append(button)
        }
    }
    
    private func setupLayout() {
        episodeTabBarStackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
            make.width.equalTo(0)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupTargets() {
        for button in buttons {
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        }
    }
    
    func selectTab(at index: Int) {
        for (i, button) in buttons.enumerated() {
            button.isSelected = (i == index)
            button.setTitleColor(i == index ? .yellow2 : .grey2, for: .normal)
        }
        
        let selectedButton = buttons[index]
        let title = selectedButton.title(for: .normal) ?? ""
        let titleWidth = title.size(withAttributes: [
            .font: selectedButton.titleLabel?.font ?? UIFont.appleSDGothicNeo(.body5_r_12)
        ]).width
        
        UIView.animate(withDuration: 0.1) {
            self.underlineView.snp.remakeConstraints { make in
                make.bottom.equalToSuperview()
                make.height.equalTo(2)
                make.width.equalTo(titleWidth + 2)
                make.centerX.equalTo(selectedButton.snp.centerX)
            }
            self.layoutIfNeeded()
        }
    }
    
    // MARK: - @objc Func
    
    @objc private func didTapButton(_ sender: UIButton) {
        let index = sender.tag
        selectTab(at: index)
    }
}

#Preview {
    EpisodeTabBarView()
}
