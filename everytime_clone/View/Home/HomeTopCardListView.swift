//
//  HomeCardListView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import Foundation
import SwiftUI
struct HomeTopCardListView: View{
    private let cardViewList: [HomeTopCardView]
    private let dateString: String
    private let tomorrowDateString: String
    private let dateFormatter = DateFormatter()
    
    init(){
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "M월 dd일 (E)"
        dateString = dateFormatter.string(from: Date())
        tomorrowDateString = dateFormatter.string(from: Date().addingTimeInterval(60*60*24))
        
        cardViewList = [
            HomeTopCardView(title:"선배들의 취준 꿀팁", semiTitle: "취업 정보는 어디서, 어떻게 얻나요?", icon: Image(systemName:"lightbulb.circle"),color: .yellow){
                Button{
                    
                }label: {
                    HStack(spacing:3){
                        Text("자세히")
                        Image(systemName: "greaterthan").foregroundColor(.gray)
                    }
                }.buttonStyle(HomeTopCardButtonStyle()).eraseToAnyView()
            },
            HomeTopCardView(title:"오늘의 할일", semiTitle: dateString,icon: Image(systemName:"checkmark.square"),color: .blue){
                HStack(spacing:5){
                    Button{
                        
                    }label: {
                        HStack(spacing:3){
                            Text("추가")
                            Image(systemName: "plus.square").foregroundColor(.gray)
                        }
                    }.buttonStyle(HomeTopCardButtonStyle())
                    Button{
                        
                    }label: {
                        HStack(spacing:3){
                            Text("전체 보기")
                            Image(systemName: "greaterthan").foregroundColor(.gray)
                        }
                    }.buttonStyle(HomeTopCardButtonStyle())
                }.eraseToAnyView()
            },
            HomeTopCardView(title:"내일의 수업", semiTitle: tomorrowDateString,icon: Image(systemName:"calendar"),color: .everytimeColor){
                VStack(alignment:.leading){
                    HStack(spacing:5){
                        Text("15:00").foregroundColor(.gray).font(.system(size: 10))
                        Text("일본어 입문").font(.system(size: 13))
                    }
                    HStack(spacing:5){
                        Text("18:00").foregroundColor(.gray).font(.system(size: 10))
                        Text("인공지능알고리즘").font(.system(size: 13))
                    }
                }.eraseToAnyView()
            }]
    }
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<cardViewList.capacity){
                    cardViewList[$0]
                }
            }
        }
    }
}


fileprivate struct HomeTopCardButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.foregroundColor(.black).font(.system(size: 10)).padding(5).background(.gray.opacity(0.15)).cornerRadius(20)
    }
}
