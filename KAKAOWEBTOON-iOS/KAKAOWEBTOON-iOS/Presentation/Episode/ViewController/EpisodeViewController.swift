//
//  EpisodeViewController.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/25/24.
//
import UIKit

import SnapKit

class EpisodeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var webtoon: DailyWebtoon?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true // section1 고정
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        layout.minimumLineSpacing = 17
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let episodes: [EpisodeDetail] = [
        EpisodeDetail(turn: 0, image: "example1", title: "예고", status: 10, date: "24.10.03", dayUntilFree: 0),
        EpisodeDetail(turn: 1, image: "example2", title: "선언금지", status: 7, date: "24.10.10", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0),
        EpisodeDetail(turn: 2, image: "example3", title: "소원", status: 7, date: "24.10.17", dayUntilFree: 0)
    ]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLayout()
        setupNavigationBar()
    }
    
    func configure(with webtoon: DailyWebtoon) {
        self.webtoon = webtoon
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setupNavigationBarStyle(.title(""))
        navigationItem.rightBarButtonItem = UIBarButtonItem.setupBarButtons(
            buttonTypes: [.heart, .seeMore],
            target: nil,
            actions: []
        )
        navigationItem.leftBarButtonItem = UIBarButtonItem.setupBarButton(
            type: .arrow,
            target: self,
            action: #selector(backButtonTapped)
        )
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .black
        collectionView.register(EpisodeHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: EpisodeHeaderView.reuseIdentifier)
        collectionView.register(EpisodeTabBarView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: EpisodeTabBarView.reuseIdentifier)
        collectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: EpisodeCell.reuseIdentifier)
        collectionView.register(EpisodeCellHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: EpisodeCellHeaderView.reuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension EpisodeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3 // section0, section1, section2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 2:
            return episodes.count // section2의 아이템 수
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCell.reuseIdentifier, for: indexPath) as! EpisodeCell
        let episode = episodes[indexPath.item]
        cell.configure(
            with: episode.title,
            date: episode.date,
            image: UIImage(resource: .imgEpisodeEx),
            progress: 0
        )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            switch indexPath.section {
            case 0:
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: EpisodeHeaderView.reuseIdentifier,
                    for: indexPath
                ) as! EpisodeHeaderView
                return header
            case 1:
                let tabBar = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: EpisodeTabBarView.reuseIdentifier,
                    for: indexPath
                ) as! EpisodeTabBarView
                return tabBar
            case 2:
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: EpisodeCellHeaderView.reuseIdentifier,
                    for: indexPath
                ) as! EpisodeCellHeaderView
                return header
            default:
                return UICollectionReusableView()
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 330)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 37)
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 46)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 11)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 3
        let width = (collectionView.bounds.width - 22) / itemsPerRow
        return CGSize(width: width, height: width * 128 / 117)
    }
}

extension EpisodeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 330 {
            navigationController?.navigationBar.prefersLargeTitles = false
        } else {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}
