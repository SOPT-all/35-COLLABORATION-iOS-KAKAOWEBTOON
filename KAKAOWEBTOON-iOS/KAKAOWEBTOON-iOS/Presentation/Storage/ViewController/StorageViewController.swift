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
        self.navigationController?.navigationBar.setupNavigationBarStyle(.title("보관함"))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.setupBarButton(
            type: .coin,
            target: self,
            action: #selector(didTapButton)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.setupBarButtons(
            buttonTypes: [.research, .menu],
            target: self,
            actions: [#selector(didTapButton), #selector(didTapButton)]
        )
        
    }
    
    @objc
    private func didTapButton() {
        print(#function)
    }
    
}
