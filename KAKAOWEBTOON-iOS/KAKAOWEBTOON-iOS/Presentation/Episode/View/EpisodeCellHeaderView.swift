//
//  EpisodeCellHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/29/24.
//

import UIKit

import SnapKit

class EpisodeCellHeaderView: UICollectionReusableView {
    
    private let totalCountLabel: UILabel = {
        let label = UILabel()
        label.text = "전체"
        label.textColor = .primaryWhite
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        return label
    }()
    
    private let totalCountNumLabel: UILabel = {
        let label = UILabel()
        label.text = "297"
        label.textColor = .primaryWhite
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        return label
    }()
    
    private let listView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let listViewLabel: UILabel = {
        let label = UILabel()
        label.text = "리스트뷰"
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        return label
    }()
    
    private let listViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .icList)
        return imageView
    }()
    
    private let orderView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let orderViewLabel: UILabel = {
        let label = UILabel()
        label.text = "등록순"
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        return label
    }()
    
    private let orderViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .icArrowUpdown)
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubviews(totalCountLabel, totalCountNumLabel, listView, orderView)
        listView.addSubviews(listViewLabel, listViewLogo)
        orderView.addSubviews(orderViewLabel, orderViewLogo)
    }
    
    private func setupLayout() {
        totalCountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.leading.equalToSuperview().inset(18)
        }
        
        totalCountNumLabel.snp.makeConstraints { make in
            make.leading.equalTo(totalCountLabel.snp.trailing).offset(2)
            make.centerY.equalTo(totalCountLabel)
        }
        
        listView.snp.makeConstraints { make in
            make.centerY.equalTo(totalCountLabel)
            make.trailing.equalTo(orderView.snp.leading).inset(13)
        }
        
        listViewLogo.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        listViewLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
        
        orderView.snp.makeConstraints { make in
            make.centerY.equalTo(totalCountLabel)
            make.trailing.equalToSuperview().inset(19)
        }
        
        orderViewLogo.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        orderViewLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalTo(orderViewLogo.snp.trailing).offset(1)
        }
    }
}
