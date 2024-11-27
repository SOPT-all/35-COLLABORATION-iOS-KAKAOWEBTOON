//
//  RecommandWebtoon.swift
//  KAKAOWEBTOON-iOS
//
//  Created by 김승원 on 11/27/24.
//

import Foundation

struct RecommandWebtoon {
    let webtoons: [Webtoon]
}

extension RecommandWebtoon {
    
    static let mockData: [Webtoon] = [
        Webtoon(
            title: "웽툰",
            author: "춘삼이",
            image: "https://i.ibb.co/sszrRjn/img-storage-toon04.png",
            genre: "일상/개그",
            promotion: "시계"
        ),
        Webtoon(
            title: "어쿠스틱 라이프",
            author: "난다",
            image: "https://i.ibb.co/JrRcFQ9/img-storage-toon01.png",
            genre: "일상/개그",
            promotion: "연재무료"
        ),
        Webtoon(
            title: "아이오에스파이패밀리",
            author: "6팀 에스파",
            image: "https://newsimg.sedaily.com/2022/07/10/268GU9UQSV_1.jpg",
            genre: "액션/코미디",
            promotion: "up"
        ),
        Webtoon(
            title: "TEN",
            author: "이은재",
            image: "https://i.ibb.co/WH4pbTV/img-storage-toon06.png",
            genre: "판타지/무협",
            promotion: "3다무"
        ),
        Webtoon(
            title: "청춘극장",
            author: "이은재",
            image: "https://i.ibb.co/xCF0VNF/img-storage-toon07.png",
            genre: "드라마",
            promotion: "up"
        ),
        Webtoon(
            title: "ONE",
            author: "이은재",
            image: "https://i.ibb.co/qNmzh5V/img-storage-toon05.png",
            genre: "판타지/무협",
            promotion: "연재무료"
        ),
    ]
    
}
