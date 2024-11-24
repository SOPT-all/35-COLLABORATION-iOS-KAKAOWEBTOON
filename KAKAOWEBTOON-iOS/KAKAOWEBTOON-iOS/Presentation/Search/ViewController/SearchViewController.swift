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
        
        if let searchTextField = navigationController?.navigationBar.setupSearchBar() {
            searchTextField.delegate = self
        }
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
        
        searchView.resultCollectionView
            .register(
                ResultHeaderView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: ResultHeaderView.reuseIdentifier
            )
        
        searchView.resultCollectionView
            .register(
                RecommandHeaderView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: RecommandHeaderView.reuseIdentifier
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if section == 0 {
            return 10
        } else {
            return 8
        }
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
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0 {
                guard let resultHeader = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: ResultHeaderView.reuseIdentifier,
                    for: indexPath
                ) as? ResultHeaderView else {
                    return UICollectionReusableView()
                }
                return resultHeader
                
            } else {
                guard let recommandHeader = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: RecommandHeaderView.reuseIdentifier,
                    for: indexPath
                ) as? RecommandHeaderView else {
                    return UICollectionReusableView()
                }
                return recommandHeader
            }
        }
        return UICollectionReusableView()
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
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 44)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.navigationController?.navigationBar.endEditing(true)
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.navigationController?.navigationBar.endEditing(true)
        return true
    }
}
