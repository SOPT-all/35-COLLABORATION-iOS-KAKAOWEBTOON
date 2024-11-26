//
//  AllToonsSectionFooterView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/22/24.
//

import UIKit

import SnapKit

class AllToonsSectionFooterView: UICollectionReusableView {
    
    static let reuseIdentifier = "AllToonsSectionFooterView"
    
    // MARK: - UI Properties
    
    let adImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgHomeAdd
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let ratio: CGFloat = 65 / 353
    
    let privacyPolicyLabel: UILabel = {
        let label = UILabel()
        label.text = "개인정보처리방침"
        label.font = .appleSDGothicNeo(.body3_sb_12)
        label.applyStyle(.body3_sb_12)
        label.textColor = .grey3
        return label
    }()
    
    let termsOfServiceLabel: UILabel = {
        let label = UILabel()
        label.text = "이용약관"
        label.font = .appleSDGothicNeo(.body3_sb_12)
        label.applyStyle(.body3_sb_12)
        label.textColor = .grey5
        return label
    }()
    
    let customerSupportLabel: UILabel = {
        let label = UILabel()
        label.text = "고객센터"
        label.font = .appleSDGothicNeo(.body3_sb_12)
        label.applyStyle(.body3_sb_12)
        label.textColor = .grey5
        return label
    }()
    
    let businessInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "사업자 정보"
        label.font = .appleSDGothicNeo(.body3_sb_12)
        label.applyStyle(.body3_sb_12)
        label.textColor = .grey5
        return label
    }()
    
    let copyRightLabel: UILabel = {
        let label = UILabel()
        label.text = "© KAKAO WEBTOON"
        label.font = .appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body3_sb_12)
        label.textColor = .dg5
        return label
    }()
    
    lazy var serviceStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [privacyPolicyLabel,
                 UIImageView.createDivider(),
                 termsOfServiceLabel,
                 UIImageView.createDivider(),
                 customerSupportLabel,
                 UIImageView.createDivider(),
                 businessInfoLabel
                 ]
        )
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()
    
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        [
            adImageView,
            serviceStackView,
            copyRightLabel
        ].forEach { addSubview($0)}
      }
    
    // MARK: - Private Func
    
    private func setupLayout() {
        
        adImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(5)
            $0.horizontalEdges.equalToSuperview().inset(11)
        }
        
        serviceStackView.snp.makeConstraints{
            $0.top.equalTo(adImageView.snp.bottom).offset(48)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        copyRightLabel.snp.makeConstraints{
            $0.top.equalTo(serviceStackView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(24)
        }
    }
}

