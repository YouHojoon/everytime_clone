//
//  TabView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/17.
//

import Foundation
import SwiftUI

struct TabView: View{
    @State private var tabIndex: TabIndex = .home
    
    private enum TabIndex{
        case home
        case schedule
        case board
        case notice
        case campusPick
    }
    
    init(){
        UIScrollView.appearance().bounces = false//맨 끝의 bounce 막기
    }
    
    var body: some View{
        GeometryReader{reader in
            VStack(spacing: 0){
                VStack(alignment:.leading){
                    Divider().opacity(0)
                    Text("에브리타임").foregroundColor(.everytimeColor).font(.system(size:15,weight: .medium))
                    HStack{
                        Text("상명대 서울캠").font(.system(size: 25,weight: .bold))
                        Spacer()
                        Button{
                            
                        }label: {
                            Image(systemName: "magnifyingglass").font(.system(size: 25)).foregroundColor(.black)
                        }.padding(.trailing, 10)
                        Button{
                            
                        }label: {
                            Image(systemName: "person").font(.system(size: 25)).foregroundColor(.black)
                        }
                    }
                }.padding([.leading, .trailing], 20)
                
                ScrollView(.vertical,showsIndicators: false){
                    ForEach(1..<100){
                        Text("테스트\($0)").frame(width: reader.size.width)
                    }
                }
                
                
                HStack(spacing:0){
                    Button{
                        tabIndex = .home
                    }label: {
                        Image(systemName: "house").foregroundColor(getTabBarItemColor(tabIndex: .home)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(TabBarItemStyle())
                    
                    Button{
                        tabIndex = .schedule
                    }label: {
                        Image(systemName: "calendar").foregroundColor(getTabBarItemColor(tabIndex: .schedule)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(TabBarItemStyle())
                    
                    Button{
                        tabIndex = .board
                    }label: {
                        Image(systemName: "list.bullet.rectangle").foregroundColor(getTabBarItemColor(tabIndex: .board)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(TabBarItemStyle())
                    
                    Button{
                        tabIndex = .notice
                    }label: {
                        Image(systemName: "bell").foregroundColor(getTabBarItemColor(tabIndex: .notice)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(TabBarItemStyle())
                    
                    Button{
                        tabIndex = .campusPick
                    }label: {
                        Image(systemName: "graduationcap").foregroundColor(getTabBarItemColor(tabIndex: .campusPick)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(TabBarItemStyle())
                }.background(Color.white.shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: -2))
            }
        }.edgesIgnoringSafeArea([.leading, .trailing])
    }
    
    
    private func getTabBarItemColor(tabIndex: TabIndex) -> Color{
        return tabIndex == self.tabIndex ? .black : .gray
    }
    
    private var contentView: some View{
        switch tabIndex {
        case .home:
            return Text("홈")
        case .schedule:
            return Text("장바구니")
        case .board:
            return Text("프로필")
        case .notice:
            return Text("프로필")
        case .campusPick:
            return Text("프로필")
            
        }
    }
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
fileprivate struct TabBarItemStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
