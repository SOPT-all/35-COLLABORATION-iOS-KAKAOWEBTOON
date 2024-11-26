//
//  HomeViewController.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/19/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    // MARK: - UI Properties
    
    private let rootView = HomeView()
    var genreApps: [ToonGenreApp] = ToonGenreApp.toonGenreApps
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black3
        
        setDelegate()
        register()
        setupNavigationBar()
    }
    
    // MARK: - Private Func
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setupNavigationBarStyle(.logo(.imgLogo01))
        
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
    
    private func setDelegate() {
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
    }
    
    private func register() {
        rootView.collectionView.register(
            AdSectionCell.self,
            forCellWithReuseIdentifier: AdSectionCell.reuseIdentifier
        )
        
        rootView.collectionView.register(
            AllToonsSectionCell.self,
            forCellWithReuseIdentifier: AllToonsSectionCell.reuseIdentifier
        )
        
        rootView.collectionView.register(
            ToonCategorySectionCell.self,
            forCellWithReuseIdentifier: ToonCategorySectionCell.reuseIdentifier
        )
        
        rootView.collectionView.register(
            AllToonsSectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: AllToonsSectionHeaderView.reuseIdentifier
        )
        
        rootView.collectionView.register(
            AllToonsSectionFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: AllToonsSectionFooterView.reuseIdentifier
        )
        
        rootView.collectionView.register(
            ToonCategoryHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ToonCategoryHeaderView.reuseIdentifier
        )
    }
    
//    private func setupGesture(for headerView: ToonCategoryHeaderView) {
//        headerView.kindButtons.forEach{ button in
//            let tappedButton = UITapGestureRecognizer(
//                target: self, action: #selector(didTapView(_:))
//            )
//            button.addGestureRecognizer(tappedButton)
//        }
//    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return HomeSection.allCases.count
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let sectionType = HomeSection.allCases[section]
        
        switch sectionType {
        case .adSection:
            return 1
        case .toonCategorySection:
            return genreApps.count
        case .allToonsSection:
            return 9 //서버 넘어오면 model 받아서 indexPath.row로 !
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionType = HomeSection.allCases[indexPath.section]
        
        switch sectionType {
        case .adSection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdSectionCell.reuseIdentifier, for: indexPath) as? AdSectionCell
            else {
                return UICollectionViewCell()
            }
            return cell
        case .toonCategorySection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToonCategorySectionCell.reuseIdentifier, for: indexPath) as? ToonCategorySectionCell
            else {
                return UICollectionViewCell()
            }
            let app = genreApps[indexPath.row]
            cell.configure(with: app)
            return cell
        case .allToonsSection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllToonsSectionCell.reuseIdentifier, for: indexPath) as? AllToonsSectionCell 
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: .init(title: "sss", image: .imgHomeBackground))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 28)
        }
    
    func collectionView(_ collectionView: UICollectionView,
                            viewForSupplementaryElementOfKind kind: String,
                            at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = HomeSection.allCases[indexPath.section]
        
        switch sectionType {
        case .allToonsSection:
            if kind == UICollectionView.elementKindSectionHeader {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "AllToonsSectionHeaderView", for: indexPath) as! AllToonsSectionHeaderView
                return header
            } else if kind == UICollectionView.elementKindSectionFooter {
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "AllToonsSectionFooterView", for: indexPath) as! AllToonsSectionFooterView
                return footer
            }
        case .toonCategorySection:
            let header =
            collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ToonCategoryHeaderView", for: indexPath) as! ToonCategoryHeaderView
            return header
        case .adSection:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
    
    // MARK: - objc Function
    
    @objc
    private func didTapButton() {
        print(#function)
    }
}
