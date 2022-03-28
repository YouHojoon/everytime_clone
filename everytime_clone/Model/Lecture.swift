//
//  Lecture.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/24.
//

import Foundation
struct Lecture{
    let name: String
    let professer: String
    let room: String
    let periods: [Period]
    let day : Day
    var id : [Int] = []
    
    init(name: String, professer: String, room: String, periods: [Period], day: Day){
        self.name = name
        self.professer = professer
        self.room = room
        self.periods = periods
        self.day = day
        for period in periods {
            id.append(5 * period.rawValue + day.rawValue)
        }
    }
    
    static func getDummy() -> Lecture{
        return Lecture(name: "일본어 입문", professer: "신현태", room: "N201", periods: [.six, .seven], day: .tuesday)
    }
}
