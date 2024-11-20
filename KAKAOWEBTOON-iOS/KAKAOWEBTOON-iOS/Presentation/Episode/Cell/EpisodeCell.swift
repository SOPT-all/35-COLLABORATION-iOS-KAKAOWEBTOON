//
//  EpisodeCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/20/24.
//

import UIKit

import SnapKit

class EpisodeCell: UICollectionViewCell {
    static let identifier = "EpisodeCell"
    
    //MARK: - Properties
    
    private let episodeCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setupCornerRadius(8)
        return imageView
    }()
    
    private let episodeBadgeLabel: UILabel = {
        let label = UILabel()
        label.text = "무료"
        label.textColor = .white
        label.backgroundColor = .clear
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.grey1.cgColor
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
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
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.textAlignment = .left
        return label
    }()
    
    private let episodeDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .grey2
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
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
        progressBarBackground.addSubview(progressBarForeground)
        episodeCellImageView.addSubviews(episodeBadgeLabel, progressBarBackground)
        episodeCellLabelView.addSubviews(episodeTitleLabel, episodeDateLabel)
    }
    
    private func setupLayout() {
        episodeCellImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(117.0 / 218.0)
        }
        
        episodeBadgeLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(2)
            make.width.equalTo(26)
            make.height.equalTo(15)
        }
        
        episodeCellLabelView.snp.makeConstraints { make in
            make.top.equalTo(episodeCellImageView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(101.0 / 218.0)
        }
        
        episodeTitleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(31)
        }
        
        episodeDateLabel.snp.makeConstraints { make in
            make.top.equalTo(episodeTitleLabel.snp.bottom).offset(2)
            make.horizontalEdges.equalTo(episodeTitleLabel.snp.leading)
        }
        
        progressBarBackground.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(2)
            make.horizontalEdges.equalToSuperview().inset(3)
            make.height.equalTo(4)
        }
        
        progressBarForeground.snp.makeConstraints { make in
            make.leading.verticalEdges.equalToSuperview()
            //초기값
            make.width.equalTo(0)
        }
    }
    
    func configure(with title: String, date: String, image: UIImage?, progress: Int) {
        episodeTitleLabel.text = title
        episodeDateLabel.text = date
        episodeCellImageView.image = image
        updateProgressBar(progress: progress)
    }
    
    private func updateProgressBar(progress: Int) {
        // 진행바의 길이를 progress에 따라 설정 (0 ~ 10)
        progressBarBackground.layoutIfNeeded()
        let maxWidth = progressBarBackground.frame.width
        let progressWidth = CGFloat(progress) / 10.0 * maxWidth
        progressBarForeground.snp.updateConstraints { make in
            make.width.equalTo(progressWidth)
        }
    }
}
