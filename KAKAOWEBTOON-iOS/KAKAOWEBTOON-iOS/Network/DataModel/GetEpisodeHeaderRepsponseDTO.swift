//
//  GetEpisodeHeaderRepsponseDTO.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/26/24.
//

import Foundation

struct GetEpisodeHeaderRepsponseDTO: Codable {
    let status: Int
    let data: EpisodeHeader
}

struct EpisodeHeader: Codable {
    let title: String
    let author: String
    let genre: String
    let viewCount: Int
    let heartCount: Int
    let image: String
    let coupon: Int
    let promotion: String
}
