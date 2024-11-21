//
//  ReuseIdentifiable.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/19/24.
//

import UIKit

protocol ReuseIdentifiable {
    
    static var reuseIdentifier: String { get }
    
}

extension ReuseIdentifiable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionReusableView: ReuseIdentifiable { }

extension UITableViewCell: ReuseIdentifiable { }

extension UITableViewHeaderFooterView: ReuseIdentifiable { }
