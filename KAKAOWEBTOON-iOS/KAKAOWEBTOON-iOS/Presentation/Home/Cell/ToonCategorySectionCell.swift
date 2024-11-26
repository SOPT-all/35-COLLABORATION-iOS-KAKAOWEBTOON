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
    
    private var isSizeCalculated = false
    
    private var genreLabel: UILabel = {
        let label = UILabel()
        label.font = .appleSDGothicNeo(.body5_r_12)
        label.textColor = .dg1
        label.applyStyle(.body5_r_12)
        label.setupCornerRadius(8)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Func
    
    func configure(with app: ToonGenreApp) {
        genreLabel.text = app.genre
    }
    
    // MARK: - Private Func
    
    private func setupHierarchy() {
        contentView.addSubview(genreLabel)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black2
        self.setupCornerRadius(8)
    }
    
    private func setupLayout() {
        genreLabel.snp.makeConstraints{
            $0.verticalEdges.equalToSuperview().inset(8)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
    }
}

