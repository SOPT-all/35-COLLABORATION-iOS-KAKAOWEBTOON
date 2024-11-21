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
        setupDelegate()
        register()
    }
    
    // MARK: - Private func
    
    private func register() {
        storageView.storageCollectionView
            .register(
                WebToonBoxCell.self,
                forCellWithReuseIdentifier: WebToonBoxCell.reuseIdentifier
            )
    }
    
    private func setupDelegate() {
        storageView.storageCollectionView.dataSource = self
        storageView.storageCollectionView.delegate = self
    }
    
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

// MARK: - Extensions

extension StorageViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 10
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

extension StorageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
}
