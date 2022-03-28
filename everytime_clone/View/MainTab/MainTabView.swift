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
    enum TabIndex{
        case home
        case schedule
        case board
        case notice
        case campusPick
    }
    
    var body: some View{
        
            VStack(spacing: 0){
                VStack(alignment:.leading){
                    header
                }.padding([.leading, .trailing,.bottom], 20).background(Color.white.shadow(color: .black.opacity(shouldShowHeaderShadow ? 0.1 : 0), radius: 2, x: 0, y: 2).onReceive(viewModel.isScrolled){
                    shouldShowHeaderShadow = $0
                })
                
                content
                
                HStack(spacing:0){
                    Button{
                        tabIndex = .home
                    }label: {
                        Image(systemName: "house").foregroundColor(getTabBarItemColor(tabIndex: .home))                    }.buttonStyle(MainTabBarItemStyle())
                    
                    Button{
                        tabIndex = .schedule
                    }label: {
                        Image(systemName: "calendar").foregroundColor(getTabBarItemColor(tabIndex: .schedule))                    }.buttonStyle(MainTabBarItemStyle())
                    
                    Button{
                        tabIndex = .board
                    }label: {
                        Image(systemName: "list.bullet.rectangle").foregroundColor(getTabBarItemColor(tabIndex: .board))
                    }.buttonStyle(MainTabBarItemStyle())
                    
                    Button{
                        tabIndex = .notice
                    }label: {
                        Image(systemName: "bell").foregroundColor(getTabBarItemColor(tabIndex: .notice))
                    }.buttonStyle(MainTabBarItemStyle())
                    
                    Button{
                        tabIndex = .campusPick
                    }label: {
                        Image(systemName: "graduationcap").foregroundColor(getTabBarItemColor(tabIndex: .campusPick))                    }.buttonStyle(MainTabBarItemStyle())
                }.background(Color.white.shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: -2))
            }
        
    }
    
    private func getTabBarItemColor(tabIndex: TabIndex) -> Color{
        return tabIndex == self.tabIndex ? .black : .gray
    }
    
    @ViewBuilder
    private var content : some View{
        switch tabIndex {
        case .home:
            HomeView().onAppear{
                viewModel.isScrolled.send(false)
            }
        case .schedule:
            ScheduleView().padding([.leading,.trailing],10).onAppear{
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

    private var header : MainTabViewHeader{
        switch tabIndex {
        case .home:
            return MainTabViewHeader(.home)
        case .schedule:
            return MainTabViewHeader(.schedule)
        default:
            return MainTabViewHeader(.home)
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
        configuration.label.font(.system(size: 25)).frame(width: UIScreen.main.bounds.width / 5, height: 50)
    }
}
