//
//  AllToonsSectionHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/21/24.
//

import UIKit

import SnapKit

class AllToonsSectionHeaderView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "총 0개"
        label.font = .appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        label.textColor = .white
        return label
    }()
    
    let sortLabel: UILabel = {
        let label = UILabel()
        label.text = "인기순"
        label.font = .appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        label.textColor = .white
        return label
    }()
    
    let sortArrayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icHomeArrowBottom
        return imageView
    }()

    let allLabel: UILabel = {
        let label = UILabel()
        label.text = "전체"
        label.font = .appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        label.textColor = .white
        return label
    }()
    
    let allArrayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icHomeArrowBottom
        return imageView
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
            countLabel,
            sortLabel,
            sortArrayImageView,
            allLabel,
            allArrayImageView
        ].forEach { addSubview($0)}
      }
    
    func toonCount(with toonCount: Int) {
        countLabel.text = "총 \(toonCount)개"
    }
    
    // MARK: - Private Func
    
    private func setupLayout() {
        
        countLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalToSuperview().offset(15)
        }
        
        allArrayImageView.snp.makeConstraints{
            $0.centerY.equalTo(allLabel)
            $0.trailing.equalToSuperview().inset(15)
            $0.size.equalTo(12)
        }
        
        allLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(4)
            $0.trailing.equalTo(allArrayImageView.snp.leading).inset(-4)
        }
        
        sortArrayImageView.snp.makeConstraints{
            $0.centerY.equalTo(sortLabel)
            $0.size.equalTo(12)
            $0.trailing.equalTo(allLabel.snp.leading).inset(-13)
        }
        
        sortLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(4)
            $0.trailing.equalTo(sortArrayImageView.snp.leading).inset(-4)
        }
    }
}
