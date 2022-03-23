//
//  LectureReview.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/23.
//

import Foundation
struct LectureReview{
    let professer: String
    let lectureName: String
    let content: String
    let stars: Int
    let likes: Int
    let semester: String
    
    static func getDummy() -> LectureReview{
        return LectureReview(professer: "나재호", lectureName: "컴퓨터수학", content: "어쩌구저쩌구 내용내용 이것저것", stars:3 ,likes: 3, semester: "20년 2학기")
    }
}
