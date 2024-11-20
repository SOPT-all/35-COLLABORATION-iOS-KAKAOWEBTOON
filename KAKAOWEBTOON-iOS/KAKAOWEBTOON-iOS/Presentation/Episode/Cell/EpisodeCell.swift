//
//  EpisodeCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/20/24.
//

import UIKit

import SnapKit
import Then

class EpisodeCell: UICollectionViewCell {
    static let identifier = "EpisodeCell"
    
    //MARK: - Properties
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.setupCornerRadius(8)
    }
    
    private let badgeLabel = UILabel().then {
        $0.text = "무료"
        $0.textColor = .white
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.grey1.cgColor
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        $0.textAlignment = .center
        $0.setupCornerRadius(6)
    }
    
    private let labelView = UIView().then {
        $0.backgroundColor = .black3
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .primaryWhite
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        $0.textAlignment = .left
    }
    
    private let dateLabel = UILabel().then {
        $0.textColor = .grey2
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        $0.textAlignment = .left
    }
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Func
    private func setupStyle() {
        contentView.backgroundColor = .clear
        contentView.setupCornerRadius(8)
    }
    
    private func setupHierarchy() {
        contentView.addSubviews(
            imageView,
            badgeLabel,
            labelView
        )
        labelView.addSubviews(titleLabel, dateLabel)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        badgeLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(2)
            make.width.equalTo(26)
            make.height.equalTo(15)
        }
        
        labelView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(47)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(31)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.horizontalEdges.equalTo(titleLabel.snp.leading)
        }
    }
    
    func configure(with title: String, date: String, image: UIImage?) {
        titleLabel.text = title
        dateLabel.text = date
        imageView.image = image
    }
}

