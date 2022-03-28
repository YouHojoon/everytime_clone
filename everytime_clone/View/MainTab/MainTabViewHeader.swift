//
//  MainTabTopView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/24.
//

import SwiftUI

struct MainTabViewHeader: View {
    
    private let tabIndex:MainTabView.TabIndex
    
    @EnvironmentObject var viewModel: TabViewModel
    @State private var subTitle = ""
    @State private var title = ""
    
    init(_ tabIndex: MainTabView.TabIndex){
        self.tabIndex = tabIndex
    }
    var body: some View {
        content
    }

    
    var content: some View{
        DispatchQueue.main.async {
            switch tabIndex{
            case .home:
                subTitle = "에브리타임"
                title = "상명대 서울캠"
            case .schedule:
                subTitle = ""
                title = ""
            default:
                subTitle = "에브리타임"
                title = "상명대 서울캠"
            }
        }

        return VStack(alignment:.leading){
            Divider().opacity(0)
            Text(subTitle).foregroundColor(.everytimeColor).font(.system(size:15,weight: .medium))

            HStack(spacing:20){
                Text(title).font(.system(size: 25,weight: .bold))
                Spacer()
                buttons
            }
        }
    }
    
    @ViewBuilder
    var buttons: some View{
        switch tabIndex{
        case .home:
            Button{
                
            }label: {
                Image(systemName: "magnifyingglass").font(.system(size:25)).foregroundColor(.black).eraseToAnyView()
            }
            Button{
                
            }label: {
                Image(systemName: "person").modifier(ButtonTextLabelViewModifier()).eraseToAnyView()
            }
        case .schedule:
            Button{

            }label: {
                Image(systemName: "plus.app").modifier(ButtonTextLabelViewModifier()).eraseToAnyView()
            }
            Button{

            }label: {
                Image(systemName: "gearshape").modifier(ButtonTextLabelViewModifier()).eraseToAnyView()
            }
            Button{

            }label: {
                Image(systemName: "list.bullet").modifier(ButtonTextLabelViewModifier()).eraseToAnyView()
            }
        default:
            Button{
                
            }label: {
                Image(systemName: "magnifyingglass").font(.system(size:25)).foregroundColor(.black).eraseToAnyView()
            }
            Button{
                
            }label: {
                Image(systemName: "person").modifier(ButtonTextLabelViewModifier()).eraseToAnyView()
            }
        }
    }
}

struct MainTabViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainTabViewHeader(.schedule).environmentObject(TabViewModel())
    }
}


fileprivate struct ButtonTextLabelViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content.font(.system(size: 25)).foregroundColor(.black)
    }
}
