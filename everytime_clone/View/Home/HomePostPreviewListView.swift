//
//  HomePostPreviewListView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/23.
//

import SwiftUI

struct HomePostPreviewListView: View {
    private let type: PostPreviewView.`Type`
    private let title:String
    private let postList: [Post]
    private let shouldShowMoreDetail: Bool
    
    init(_ type:PostPreviewView.`Type`){
        self.type = type
        switch type{
        case .realtimePopularPost:
            title =  "실시간 인기 글"
            postList = [.getDummy(), .getDummy()]
            shouldShowMoreDetail = false
        case .hotPost:
            title = "HOT 게시물"
            postList = [.getDummy(), .getDummy(), .getDummy(), .getDummy()]
            shouldShowMoreDetail = true
        case .universityEncyclopedia:
            title = "답변을 기다리는 질문"
            postList = [.getDummy(), .getDummy(), .getDummy()]
            shouldShowMoreDetail = true
        case .schoolMarketing:
            title = "교내 홍보"
            postList = [.getDummy(),.getDummy()]
            shouldShowMoreDetail = true
        case .schoolInfomation:
            title = "교내 소식"
            postList = [.getDummy(), .getDummy()]
            shouldShowMoreDetail = true
        }
    }
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text(title).font(.system(size: 18, weight: .bold))
                Spacer()
                if shouldShowMoreDetail{
                    Text("더 보기 >").foregroundColor(.everytimeColor).font(.system(size: 15))
                }
            }.padding(.bottom, 15)
            if type == .universityEncyclopedia{
                HStack{
                    Image(systemName: "book.closed.fill").foregroundColor(.everytimeColor).font(.system(size: 18)).overlay(Text("100").foregroundColor(.white).font(.system(size:6,weight: .bold)))
                    Text("대학백과").font(.system(size: 15,weight: .bold))
                }.padding(.bottom,3)
                Text("상명대학교 서울캠에 오고 싶어 하는\n수험생들을 위해 답변을 남겨주세요!").font(.system(size: 15)).lineLimit(2).padding(.bottom, 15)
            }
            
            ForEach(0..<postList.count){
                PostPreviewView(postList[$0], type: type).padding(.bottom, 15)
            }
        }.padding().overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2))
    }
}

struct HomePostPreviewListView_Previews: PreviewProvider {
    static var previews: some View {
        HomePostPreviewListView(.universityEncyclopedia)
    }
}
