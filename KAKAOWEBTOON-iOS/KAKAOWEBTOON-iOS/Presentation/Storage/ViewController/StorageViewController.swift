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

    }

}
