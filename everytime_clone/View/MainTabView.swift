//
//  TabView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/17.
//

import Foundation
import SwiftUI
import Combine
struct MainTabView: View{
    @State private var tabIndex: TabIndex = .home
    @State private var shouldShowHeaderShadow = false
    @EnvironmentObject var viewModel: TabViewModel
    
    private let test = HomeView()
    private enum TabIndex{
        case home
        case schedule
        case board
        case notice
        case campusPick
    }
    
    var body: some View{
        GeometryReader{reader in
            VStack(spacing: 0){
                VStack(alignment:.leading){
                    Divider().opacity(0)
                    Text("에브리타임").foregroundColor(.everytimeColor).font(.system(size:15,weight: .medium))
                    HStack{
                        Text("상명대 서울캠").font(.  system(size: 25,weight: .bold))
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
                }.padding([.leading, .trailing, .bottom], 20).background(Color.white.shadow(color: .black.opacity(shouldShowHeaderShadow ? 0.1 : 0), radius: 2, x: 0, y: 2).onReceive(viewModel.isScrolled){
                    shouldShowHeaderShadow = $0
                })
                
                contentView
                
                HStack(spacing:0){
                    Button{
                        tabIndex = .home
                    }label: {
                        Image(systemName: "house").foregroundColor(getTabBarItemColor(tabIndex: .home)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(MainTabBarItemStyle())
                    
                    Button{
                        tabIndex = .schedule
                    }label: {
                        Image(systemName: "calendar").foregroundColor(getTabBarItemColor(tabIndex: .schedule)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(MainTabBarItemStyle())
                    
                    Button{
                        tabIndex = .board
                    }label: {
                        Image(systemName: "list.bullet.rectangle").foregroundColor(getTabBarItemColor(tabIndex: .board)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(MainTabBarItemStyle())
                    
                    Button{
                        tabIndex = .notice
                    }label: {
                        Image(systemName: "bell").foregroundColor(getTabBarItemColor(tabIndex: .notice)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(MainTabBarItemStyle())
                    
                    Button{
                        tabIndex = .campusPick
                    }label: {
                        Image(systemName: "graduationcap").foregroundColor(getTabBarItemColor(tabIndex: .campusPick)).font(.system(size: 25)).frame(width: reader.size.width / 5, height: 50)
                    }.buttonStyle(MainTabBarItemStyle())
                }.background(Color.white.shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: -2))
            }
        }.edgesIgnoringSafeArea([.leading, .trailing])
    }
    
    private func getTabBarItemColor(tabIndex: TabIndex) -> Color{
        return tabIndex == self.tabIndex ? .black : .gray
    }
    
    @ViewBuilder
    private var contentView : some View{
        switch tabIndex {
        case .home:
            HomeView().onAppear{
                viewModel.isScrolled.send(false)
            }
        case .schedule:
            Text("???").onAppear{
                viewModel.isScrolled.send(false)
            }
        case .board:
            HomeView()
        case .notice:
            HomeView()
        case .campusPick:
            HomeView()
        }
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView().environmentObject(TabViewModel())
    }
}
fileprivate struct MainTabBarItemStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
