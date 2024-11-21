//
//  ToolTabView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/22/24.
//

import UIKit

import SnapKit

enum ToolTabType: String {
    case sort = "감상순"
    case edit = "편집"
    
    var icon: UIImage {
        switch self {
        case .sort: return .icExpandarrow
        case .edit: return .icTrash
        }
    }
}

class ToolTabView: UIView {
    
    // MARK: - Properties
    
    private let type: ToolTabType
    
    // MARK: - UI Properties
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = type.icon
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = type.rawValue
        label.font = .appleSDGothicNeo(.body3_sb_12)
        label.applyStyle(.body3_sb_12)
        label.textColor = .grey5
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.axis = .horizontal
        return stackView
    }()

    // MARK: - Init
    
    init(_ type: ToolTabType) {
        self.type = type
        super.init(frame: .zero)
        
        setupHierarchy()
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupHierarchy() {
        self.addSubview(stackView)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black2
        self.setupCornerRadius(5)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
