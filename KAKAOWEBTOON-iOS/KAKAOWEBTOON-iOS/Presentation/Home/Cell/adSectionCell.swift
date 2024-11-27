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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.contentView.addSubviews(adSectionImage, adPersonImage)
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
    }
}
