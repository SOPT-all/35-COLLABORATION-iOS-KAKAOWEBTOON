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
    case addSection
}

class HomeView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.backgroundColor = .clear
        return view
    }()
    
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
            case .addSection:
                return self.addSection()
            }
        }
    }
    
    private func adSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(193)
        )
        
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: itemSize, subitems: [item]
            )
        
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 29, leading: 11, bottom: 0, trailing: 11
        )
        
        return section
    }
    
    private func toonCategorySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init (
                widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                widthDimension: .fractionalWidth(1), heightDimension: .absolute(400)), subitems: [item]
            )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    private func allToonsSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(115), heightDimension: .absolute(230)
        )
        
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        item.contentInsets.leading = 4
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(230)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item, item, item]
        )
        
        let section = NSCollectionLayoutSection(
            group: group
        )
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 0, bottom: 0, trailing: 0
        )
        section.interGroupSpacing = 4
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(28)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
        
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func addSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init (
                widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                widthDimension: .fractionalWidth(1), heightDimension: .absolute(400)), subitems: [item]
            )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
}

#Preview{
    HomeView()
}
