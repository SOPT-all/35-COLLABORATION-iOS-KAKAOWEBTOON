//
//  EpisodeHeaderCell.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/29/24.
//
import UIKit

class EpisodeHeaderCell: UICollectionViewCell {
    private let headerView: EpisodeCellHeaderView = {
        let view = EpisodeCellHeaderView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
