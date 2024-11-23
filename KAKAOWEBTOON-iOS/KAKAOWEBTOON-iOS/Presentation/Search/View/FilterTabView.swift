//
//  FilterTabView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/23/24.
//

import UIKit

import SnapKit

enum FilterType: String {
    
    case all = "전체"
    case nowFree = "연재무료"
    case afterFree = "기다리면무료"
    
}

class FilterTabView: UIView {
    
    // MARK: - UI Properties
    
    lazy var allTab = createFilterTab(.all)
    lazy var nowTab = createFilterTab(.nowFree)
    lazy var afterTab = createFilterTab(.afterFree)
    
    private lazy var filterTabStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [allTab, nowTab, afterTab])
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .dg7
        return view
    }()
    
    private let yellowLine: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow2
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupStyle()
        setupLayout()
        filterSelected(.afterFree)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupHierarchy() {
        self.addSubviews(filterTabStackView, separatorView)
        separatorView.addSubview(yellowLine)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black3
    }
    
    private func setupLayout() {
        filterTabStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(38)
        }
        
        separatorView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        yellowLine.snp.makeConstraints {
            $0.height.equalTo(3)
            $0.width.equalTo(UIScreen.main.bounds.width / 3)
            $0.centerX.equalToSuperview().multipliedBy(1)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func createFilterTab(_ type: FilterType) -> UIButton {
        let filterTabButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle(type.rawValue, for: .normal)
            button.setTitleColor(.grey6, for: .normal)
            button.titleLabel?.font = .appleSDGothicNeo(.title2_sb_16)
            button.titleLabel?.applyStyle(.title2_sb_16)
            return button
        }()
        return filterTabButton
    }
    
    func filterSelected(_ type: FilterType) {
        yellowLine.snp.removeConstraints() // 기존 제약 조건 제거
        
        UIView.animate(withDuration: 0.2) {
            self.yellowLine.snp.makeConstraints {
                $0.height.equalTo(3)
                $0.width.equalTo(UIScreen.main.bounds.width / 3)
                switch type {
                case .all:
                    $0.centerX.equalToSuperview().multipliedBy(0.33)
                case .nowFree:
                    $0.centerX.equalToSuperview().multipliedBy(1)
                case .afterFree:
                    $0.centerX.equalToSuperview().multipliedBy(1.66)
                }
                $0.bottom.equalToSuperview()
            }
//            self.layoutIfNeeded() // 애니메이션 적용
        }
    }
    
}
