//
//  SearchViewController.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/22/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties
    
    private let searchView = SearchView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.navigationBar.endEditing(true)
    }
    
    // MARK: - Private func
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setupNavigationBarStyle(.basic)
        navigationItem.rightBarButtonItem = UIBarButtonItem.setupBarButton(
            type: .back,
            target: self,
            action: #selector(ButtonTapped)
        )
        navigationController?.navigationBar.setupSearchBar()
    }
    
    @objc
    private func ButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }

}
