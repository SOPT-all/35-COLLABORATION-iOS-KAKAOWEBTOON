//
//  ToonCategorySectionCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/24/24.
//

import UIKit

import SnapKit

class ToonCategorySectionCell: UICollectionViewCell {
    
    static let identifier = "ToonCategorySectionCell"
    
    lazy var genreButton: UIButton = {
        let btn = UIButton()
        //        btn.setTitle(type.rawValue, for: .normal)
        btn.titleLabel?.font = .appleSDGothicNeo(.body5_r_12)
        btn.setTitleColor(.dg1, for: .normal)
        btn.backgroundColor = .black2
        btn.sizeToFit()
        btn.layer.cornerRadius = 8
        btn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        return btn
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Func
    
    func configure(with app: ToonGenreApp) {
        genreButton.setTitle(app.genre, for: .normal)
    }
    
    // MARK: - Private Func
    
    private func setupHierarchy() {
        contentView.addSubview(genreButton)
    }
    
    private func setupLayout() {
        genreButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(8)
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutAttributes.size = contentView.systemLayoutSizeFitting(
            CGSize(width: layoutAttributes.size.width, height: UIView.layoutFittingCompressedSize.height),
            withHorizontalFittingPriority: .required, // 셀 너비는 반드시 맞춤
            verticalFittingPriority: .fittingSizeLevel // 셀 높이는 필요에 따라
        )
        return layoutAttributes
    }
}

