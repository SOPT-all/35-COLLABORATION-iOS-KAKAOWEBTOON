//
//  FreeView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/21/24.
//

import UIKit

import SnapKit

enum FreeViewType: String {
    
    case free = "연재 무료"
    case three = "3다무"
    case up = "UP"
    case none
    
    var backgroundColor: UIColor {
        switch self {
        case .free, .none: return .yellow2
        case .three: return .primaryWhite
        case .up: return .primaryRed
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .free, .three, .none: return .black4
        case .up: return .primaryWhite
        }
    }
    
}

class FreeView: UIView {
    
    // MARK: - Properties
    
    private let type: FreeViewType
    
    // MARK: - UI Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = type.rawValue
        label.font = .appleSDGothicNeo(.caption4_eb_10)
        label.applyStyle(.caption4_eb_10)
        label.textColor = type.textColor
        return label
    }()
    
    private lazy var clockBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow2
        return view
    }()
    
    private lazy var clockIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icClock
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Init

    init(_ type: FreeViewType) {
        self.type = type
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
        switch type {
        case .free, .up:
            self.addSubview(titleLabel)
        case .three:
            self.addSubviews(clockBackView, titleLabel)
            clockBackView.addSubview(clockIcon)
        case .none:
            self.addSubview(clockBackView)
            clockBackView.addSubview(clockIcon)
        }
    }
    
    private func setupStyle() {
        self.setupCornerRadius(5)
        self.backgroundColor = self.type.backgroundColor
    }
    
    private func setupLayout() {
        switch type {
        case .free, .up:
            titleLabel.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview().inset(4)
                $0.centerY.equalToSuperview()
            }
            
        case .three:
            clockBackView.snp.makeConstraints {
                $0.verticalEdges.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.size.equalTo(17)
            }
            
            clockIcon.snp.makeConstraints {
                $0.center.equalToSuperview()
                $0.size.equalTo(11)
            }
            
            titleLabel.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalTo(clockBackView.snp.trailing).offset(3)
                $0.trailing.equalToSuperview().inset(4)
            }
            
        case .none:
            clockBackView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.size.equalTo(17)
            }
            
            clockIcon.snp.makeConstraints {
                $0.center.equalToSuperview()
                $0.size.equalTo(11)
            }
        }
    }
    
}
