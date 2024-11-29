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
    private var episodes: [EpisodeDetail] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        layout.minimumLineSpacing = 17
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchEpisodes(webtoonId: 27)
    }
    
    private func fetchEpisodes(webtoonId: Int) {
        EpisodeService.shared.getEpisodeDetailData(webtoonId: webtoonId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                if let episodeData = data as? GetEpisodeDetailResponseDTO {
                    self.episodes = episodeData.data.episodes
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            case .requestErr:
                fatalError()
            case .unAuthentication:
                fatalError()
            case .unAuthorization:
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
            }
        }
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
        collectionView.backgroundColor = .black3
        collectionView.register(EpisodeHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: EpisodeHeaderView.reuseIdentifier)
        collectionView.register(EpisodeTabBarView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: EpisodeTabBarView.reuseIdentifier)
        collectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: EpisodeCell.reuseIdentifier)
        collectionView.register(EpisodeHeaderCell.self, forCellWithReuseIdentifier: EpisodeHeaderCell.reuseIdentifier)
        
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
        return 2 // section0, section2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1:
            return episodes.count + 1 // 첫 번째 아이템에 HeaderView 포함
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            if indexPath.item == 0 {
                // 첫 번째 아이템: HeaderView
                let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeHeaderCell.reuseIdentifier, for: indexPath) as! EpisodeHeaderCell
                return headerCell
            } else {
                // 나머지 아이템: EpisodeCell
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCell.reuseIdentifier, for: indexPath) as! EpisodeCell
                let episode = episodes[indexPath.item - 1] // -1은 HeaderView 보정
                cell.configure(with: episode) // 네트워크 데이터 적용
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0 {
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: EpisodeHeaderView.reuseIdentifier,
                    for: indexPath
                ) as! EpisodeHeaderView
                return header
            } else if indexPath.section == 1 {
                let tabBar = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: EpisodeTabBarView.reuseIdentifier,
                    for: indexPath
                ) as! EpisodeTabBarView
                return tabBar
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 330)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 37) // TabBar
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
        switch section {
        case 1:
            // Section 1도 Section 0과 동일한 인셋 적용
            return UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 11)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 && indexPath.item == 0 {
            // 첫 번째 아이템: HeaderView 크기
            return CGSize(width: collectionView.bounds.width, height: 46)
        }
        else {
            let itemsPerRow: CGFloat = 3
            let width = (collectionView.bounds.width - 23) / itemsPerRow
            return CGSize(width: width, height: width * 128 / 117)
        }
    }
}
