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
        addButtonTargets()
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
    
    private func addButtonTargets() {
        searchView.filterTabView.allTab.addTarget(self, action: #selector(filterTabTapped), for: .touchUpInside)
        searchView.filterTabView.nowTab.addTarget(self, action: #selector(filterTabTapped), for: .touchUpInside)
        searchView.filterTabView.afterTab.addTarget(self, action: #selector(filterTabTapped), for: .touchUpInside)
    }
    
    @objc
    private func ButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func filterTabTapped(_ sender: UIButton) {
        if sender == searchView.filterTabView.allTab {
            searchView.filterTabView.filterSelected(.all)
        } else if sender == searchView.filterTabView.nowTab {
            searchView.filterTabView.filterSelected(.nowFree)
        } else {
            searchView.filterTabView.filterSelected(.afterFree)
        }
    }

}
