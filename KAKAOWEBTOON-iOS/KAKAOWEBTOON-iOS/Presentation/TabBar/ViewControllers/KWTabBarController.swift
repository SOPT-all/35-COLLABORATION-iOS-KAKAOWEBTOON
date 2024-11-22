//
//  KWTabBarController.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/19/24.
//

import UIKit

class KWTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    enum KakaoWebtoonTab: Int, CaseIterable {
        
        case timeTable
        case ranking
        case gift
        case storage
        
        var title: String {
            switch self {
            case .timeTable: return "시간표"
            case .ranking: return "랭킹"
            case .gift: return "선물함"
            case .storage: return "보관함"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .timeTable: return .btnTimetableDisabled
            case .ranking: return .btnRankDisabled
            case .gift: return .btnGiftDisabled
            case .storage: return .btnStoargeDisabled
            }
        }
        
        func viewController() -> UIViewController {
            switch self {
            case .timeTable: return UINavigationController(rootViewController: HomeViewController())
            case .ranking: return UIViewController()
            case .gift: return TempViewController()
            case .storage: return UINavigationController(rootViewController: StorageViewController())
            }
        }
        
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTabBarStyle()
    }
    
    // MARK: - Private func
    
    private func setupTabBar() {
        let viewControllers = KakaoWebtoonTab.allCases.map { tab -> UIViewController in
            let viewController = tab.viewController()
            viewController.tabBarItem = UITabBarItem(title: tab.title , image: tab.image, tag: tab.rawValue)
            return viewController
        }
        
        self.viewControllers = viewControllers
    }
    
    private func setupTabBarStyle() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black3
        appearance.stackedLayoutAppearance.selected.iconColor = .yellow2
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.yellow2
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .dg1
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.dg1
        ]
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
}
