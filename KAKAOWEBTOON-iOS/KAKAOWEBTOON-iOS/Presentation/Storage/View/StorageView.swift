//
//  StorageView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/19/24.
//

import UIKit

import SnapKit

class StorageView: UIView {
    
    // MARK: - UI Properties
    
    let storageTableView = UITableView()
    
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
    
    func setupHierarchy() {
        self.addSubviews(storageTableView)
    }
    
    func setupStyle() {
        self.backgroundColor = .black3
        storageTableView.backgroundColor = .primaryRed
    }
    
    func setupLayout() {
        storageTableView.snp.makeConstraints {
            $0.verticalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
