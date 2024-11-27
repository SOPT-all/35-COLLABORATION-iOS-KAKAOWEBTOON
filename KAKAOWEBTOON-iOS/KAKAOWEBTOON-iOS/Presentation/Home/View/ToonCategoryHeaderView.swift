//
//  ToonCategoryHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/24/24.
//

import UIKit

import SnapKit

enum kindType: Int {
    case new
    case mon
    case the
    case wed
    case thu
    case fri
    case sat
    case sun
    case done
    
    var day: String {
        switch self {
        case .new:
            return "신작"
        case .done:
            return "완결"
        case .mon:
            return "월"
        case .the:
            return "화"
        case .wed:
            return "수"
        case .thu:
            return "목"
        case .fri:
            return "금"
        case .sat:
            return "토"
        case .sun:
            return "일"
        }
    }
}

class ToonCategoryHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    var kindButtons: [UIButton] = []
    private var selectedButton = UIButton()

    // MARK: - UI Properties
    
    let newButton = UIButton()
    let doneButton = UIButton()
    let monButton = UIButton()
    let theButton = UIButton()
    let wedButton = UIButton()
    let thuButton = UIButton()
    let friButton = UIButton()
    let satButton = UIButton()
    let sunButton = UIButton()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: kindButtons
        )
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        return stackView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViewsToArray()
        setupHierarchy()
        setupStyle()
        setupLayout()
        buttonConfiguration()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Func
    
    private func setupHierarchy() {
        self.addSubviews(stackView)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black3
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(35)
        }
    }
    
    private func addViewsToArray() {
        kindButtons = [
            newButton,
            monButton,
            theButton,
            wedButton,
            thuButton,
            friButton,
            satButton,
            sunButton,
            doneButton
        ]
    }
    
    private func addTarget() {
        kindButtons.forEach{ btn in
            btn.addTarget(self, action: #selector(categoryTapped(_:)), for: .touchUpInside)
        }
    }
    
    private func buttonConfiguration() {
        kindButtons.enumerated().forEach { index, button in
            var config = UIButton.Configuration.plain()
            config.baseForegroundColor = .grey5
            config.image = nil
            config.imagePlacement = .bottom
            config.imagePadding = 2
            config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 2, bottom: 8, trailing: 2)
            let attributedTitle = AttributedString(
                kindType(rawValue: index)?.day ?? "",
                attributes: AttributeContainer([
                    .font: UIFont.appleSDGothicNeo(.body1_r_14),
                    .paragraphStyle: {
                        let style = NSMutableParagraphStyle()
                        style.lineBreakMode = .byClipping
                        style.alignment = .center
                        return style
                    }()
                ])
            )
            config.attributedTitle = attributedTitle
            button.sizeToFit()
            button.titleLabel?.applyStyle(.body1_r_14)
            button.configuration = config
        }
    }
    
    // MARK: - @objc Func
    
    @objc
    func categoryTapped(_ sender: UIButton) {
        kindButtons.forEach{ btn in
            var config = btn.configuration
            config?.baseForegroundColor = .grey5
            config?.image = nil
            btn.configuration = config
        }
        var selectedConfig = sender.configuration
        selectedConfig?.baseForegroundColor = .yellow2
        selectedConfig?.image = UIImage(resource: .imgUnderLine)
        sender.configuration = selectedConfig
        selectedButton = sender
    }
}
