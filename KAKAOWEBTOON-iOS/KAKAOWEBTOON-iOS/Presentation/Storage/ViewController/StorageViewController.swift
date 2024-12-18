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
    private let webtoonService = WebtoonService.shared
    private var getRecentWebtoonResponseDTO: GetRecentWebtoonResponseDTO? {
        didSet {
            storageView.storageCollectionView.reloadData()
        }
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = storageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupDelegate()
        register()
        setupGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchRecentWebtoonData()
    }
    
    // MARK: - Private func
    
    private func fetchRecentWebtoonData() {
        webtoonService.getRecentWebtoonData { result in
            switch result {
            case .success(let response):
                guard let getRecentWebtoonResponseDTO = response as? GetRecentWebtoonResponseDTO else {
                    fatalError()
                }
                DispatchQueue.main.async {
                    self.getRecentWebtoonResponseDTO = getRecentWebtoonResponseDTO
                }
                
            case .requestErr:
                fatalError()
            case .apiArr:
                fatalError()
            case .pathErr:
                fatalError()
            case .registerErr:
                fatalError()
            case .networkFail:
                fatalError()
            case .decodeErr:
                fatalError()
            case .unAuthentication:
                fatalError()
            case .unAuthorization:
                fatalError()
            }
        }
    }
    
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
            action: #selector(buttonTapped)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem.setupBarButtons(
            buttonTypes: [.research, .menu],
            target: self,
            actions: [#selector(searchButtonTapped), #selector(buttonTapped)]
        )
    }
    
    private func setupGestures() {
        let recentTapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(CategoryTabSelected)
        )
        storageView.storageHeaderView.recentTab.addGestureRecognizer(recentTapGesture)
        
        let saveTapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(CategoryTabSelected)
        )
        storageView.storageHeaderView.saveTab.addGestureRecognizer(saveTapGesture)
        
        let buyTapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(CategoryTabSelected)
        )
        storageView.storageHeaderView.buyTab.addGestureRecognizer(buyTapGesture)
        
        let downloadTapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(CategoryTabSelected)
        )
        storageView.storageHeaderView.downloadTab.addGestureRecognizer(downloadTapGesture)
        
        let commentTapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(CategoryTabSelected)
        )
        storageView.storageHeaderView.commentTab.addGestureRecognizer(commentTapGesture)
    }
    
    // MARK: - @objc func
    
    @objc
    private func buttonTapped() {
        print(#function)
    }
    
    @objc
    func CategoryTabSelected(_ sender: UITapGestureRecognizer) {
        guard let categoryTabView = sender.view as? CategoryTabView else { return }
        storageView.categoryTabToggle(categoryTabView)
    }
    
    @objc
    private func searchButtonTapped() {
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        searchViewController.modalPresentationStyle = .fullScreen
        self.present(searchViewController, animated: true, completion: nil)
    }
    
}

// MARK: - Extensions

extension StorageViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return getRecentWebtoonResponseDTO?.data.webtoons.count ?? 0
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
        guard let getRecentWebtoonResponseDTO else { return UICollectionViewCell() }
        webtoonBoxCell.configure(getRecentWebtoonResponseDTO.data.webtoons[indexPath.row])
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
