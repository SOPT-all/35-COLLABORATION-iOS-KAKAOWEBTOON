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
        let item = NSCollectionLayoutItem(
            layoutSize: .init (
                widthDimension: .fractionalWidth(1), heightDimension: .absolute(400)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                widthDimension: .fractionalWidth(1), heightDimension: .absolute(400)), subitems: [item]
            )
        
        let section = NSCollectionLayoutSection(group: group)
        
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
