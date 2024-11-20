//
//  EpisodeHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/21/24.
//

import UIKit

import SnapKit

class EpisodeHeaderView: UICollectionReusableView {

    // MARK: - Properties

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(resource: .imgEpisodeBackground)
        return imageView
    }()

    private let promotionBadge: UILabel = {
        let label = UILabel()
        label.text = "연재무료"
        label.textColor = .black4
        label.backgroundColor = .yellow2
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.textAlignment = .center
        label.setupCornerRadius(4)
        return label
    }()

    private let couponBadge: UILabel = {
        let label = UILabel()
        label.text = "이용권 0장"
        label.textColor = .primaryWhite
        label.backgroundColor = .black4
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.grey3.cgColor
        label.setupCornerRadius(4)
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primaryWhite
        label.font = UIFont.appleSDGothicNeo(.head_sb_22)
        label.numberOfLines = 1
        return label
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
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
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
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
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
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
        label.textColor = .grey3
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Methods

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
        genreLabelView.addSubviews(genreIconImageView, genreLabel)
        viewCountLabelView.addSubviews(viewIconImageView, viewCountLabel)
        goodCountLabelView.addSubviews(goodIconImageView, goodCountLabel)
    }

    private func setupLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(29)
            make.horizontalEdges.equalToSuperview().inset(11)
        }

        promotionBadge.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.height.equalTo(18)
        }

        couponBadge.snp.makeConstraints { make in
            make.top.equalTo(promotionBadge.snp.bottom).offset(2)
            make.leading.equalTo(promotionBadge.snp.leading)
            make.height.equalTo(18)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(backgroundImageView.snp.bottom).offset(16)
        }

        authorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        genreLabelView.snp.makeConstraints { make in
            make.trailing.equalTo(viewCountLabelView.snp.leading).inset(9)
        }
        
        genreIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }

        genreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(viewIconImageView)
            make.leading.equalTo(viewIconImageView.snp.trailing).offset(1)
            make.trailing.equalToSuperview()
        }
        
        viewCountLabelView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
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
        }
        
        goodIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        goodCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(viewIconImageView)
            make.leading.equalTo(viewIconImageView.snp.trailing).offset(1)
            make.trailing.equalToSuperview()
        }
    }
}
