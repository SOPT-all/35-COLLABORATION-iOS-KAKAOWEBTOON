//
//  adSectionCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/20/24.
//

import UIKit

import SnapKit

class adSectionCell: UICollectionViewCell {
    static let identifier = "adSectionCell"

    private let adSectionImage: UIImageView = {
        let img = UIImageView()
        return UIImageView(image: .imgHomeBackground)
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
        self.contentView.addSubview(adSectionImage)
    }
    
    private func setLayout() {
        adSectionImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(29)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
