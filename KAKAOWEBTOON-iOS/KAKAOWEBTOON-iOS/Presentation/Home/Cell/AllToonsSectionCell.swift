//
//  AllToonsSectionCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/20/24.
//

import UIKit

import SnapKit

class AllToonsSectionCell: UICollectionViewCell {
    
//    private let titleLabel = UILabel(frame: .zero)
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
//        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(imageView)
    }
    
    private func setupLayout() {
//        titleLabel.snp.makeConstraints{
//            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
//            $0.leading.trailing.bottom.equalToSuperview()
//        }
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with app: AllToonsSectionApp) {
//        titleLabel.text = app.title
        imageView.image = app.image
    }
}
