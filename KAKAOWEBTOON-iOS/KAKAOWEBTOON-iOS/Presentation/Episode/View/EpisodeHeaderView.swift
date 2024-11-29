//
//  EpisodeHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/25/24.
//

import UIKit

import SnapKit
import Kingfisher

class EpisodeHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.kf.setImage(with: URL(string: "https://i.ibb.co/N7WKG7j/i-OS-png.png"))
        return imageView
    }()
    
    private let promotionBadge: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow2
        view.setupCornerRadius(4)
        return view
    }()
    
    private let promotionLabel: UILabel = {
        let label = UILabel()
        label.text = "연재무료"
        label.textColor = .black4
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        label.textAlignment = .center
        return label
    }()
    
    private let couponBadge: UIView = {
        let view = UIView()
        view.backgroundColor = .black4
        view.setupBorder(1, color: .grey3)
        view.setupCornerRadius(4)
        return view
    }()
    
    private let couponLabel: UILabel = {
        let label = UILabel()
        label.text = "이용권 9장"
        label.textColor = .primaryWhite
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "어쿠스틱 라이프"
        label.textColor = .primaryWhite
        label.font = UIFont.appleSDGothicNeo(.head_sb_22)
        label.applyStyle(.head_sb_22)
        label.numberOfLines = 1
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "난다"
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        return label
    }()
    
    private let genreLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private let genreIconImageView = UIImageView(image: UIImage(resource: .icGenre))
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "일상/개그"
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        return label
    }()
    
    private let viewCountLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private let viewIconImageView = UIImageView(image: UIImage(resource: .icView))
    private let viewCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1.5만"
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        return label
    }()
    
    private let goodCountLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private let goodIconImageView = UIImageView(image: UIImage(resource: .icGood))
    private let goodCountLabel: UILabel = {
        let label = UILabel()
        label.text = "3280"
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        return label
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
    
    // MARK: - Private Func
    
    private func setupHierarchy() {
        addSubviews(
            backgroundImageView,
            titleLabel,
            authorLabel,
            genreLabelView,
            viewCountLabelView,
            goodCountLabelView
        )
        backgroundImageView.addSubviews(promotionBadge, couponBadge)
        couponBadge.addSubview(couponLabel)
        promotionBadge.addSubview(promotionLabel)
        genreLabelView.addSubviews(genreIconImageView, genreLabel)
        viewCountLabelView.addSubviews(viewIconImageView, viewCountLabel)
        goodCountLabelView.addSubviews(goodIconImageView, goodCountLabel)
    }
    
    private func setupLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(11)
        }
        
        promotionBadge.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(130)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(18)
        }
        
        promotionLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(3.5)
            make.verticalEdges.equalToSuperview().inset(2)
        }
        
        couponBadge.snp.makeConstraints { make in
            make.top.equalTo(promotionBadge.snp.bottom).offset(2)
            make.leading.equalTo(promotionBadge.snp.leading)
            make.height.equalTo(18)
        }
        
        couponLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(3)
            make.verticalEdges.equalToSuperview().inset(2)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(backgroundImageView.snp.bottom).inset(20)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        genreLabelView.snp.makeConstraints { make in
            make.trailing.equalTo(viewCountLabelView.snp.leading).offset(-9)
            make.top.equalTo(authorLabel.snp.bottom).offset(7)
            make.bottom.equalToSuperview().inset(15)
        }
        
        genreIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        genreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(genreIconImageView)
            make.leading.equalTo(genreIconImageView.snp.trailing).offset(1)
            make.trailing.equalToSuperview()
        }
        
        viewCountLabelView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(authorLabel.snp.bottom).offset(7)
            make.bottom.equalToSuperview().inset(15)
        }
        
        viewIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        viewCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(viewIconImageView)
            make.leading.equalTo(viewIconImageView.snp.trailing).offset(1)
            make.trailing.equalToSuperview()
        }
        
        goodCountLabelView.snp.makeConstraints { make in
            make.leading.equalTo(viewCountLabelView.snp.trailing).offset(9)
            make.top.equalTo(authorLabel.snp.bottom).offset(7)
            make.bottom.equalToSuperview().inset(15)
        }
        
        goodIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        goodCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(viewIconImageView)
            make.leading.equalTo(goodIconImageView.snp.trailing).offset(1)
            make.trailing.equalToSuperview()
        }
    }
    
    private func formatNumber(_ number: Int) -> String {
        if number >= 1_000_000_000 {
            return String(format: "%.1f억", Double(number) / 1_000_000_000)
        } else if number >= 10_000 {
            return String(format: "%.1f만", Double(number) / 10_000)
        } else {
            return "\(number)"
        }
    }
    
    func configureHeader(with data: EpisodeHeader) {
        titleLabel.text = data.title
        authorLabel.text = data.author
        genreLabel.text = data.genre
        
        viewCountLabel.text = formatNumber(data.viewCount)
        goodCountLabel.text = formatNumber(data.heartCount)
        
        promotionLabel.text = data.promotion
        couponLabel.text = "이용권 \(data.coupon)장"
        
        if let url = URL(string: data.image) {
            backgroundImageView.kf.setImage(with: url)
        }
    }
}

#Preview {
    EpisodeHeaderView()
}
