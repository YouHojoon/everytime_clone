//
//  Post.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import Foundation
import SwiftUI
struct Post{
    let user: User
    let createdDate: Date
    let title: String
    let content: String
    let likes: Int
    let comments: Int
    let board: Board
    let isAnonymous: Bool
    let image : Image?
    static func getDummy() -> Post{
        return Post(user:.getDummy(), createdDate: Date(), title: "제목", content: "내용", likes: 153, comments: 17, board: .free, isAnonymous: true, image: Image("bol4"))
    }
}
