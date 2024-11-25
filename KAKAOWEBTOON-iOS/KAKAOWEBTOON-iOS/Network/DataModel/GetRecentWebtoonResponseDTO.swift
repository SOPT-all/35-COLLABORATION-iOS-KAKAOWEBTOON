//
//  GetRecentWebtoonResponseDTO.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/26/24.
//

import Foundation

struct GetRecentWebtoonResponseDTO: Codable {
    let status: Int
    let data: RecentWebtoonData
}

struct RecentWebtoonData: Codable {
    let webtoons: [RecentWebtoon]
}

struct RecentWebtoon: Codable {
    let title: String
    let author: String
    let image: String
    let genre: String
    let promotion: String
}
