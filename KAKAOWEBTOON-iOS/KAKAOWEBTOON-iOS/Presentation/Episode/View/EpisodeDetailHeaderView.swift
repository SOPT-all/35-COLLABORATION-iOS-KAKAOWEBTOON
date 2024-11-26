//
//  EpisodeDetailHeaderView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/26/24.
//

import UIKit

class EpisodeDetailHeaderView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    private let episodeCountLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 297"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let sortStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
        button.setTitle("리스트 뷰", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    private let sortButton: UIButton = {
        let button = UIButton()
        button.setTitle("등록순", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
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
        addSubview(episodeCountLabel)
        addSubview(sortStackView)
        sortStackView.addArrangedSubview(listButton)
        sortStackView.addArrangedSubview(sortButton)
    }
    
    private func setupLayout() {
        episodeCountLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        sortStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
}
