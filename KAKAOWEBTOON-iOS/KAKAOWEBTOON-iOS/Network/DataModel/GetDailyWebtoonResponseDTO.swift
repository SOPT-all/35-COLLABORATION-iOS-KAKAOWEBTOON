//
//  GetDailtWebtoonListResponseDTO.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/26/24.
//

import Foundation

struct GetDailyWebtoonResponseDTO: Codable {
    let status: Int
    let data: DailyWebtoonData
}

struct DailyWebtoonData: Codable {
    let webtoons: [DailyWebtoon]
}

struct DailyWebtoon: Codable {
    let id: Int
    let title: String
    let image: String
}
