//
//  HomeIconListView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI

struct HomeIconListView: View {
    private let iconList = [
        HomeIconView(Image(systemName: "house.fill"),iconColor: .everytimeColor){
            Text("학교 홈").font(.system(size: 12)).multilineTextAlignment(.center).frame(width:30).eraseToAnyView()
        },
        HomeIconView(Image(systemName: "book.fill"),iconColor: .orange){
            Text("열람실 현황").font(.system(size: 12)).multilineTextAlignment(.center).frame(width:50).eraseToAnyView()
        },
        HomeIconView(Image(systemName: "wallet.pass.fill"),iconColor: .blue){
            Text("e-Campus").font(.system(size: 12)).multilineTextAlignment(.center).frame(width:60).eraseToAnyView()
        },
        HomeIconView(Image(systemName: "speaker.fill"),iconColor: .cyan){
            Text("학사 공지").font(.system(size: 12)).multilineTextAlignment(.center).frame(width:30).eraseToAnyView()
        },
        HomeIconView(Image(systemName: "calendar"),iconColor: .green){
            Text("학사 일정").font(.system(size: 12)).multilineTextAlignment(.center).frame(width:30).eraseToAnyView()
        },
        HomeIconView(Image(systemName: "book.fill"),iconColor: .orange){
            Text("도서관").font(.system(size: 12)).multilineTextAlignment(.center).frame(width:40).eraseToAnyView()
        },
        HomeIconView(Image(systemName: "network"),iconColor: .cyan){
            Text("웹메일").font(.system(size: 12)).multilineTextAlignment(.center).frame(width:40).eraseToAnyView()
        }]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<iconList.capacity){
                    iconList[$0]
                }
            }
        }
    }
}

struct HomeIconListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeIconListView()
    }
}
