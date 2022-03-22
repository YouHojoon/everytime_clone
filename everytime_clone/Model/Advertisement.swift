//
//  Advertisement.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import Foundation
import SwiftUI
struct Advertisement{
    let icon: Image
    let advertiser: String
    let contentImage: Image
    let title: String
    let content: String
    let buttonTitle: String
    
    static func getDummy() -> Advertisement{
        return Advertisement(icon: Image("everytime_icon"), advertiser: "광고 더미", contentImage: Image("bol4"), title: "테스트 광고", content: "테스트 내용", buttonTitle: "테스트 버튼")
    }
}
