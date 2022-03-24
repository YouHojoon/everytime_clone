//
//  HomeAdView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI
import Foundation
struct HomeAdView: View {
    private let type: `Type`
    private let advertisementList = [
        HomeAdCardView(Advertisement.getDummy()),
        HomeAdCardView(Advertisement.getDummy()),
        HomeAdCardView(Advertisement.getDummy())
    ]
    enum `Type`{
        case recommendedInformation
        case event
        
        fileprivate var title:String{
            switch self{
            case .recommendedInformation:
                return "추천 정보"
            case .event:
                return "이벤트"
            }
        }
    }
    @State private var startOffset = 0.0
    @State private var offset = 0.0
    @State private var currentIndex = 0
    @State private var screenDrag = 0.0
    
    init(_ type:`Type`){
        self.type = type
    }
    var body: some View {
        GeometryReader{reader in
            VStack(alignment:.leading){
                Text(type.title).font(.system(size:18, weight: .bold)).padding([.leading], 30).padding([.top], 20)
                Carousel(contentList:advertisementList, spacing: 8)
            }
        }.overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2).padding([.leading,.trailing]))
    }
}

struct HomeAdView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAdView(.recommendedInformation)
    }
}
