//
//  HomeView.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/20/24.
//

import UIKit

import SnapKit

enum HomeSection: CaseIterable{
    case adSection
    case toonCategorySection
    case allToonsSection
}

class HomeView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
          self.addSubview(collectionView)
      }
    
    func setupLayout() {
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {(section, _) -> NSCollectionLayoutSection? in 
            
            let sectionType = HomeSection.allCases[section]
            
            switch sectionType {
            case .adSection:
                return self.adSection()
            case .toonCategorySection:
                return self.toonCategorySection()
            case .allToonsSection:
                return self.allToonsSection()
            }
        }
    }
    
    // MARK: - Private Func
    
    private func adSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200)
        )
        
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(214)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item]
            )
        
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 8, leading: 11, bottom: 0, trailing: 11
        )
        
        return section
    }
    
    private func toonCategorySection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(50),
            heightDimension: .absolute(30)
        )
        
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2.0),
            heightDimension: .absolute(46)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
                subitems: [item]
            )
        
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(8)
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(51)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "stickyHeader",
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 11, bottom: 0, trailing: 11
        )
        
//        header.pinToVisibleBounds = true
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func allToonsSection() -> NSCollectionLayoutSection {
        
        let toonRatio: CGFloat = 230 / 115
        let toonWidth = (UIScreen.main.bounds.width - 22 - 8) / 3
        let toonHeight = toonWidth * toonRatio
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(toonWidth), heightDimension: .absolute(toonHeight)
        )
        
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(toonHeight)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item, item, item]
        )
        
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(4)
        
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 11, bottom: 0, trailing: 11
        )
        section.interGroupSpacing = 4
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(28)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
        
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(173)
        )
        
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom
        )
        
        section.boundarySupplementaryItems = [header, footer]
        
        return section
    }
}
