//
//  SearchView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/22/24.
//

import UIKit

import SnapKit

class SearchView: UIView {
    
    // MARK: - UI Properties
    
    let filterTabView = FilterTabView()
    
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
    
    private func setupHierarchy() {
        self.addSubviews(filterTabView)
    }
    
    private func setupStyle() {
        self.backgroundColor = .black3
    }
    
    private func setupLayout() {
        filterTabView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(53)
        }
    }
    
}
