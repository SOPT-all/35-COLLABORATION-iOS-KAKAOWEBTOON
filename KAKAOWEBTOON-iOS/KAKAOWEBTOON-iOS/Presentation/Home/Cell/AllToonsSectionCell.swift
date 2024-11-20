//
//  AllToonsSectionCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/20/24.
//

import UIKit

import SnapKit

class AllToonsSectionCell: UICollectionViewCell {
    
    static let identifier = "AllToonsSectionCell"
    
//    private let titleLabel = UILabel(frame: .zero)
    private let imageView = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .red
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.backgroundColor = .red
    }
    
    private func setUI() {
//        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(imageView)
    }
    
    private func setLayout() {
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
