//
//  AllToonsSectionCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/20/24.
//

import UIKit

import SnapKit
import Kingfisher

class AllToonsSectionCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setupCornerRadius(8)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.backgroundColor = .gray
    }
    
    private func setupHierarchy() {
        self.contentView.addSubview(imageView)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with dailyWebtoon: DailyWebtoon) {
        let urlString = dailyWebtoon.image
        let url = URL(string: urlString)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }
}
