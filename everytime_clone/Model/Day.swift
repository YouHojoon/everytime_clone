//
//  Day.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/24.
//

import Foundation
enum Day: Int,CustomStringConvertible{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
  
    
    var description: String{
        switch self {
        case .monday:
            return "월"
        case .tuesday:
            return "화"
        case .wednesday:
            return "수"
        case .thursday:
            return "목"
        case .friday:
            return "금"
        case .saturday:
            return "토"
        case .sunday:
            return "일"
        }
    }
}
