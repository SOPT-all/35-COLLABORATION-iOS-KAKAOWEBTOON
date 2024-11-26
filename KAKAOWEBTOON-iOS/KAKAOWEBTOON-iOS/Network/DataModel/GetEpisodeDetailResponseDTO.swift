//
//  GetEpisodeDetailResponseDTO.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/26/24.
//

import Foundation

struct GetEpisodeDetailResponseDTO: Codable {
    let status: Int
    let data: EpisodeDetailData
}

struct EpisodeDetailData: Codable {
    let episodes: [EpisodeDetail]
}

struct EpisodeDetail: Codable {
    let turn: Int
    let image: String
    let title: String
    let status: Int
    let date: String
    let dayUntilFree: Int
}
