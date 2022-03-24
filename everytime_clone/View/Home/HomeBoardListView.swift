//
//  HomeBoardListView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI

struct HomeBoardListView: View {
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text("즐겨찾는 게시판").font(.system(size: 18, weight: .bold))
                Spacer()
                Text("더 보기 >").foregroundColor(.everytimeColor).font(.system(size: 15))
            }
            ForEach(0..<5){_ in
                HStack{
                    Text("자유게시판").font(.system(size: 15, weight: .medium))
                    Text("어쩌구저쩌구 내용내용내용내용내용내용내용내용내용내용").lineLimit(1).foregroundColor(.gray).font(.system(size: 13))
                    Text("N").foregroundColor(.white).font(.system(size: 8,weight: .bold)).frame(width: 10, height: 10).background(Color.everytimeColor).cornerRadius(3)
                }
            }
        }.padding().overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2))
    }
}

struct HomeBoardListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBoardListView()
    }
}
