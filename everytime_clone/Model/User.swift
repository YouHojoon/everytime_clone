//
//  User.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import Foundation
import SwiftUI
struct User{
    let name: String
    let icon: Image?
    
    static func getDummy() -> User{
        return User(name: "익명", icon: nil)
    }
}
