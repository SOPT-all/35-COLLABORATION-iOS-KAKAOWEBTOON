//
//  ToonGenreApp.swift
//  KAKAOWEBTOON-iOS
//
//  Created by MaengKim on 11/25/24.
//

import UIKit

struct ToonGenreApp {
    let genre: String
}

extension ToonGenreApp {
    static let toonGenreApps: [ToonGenreApp] = [
        ToonGenreApp(genre: "전체"),
        ToonGenreApp(genre: "일상/개그"),
        ToonGenreApp(genre: "로맨스"),
        ToonGenreApp(genre: "드라마"),
        ToonGenreApp(genre: "학원/액션"),
        ToonGenreApp(genre: "판타지/무협"),
        ToonGenreApp(genre: "스릴러")
    ]
}
