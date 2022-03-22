//
//  SwiftUIView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI

struct HomeIconView: View {
    private let icon:Image
    private let title: () -> AnyView
    private let iconColor: Color
    init(_ icon:Image, iconColor: Color,@ViewBuilder title: @escaping () -> AnyView){
        self.icon = icon
        self.title = title
        self.iconColor = iconColor
    }
    
    var body: some View {
        VStack(spacing:5){
            Circle().foregroundColor(.gray.opacity(0.15)).frame(width: 50, height: 50).overlay(icon.foregroundColor(iconColor))
            title().frame(height:40,alignment: .top)
        }
    }
}

struct HomeIconView_Previews: PreviewProvider {
    static var previews: some View {
        HomeIconView(Image(systemName: "house"),iconColor: .everytimeColor){
            Text("열람실 현황").font(.system(size: 13)).multilineTextAlignment(.center).frame(width:50).eraseToAnyView()
        }
    }
}
