//
//  WebtoonTargetType.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/26/24.
//

import Foundation

import Moya

let BaseURL = Bundle.main.infoDictionary?["BASE_URL"] as! String

enum WebtoonTargetType {
    case getWebtoonSearchData(title: String)
    case getDailyWebtoonList(day: String)
    case getRecentWebtoonData
}

extension WebtoonTargetType: TargetType {
    var baseURL: URL {
        return URL(string: BaseURL)!
    }
    
    var path: String {
        switch self {
        case .getWebtoonSearchData:
            return "api/v1/webtoons/search"
        case .getDailyWebtoonList:
            return "api/v1/webtoons"
        case .getRecentWebtoonData:
            return "api/v1/webtoons/recent"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWebtoonSearchData, .getDailyWebtoonList, .getRecentWebtoonData:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getWebtoonSearchData(title: let title):
            return .requestParameters(
                parameters: ["title": title],
                encoding: URLEncoding.default
            )
        case .getDailyWebtoonList(day: let day):
            return .requestParameters(
                parameters: ["day": day],
                encoding: URLEncoding.default
            )
        case .getRecentWebtoonData:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
