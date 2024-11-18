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
            case .timeTable: return UIViewController()
            case .ranking: return UIViewController()
            case .gift: return UIViewController()
            case .storage: return UIViewController()
            }
        }
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
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

}
