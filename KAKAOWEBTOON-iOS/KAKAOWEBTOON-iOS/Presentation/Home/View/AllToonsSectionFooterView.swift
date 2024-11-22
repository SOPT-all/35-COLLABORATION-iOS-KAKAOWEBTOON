//
//  AllToonsSectionFooterView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/22/24.
//

import UIKit

import SnapKit

class AllToonsSectionFooterView: UICollectionReusableView {
    
    static let Identifier = "AllToonsSectionFooterView"
    
    // MARK: - UI Properties
    
    let adImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgHomeAdd
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let lineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icHomeLine
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let privacyPolicyLabelLabel: UILabel = {
        let label = UILabel()
        label.text = "개인정보처리방침"
        label.font = .appleSDGothicNeo(.body3_sb_12)
        label.applyStyle(.body3_sb_12)
        label.textColor = .grey3
        return label
    }()
    
    let termsOfServiceLabelLabel: UILabel = {
        let label = UILabel()
        label.text = "이용약관"
        label.font = .appleSDGothicNeo(.body3_sb_12)
        label.applyStyle(.body3_sb_12)
        label.textColor = .grey5
        return label
    }()
    
    let customerSupportLabelLabel: UILabel = {
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
            lineImageView,
            privacyPolicyLabelLabel,
            termsOfServiceLabelLabel,
            customerSupportLabelLabel,
            businessInfoLabel,
            copyRightLabel
        ].forEach { addSubview($0)}
      }
    
    // MARK: - Private Func
    
    private func setupLayout() {
        
        adImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(11)
            $0.height.equalTo(65)
        }
        
        privacyPolicyLabelLabel.snp.makeConstraints{
            $0.top.equalTo(adImageView.snp.bottom).offset(48)
            $0.leading.equalToSuperview().offset(51)
        }
        
        lineImageView.snp.makeConstraints{
            $0.top.equalTo(adImageView.snp.bottom).offset(48)
            $0.leading.equalTo(privacyPolicyLabelLabel.snp.trailing).offset(4)
        }
    }
}

