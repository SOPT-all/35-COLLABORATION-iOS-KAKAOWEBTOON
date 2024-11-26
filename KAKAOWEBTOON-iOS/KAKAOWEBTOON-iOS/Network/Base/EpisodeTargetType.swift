//
//  EpisodeTargetType.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/26/24.
//

import Foundation

import Moya

enum EpisodeTargetType {
    case getEpisodeDetailData(webtoonId: Int)
    case getEpisodeHeaderData(webtoonId: Int)
}

extension EpisodeTargetType: TargetType {
    var baseURL: URL {
        return URL(string: BaseURL)!
    }
    
    var path: String {
        switch self {
        case .getEpisodeDetailData, .getEpisodeHeaderData:
            return "api/v1/episodes/details"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getEpisodeDetailData, .getEpisodeHeaderData:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getEpisodeDetailData(webtoonId: let webtoonId):
            return .requestParameters(
                parameters: ["webtoonId": webtoonId],
                encoding: URLEncoding.default
            )
        case .getEpisodeHeaderData(webtoonId: let webtoonId):
            return .requestParameters(
                parameters: ["webtoonId": webtoonId],
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
