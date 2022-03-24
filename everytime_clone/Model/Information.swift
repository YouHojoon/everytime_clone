//
//  EmploymentInformation.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/23.
//

import SwiftUI

struct Information {
    let image : Image
    let title: String
    let content: String

    static func getDummy(_ type:HomeInformationView.`Type`) -> Information{
        
        switch type{
        case .contest:
            return Information(image: Image("bol4"), title: "제 3회\n서울시립대학교 어쩌구저쩌구", content: "서울시립대학교")
        case .book:
            return Information(image: Image("bol4"), title: "Prism Listening and Speaking aaaaaaaaa", content: "12,000")
        case .employmentInformation:
            return Information(image: Image("bol4"), title: "CJ그룹 신입사원 모집", content: "~3/24(AD)")
        case .internationalActivity:
            return Information(image: Image("bol4"), title: "한화영보드\n4기 충전!", content: "(AD) 한화")
        case .benefit:
            return Information(image: Image("bol4"), title: "대학생이라면\n누리세요! 교육할인", content: "광고")
        }
        
    }
}

