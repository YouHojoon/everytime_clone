//
//  Period.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/24.
//

import Foundation
enum Period: Int{
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven
    case twoelve
    
    var time:Int{
        switch self {
        case .one:
            return 9
        case .two:
            return 10
        case .three:
            return 11
        case .four:
            return 12
        case .five:
            return 1
        case .six:
            return 2
        case .seven:
            return 3
        case .eight:
            return 4
        case .nine:
            return 5
        case .ten:
            return 6
        case .eleven:
            return 7
        case .twoelve:
            return 8
        }
    }
}
