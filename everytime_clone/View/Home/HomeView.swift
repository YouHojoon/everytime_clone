//
//  HomeView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import Foundation
import SwiftUI
import Combine
struct HomeView: View{
    @State private var startScrollOffset = 0.0
    @State private var scrollOffsetSkip = true
    @EnvironmentObject var tabViewModel: TabViewModel
    
    var body: some View{
        ScrollView(showsIndicators:false){
            VStack{
                HomeTopCardListView().padding([.leading,.trailing])
                HomeIconListView().padding([.leading,.trailing]).padding(.top, 10)
                Color.blue.frame(height: 80).cornerRadius(5).padding([.leading,.trailing])
                HomeBoardListView().padding([.leading,.trailing])
                HomePostPreviewListView(.realtimePopularPost).padding([.leading,.trailing])
                HomeAdView(.recommendedInformation).frame(height: 470)
                HomeRecentLectureReviewView().padding([.leading,.trailing])
                HomePostPreviewListView(.hotPost).padding([.leading,.trailing])
                HomePostPreviewListView(.schoolInfomation).padding([.leading,.trailing])
            }.overlay(
                GeometryReader{reader -> Color in
                    DispatchQueue.main.async {
                        if startScrollOffset == 0.0{
                            if scrollOffsetSkip{
                                scrollOffsetSkip = false
                            }
                            else{
                                startScrollOffset = reader.frame(in: .global).minY
                            }
                        }
                        let scrollOffset = reader.frame(in: .global).minY - startScrollOffset
                        if scrollOffset != 0 {
                            tabViewModel.isScrolled.send(true)
                        }
                        else{
                            tabViewModel.isScrolled.send(false)
                        }
                    }
                    return Color.clear
                },
                alignment: .top
            )
            
            VStack{
                HomeInformationView(.employmentInformation)
                HomePostPreviewListView(.universityEncyclopedia)
                HomePostPreviewListView(.schoolMarketing)
                HomeInformationView(.contest)
                HomeInformationView(.internationalActivity)
            }.padding([.leading,.trailing])
            VStack{
                HomeAdView(.event).frame(height: 470)
                HomeInformationView(.book).padding([.leading,.trailing])
                HomeInformationView(.benefit).padding([.leading,.trailing])
                Button{
                    
                }label: {
                    Text("홈 화면 설정").foregroundColor(.gray).font(.system(size:15,weight: .bold))
                }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 30, minHeight: 35, maxHeight: .infinity).background(.gray.opacity(0.3)).cornerRadius(8)
            }.padding(.bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        HomeView().environmentObject(TabViewModel())
    }
}
