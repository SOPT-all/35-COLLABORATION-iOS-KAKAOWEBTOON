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
        storageView.storageTableView.register(WebtoonBoxCell.self, forCellReuseIdentifier: WebtoonBoxCell.reuseIdentifier)
    }
    
    private func setupDelegate() {
//        storageView.storageTableView.delegate = self
        storageView.storageTableView.dataSource = self
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

extension StorageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let webtoonBoxCell = storageView.storageTableView.dequeueReusableCell(withIdentifier: WebtoonBoxCell.reuseIdentifier, for: indexPath) as? WebtoonBoxCell else { return UITableViewCell() }
        return webtoonBoxCell
    }
    
}
