//
//  ToonCategoryHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/24/24.
//

import UIKit

import SnapKit

class ToonCategoryHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    var kindButtons: [ToonCategoryView] = []
    
    // MARK: - UI Properties
    
    let newButton = ToonCategoryView(type: .new)
    let doneButton = ToonCategoryView(type: .done)
    let monButton = ToonCategoryView(type: .mon)
    let theButton = ToonCategoryView(type: .the)
    let wedButton = ToonCategoryView(type: .wed)
    let thuButton = ToonCategoryView(type: .thu)
    let friButton = ToonCategoryView(type: .fri)
    let satButton = ToonCategoryView(type: .sat)
    let sunButton = ToonCategoryView(type: .sun)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: kindButtons
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
        
        addViewsToArray()
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
    
    private func addViewsToArray() {
        kindButtons.append(newButton)
        kindButtons.append(monButton)
        kindButtons.append(theButton)
        kindButtons.append(wedButton)
        kindButtons.append(thuButton)
        kindButtons.append(friButton)
        kindButtons.append(satButton)
        kindButtons.append(sunButton)
        kindButtons.append(doneButton)
    }
    
    // MARK: - Public Func
    
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) {
        kindButtons.forEach { button in
            button.addTarget(target, action: action, for: event)
        }
    }
}
