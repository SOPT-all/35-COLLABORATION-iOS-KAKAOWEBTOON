//
//  AdSectionCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/20/24.
//

import UIKit

import SnapKit

class AdSectionCell: UICollectionViewCell {
    
    static let identifier = "AdSectionCell"

    private let adSectionImage: UIImageView = {
        let img = UIImageView()
        return UIImageView(image: .imgHomeBackground)
    }()
    
    private let adPersonImage: UIImageView = {
        let img = UIImageView()
        return UIImageView(image: .imgHomeCharcter)
    }()
    
    private let labelView: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryBlue
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        return view
    }()
    
    private let toonNameLabel: UILabel = {
        let label = UILabel()
        label.text = "어쿠스틱라이프 28화"
        label.font = .appleSDGothicNeo(.body1_r_14)
        label.textColor = .white
        return label
    }()
    
    private let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "이어보기"
        label.font = .appleSDGothicNeo(.body1_r_14)
        label.textColor = .white
        return label
    }()
    
    private let moreImage: UIImageView = {
        let img = UIImageView()
        return UIImageView(image: .icArrowRight)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.contentView.addSubviews(
            adSectionImage,
            adPersonImage,
            labelView,
            toonNameLabel,
            moreLabel,
            moreImage
        )
    }
    
    private func setLayout() {
        adSectionImage.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
        }
        adPersonImage.snp.makeConstraints{
            $0.bottom.equalTo(adSectionImage.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }
        labelView.snp.makeConstraints{
            $0.bottom.equalTo(adPersonImage.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(adSectionImage)
            $0.height.equalTo(41)
        }
        toonNameLabel.snp.makeConstraints{
            $0.centerY.equalTo(labelView)
            $0.leading.equalToSuperview().offset(12)
        }
        moreImage.snp.makeConstraints{
            $0.centerY.equalTo(labelView)
            $0.trailing.equalToSuperview().inset(12)
        }
        moreLabel.snp.makeConstraints{
            $0.centerY.equalTo(labelView)
            $0.trailing.equalTo(moreImage.snp.leading).inset(-4)
        }
    }
}

