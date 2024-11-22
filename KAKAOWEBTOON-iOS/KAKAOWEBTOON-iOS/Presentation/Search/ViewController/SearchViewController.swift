//
//  SearchViewController.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/22/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties
    
    private let searchView = SearchView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
