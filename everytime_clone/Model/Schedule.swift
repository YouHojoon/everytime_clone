//
//  Schedule.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/24.
//

import Foundation
struct Schedule{
    let semester: String
    let name: String
    let lectures: [Lecture]
    
    static func getDummy() -> Schedule{
        return Schedule(semester: "2022년도 1학기", name: "시간표 1", lectures: [.getDummy()])
    }
}
