//
//  StorageViewController.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/19/24.
//

import UIKit

class StorageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let storageView = StorageView()

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = storageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    // MARK: - Private func
    
    private func setupNavigationBar() {
        self.title = "보관함"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .black3
        appearance.shadowColor = nil

        let titleFont = UIFont.appleSDGothicNeo(.title1_eb_17)
        let titleAttributes: [NSAttributedString.Key: Any] = [
          .font: titleFont,
          .foregroundColor: UIColor.primaryWhite,
          .kern: KakaoWebtoonFont.title1_eb_17.letterSpacing
        ]

        appearance.titleTextAttributes = titleAttributes

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.isNavigationBarHidden = false
    }

}
