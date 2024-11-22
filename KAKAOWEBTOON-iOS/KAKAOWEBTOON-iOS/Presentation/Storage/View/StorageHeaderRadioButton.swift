//
//  StorageRadioButtonView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/21/24.
//

import UIKit

class StorageRadioButtonView: UIView {
    
    /*
     해야할 일 :
     라디오 버튼 추후 구현
     */
    
    // MARK: - Properties
    
    private let title: String
    
    // MARK: - UI Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .appleSDGothicNeo(.body2_sb_13)
        label.applyStyle(.body2_sb_13)
        label.textColor = .dg4
        label.textAlignment = .center
        return label
    }()
    
    private let yellowUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow2
        view.setupCornerRadius(5)
        return view
    }()
    
    // MARK: - Init
    
    init(_ title: String) {
        self.title = title
        super.init(frame: .zero)
        
        setupHierarchy()
        setupStyle()
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupHierarchy() {
        self.addSubviews(titleLabel, yellowUnderLine)
    }
    
    private func setupStyle() {
        
    }
    
    private func setupLayer() {
        
    }
}
