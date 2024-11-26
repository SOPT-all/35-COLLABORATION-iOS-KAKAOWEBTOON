//
//  GetWebtoonSearchResponseDTO.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/26/24.
//

import Foundation

struct GetWebtoonSearchResponseDTO: Codable {
    let status: Int
    let data: WebtoonData
}

struct WebtoonData: Codable {
    let webtoons: [Webtoon]
}

struct Webtoon: Codable {
    let title: String
    let author: String
    let image: String
    let genre: String
    let promotion: String
    
    var tagType: FreeTagViewType {
        return FreeTagViewType(rawValue: promotion) ?? .free
    }
}
