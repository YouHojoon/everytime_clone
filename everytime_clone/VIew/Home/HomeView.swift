//
//  HomeView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import Foundation
import SwiftUI
struct HomeView: View{
    var body: some View{
        ScrollView(showsIndicators:false){
            VStack{
                HomeTopCardListView().padding([.leading,.trailing])
                HomeIconListView().padding([.leading,.trailing]).padding(.top, 10)
                Color.blue.frame(height: 80).padding([.leading,.trailing]).cornerRadius(5)
                HomeBoardListView().padding([.leading,.trailing])
                HomeTopPostView().padding([.leading,.trailing])
                HomeAdView().frame(height: 470)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}

