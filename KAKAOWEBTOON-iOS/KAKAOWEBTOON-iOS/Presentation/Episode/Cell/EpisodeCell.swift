//
//  EpisodeCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/20/24.
//

import UIKit

import SnapKit

class EpisodeCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    
    private let episodeCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .imgEpisodeEx)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setupCornerRadius(8)
        return imageView
    }()
    
    private let episodeBadgeLabel: UILabel = {
        let label = UILabel()
        label.text = "무료"
        label.textColor = .black4
        label.backgroundColor = .primaryWhite
        label.setupBorder(1, color: .grey1)
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        label.textAlignment = .center
        label.setupCornerRadius(6)
        return label
    }()
    
    private let episodeCellLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .black3
        return view
    }()
    
    private let episodeTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primaryWhite
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        label.textAlignment = .left
        return label
    }()
    
    private let episodeDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .grey2
        label.font = UIFont.appleSDGothicNeo(.body5_r_12)
        label.applyStyle(.body5_r_12)
        label.textAlignment = .left
        return label
    }()
    
    private let progressBarBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white50
        view.setupCornerRadius(4)
        return view
    }()
    
    private let progressBarForeground: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryWhite
        view.setupCornerRadius(4)
        return view
    }()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
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
        contentView.addSubviews(episodeCellImageView, episodeCellLabelView)
        episodeCellImageView.addSubview(progressBarBackground)
        progressBarBackground.addSubview(progressBarForeground)
        episodeCellImageView.addSubview(episodeBadgeLabel)
        episodeCellLabelView.addSubviews(episodeTitleLabel, episodeDateLabel)
        contentView.bringSubviewToFront(episodeBadgeLabel)
    }
    
    private func setupLayout() {
        episodeCellImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(contentView.frame.height - 47)
        }
        
        episodeBadgeLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(2)
            make.width.equalTo(26)
            make.height.equalTo(15)
        }
        
        episodeCellLabelView.snp.makeConstraints { make in
            make.top.equalTo(episodeCellImageView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(47)
        }
        
        episodeTitleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(8)
        }
        
        episodeDateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(8)
            make.leading.equalTo(episodeTitleLabel.snp.leading)
        }
        
        progressBarBackground.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(2)
            make.horizontalEdges.equalToSuperview().inset(3)
            make.height.equalTo(4)
        }
        
        progressBarForeground.snp.makeConstraints { make in
            make.leading.verticalEdges.equalToSuperview()
            make.height.equalTo(4)
            //초기값
            make.width.equalTo(3)
        }
    }
    
    func configure(with episodeDetail: EpisodeDetail) {
        let dayUntilFree = episodeDetail.dayUntilFree
        
        if dayUntilFree > 0 {
               episodeDateLabel.text = "\(dayUntilFree)일 후 무료"
               episodeBadgeLabel.isHidden = true
           } else {
               episodeDateLabel.text = episodeDetail.date
               episodeBadgeLabel.isHidden = false
           }
        

        if let url = URL(string: episodeDetail.image) {
            episodeCellImageView.kf.setImage(with: url)
        }
        
        if episodeDetail.status > 0 {
            self.episodeCellImageView.alpha = 0.25
            self.episodeCellLabelView.backgroundColor = .dg3
        }
            
            episodeTitleLabel.text = episodeDetail.title
            updateProgressBar(progress: episodeDetail.status)
        }
        
        func updateProgressBar(progress: Int) {
            // 진행바의 길이를 progress에 따라 설정 (0 ~ 10)
            progressBarBackground.layoutIfNeeded()
            let maxWidth = progressBarBackground.frame.width
            let progressWidth = CGFloat(progress) / 10.0 * maxWidth
            progressBarForeground.snp.updateConstraints { make in
                make.width.equalTo(progressWidth)
            }
        }
    }
