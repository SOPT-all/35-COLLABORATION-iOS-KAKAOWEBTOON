//
//  ToonCategoryView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/24/24.
//

import UIKit

import SnapKit

enum kindType: String {
    case new = "신작"
    case done = "완결"
    case mon = "월"
    case the = "화"
    case wed = "수"
    case thu = "목"
    case fri = "금"
    case sat = "토"
    case sun = "일"
}

class ToonCategoryView: UIView {
    
    // MARK: - Properties
    
    let type: kindType
    var isSelected: Bool = false {
        didSet {
            kindButtonState()
        }
    }
    
    // MARK: - UI Propertise
    
    lazy var kindButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(type.rawValue, for: .normal)
        btn.titleLabel?.font = .appleSDGothicNeo(.body1_r_14)
        btn.setTitleColor(.grey5, for: .normal)
        btn.sizeToFit()
        btn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
        return btn
    }()
    
    private let yellowUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow2
        view.isHidden = true
        view.setupCornerRadius(2)
        return view
    }()
    
    // MARK: - Init
    
    init(type: kindType) {
        self.type = type
        super.init(frame: .zero)
        
        setHierarchy()
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Func
    
    private func setHierarchy() {
        self.addSubviews(kindButton, yellowUnderLine)
    }
    
    private func setupStyle() {
        self.backgroundColor = .clear
    }
    
    private func setupLayout() {
        kindButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.center.equalToSuperview()
        }
        
        yellowUnderLine.snp.makeConstraints{
            $0.top.equalToSuperview()
        }
    }
    
    private func kindButtonState() {
        kindButton.isSelected = isSelected
        yellowUnderLine.isHidden = !isSelected
    }
    
    // MARK: - Public Func
    
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) {
        kindButton.addTarget(target, action: action, for: event)
    }
}
