//
//  WebToonBoxCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/20/24.
//

import UIKit

import SnapKit

class WebToonBoxCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let webtoonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black1
        imageView.setupCornerRadius(5)
        return imageView
    }()
    
    lazy var freeTagView = FreeTagView(.free)
    lazy var hashTagView = HashTagView("코믹/일상")
    
    private lazy var tagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [freeTagView, hashTagView])
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 3
        stackView.axis = .horizontal
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "웹툰 제목"
        label.font = .appleSDGothicNeo(.title1_eb_17)
        label.applyStyle(.title1_eb_17)
        label.textColor = .primaryWhite
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "작가"
        label.font = .appleSDGothicNeo(.body7_eb_12)
        label.applyStyle(.body7_eb_12)
        label.textColor = .grey4
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
    
    // MARK: - Private func
    
    func setupHierarchy() {
        self.addSubviews(webtoonImageView, titleLabel, authorLabel)
    }
    
    func setupStyle() {
        self.backgroundColor = .black3
    }
    
    func setupLayout() {
        webtoonImageView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview().inset(11)
            $0.width.equalTo(160)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35)
            $0.leading.equalTo(webtoonImageView.snp.trailing).offset(11)
        }
        
        authorLabel.snp.makeConstraints {
            $0.leading.equalTo(webtoonImageView.snp.trailing).offset(11)
            $0.bottom.equalToSuperview().inset(6)
            $0.width.equalTo(72)
        }
    }
    
    // MARK: - Func
    
    func configure() {
        /*
         Todo : Api 연결 데이터 바인딩
         */
        self.addSubview(tagStackView)
        tagStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.leading.equalTo(webtoonImageView.snp.trailing).offset(11)
            $0.width.lessThanOrEqualTo(100)
            $0.height.equalTo(17)
        }
    }
    
}
