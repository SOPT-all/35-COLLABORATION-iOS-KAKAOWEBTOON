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
        register()
        setupDelegate()
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
        searchView.filterTabView.allTab.addTarget(
            self,
            action: #selector(filterTabTapped),
            for: .touchUpInside
        )
        searchView.filterTabView.nowTab.addTarget(
            self,
            action: #selector(filterTabTapped),
            for: .touchUpInside
        )
        searchView.filterTabView.afterTab.addTarget(
            self,
            action: #selector(filterTabTapped),
            for: .touchUpInside
        )
    }
    
    private func setupDelegate() {
        searchView.resultCollectionView.delegate = self
        searchView.resultCollectionView.dataSource = self
    }
    
    private func register() {
        searchView.resultCollectionView.register(
            WebToonBoxCell.self,
            forCellWithReuseIdentifier: WebToonBoxCell.reuseIdentifier
        )
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

// MARK: - Extensions

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 15
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let webtoonBoxCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WebToonBoxCell.reuseIdentifier,
            for: indexPath
        ) as? WebToonBoxCell else {
            return UICollectionViewCell()
        }
        webtoonBoxCell.configure()
        return webtoonBoxCell
    }
    
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
