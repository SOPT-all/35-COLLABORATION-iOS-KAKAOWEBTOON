//
//  EpisodeService.swift
//  KAKAOWEBTOON-iOS
//
//  Created by  정지원 on 11/26/24.
//

import Foundation

import Moya

final class EpisodeService {
    static let shared = EpisodeService()
    private var episodeProvider = MoyaProvider<EpisodeTargetType>(plugins: [MoyaPlugin()])
    
    private init() {}
}

extension EpisodeService {
    ///여기에 각자 맡은 api func 만들기
    func getEpisodeDetailData(webtoonId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        episodeProvider.request(.getEpisodeDetailData(webtoonId: webtoonId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, GetEpisodeDetailResponseDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .networkFail
        default:
            return .networkFail
        }
    }
    
    
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)에서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr
        }
        return .success(decodedData as Any)
    }
}
