//
//  TempViewController.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/22/24.
//

import UIKit

import SnapKit

class TempViewController: UIViewController {
    
    private let tempButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search View", for: .normal)
        button.setTitleColor(.primaryWhite, for: .normal)
        button.backgroundColor = .primaryBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .primaryWhite
        self.view.addSubview(tempButton)
        tempButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
        
        tempButton.addTarget(self, action: #selector(tempButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func tempButtonTapped() {
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        searchViewController.modalPresentationStyle = .fullScreen
        self.present(searchViewController, animated: true, completion: nil)
    }

}
