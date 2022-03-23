//
//  HomeCardView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI

struct HomeTopCardView: View{
    private var color: Color
    private var icon: Image
    private var title: String
    private var semiTitle: String
    private var bottomContent: () -> AnyView
    init(title: String, semiTitle: String, icon: Image,color: Color, @ViewBuilder bottomContent: @escaping () -> AnyView){
        self.title = title
        self.semiTitle = semiTitle
        self.icon = icon
        self.color = color
        self.bottomContent = bottomContent
    }
    var body: some View {
        VStack(alignment:.leading){
            Spacer().frame(height:15)
            HStack{
                Spacer().frame(width: 15)
                icon.foregroundColor(color).font(.system(size: 27))
                VStack(alignment:.leading){
                    Text(title).font(.system(size: 15,weight: .bold))
                    Text(semiTitle).foregroundColor(color).font(.system(size: 10,weight: .semibold))
                }
            }.frame(width: 230,alignment: .leading)
            
            bottomContent().padding(.leading, 20).padding(.top, 10)
        }.frame(height: 150, alignment: .top).overlay(
            RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3), lineWidth: 2)
        )
    }
}

struct HomeTopCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopCardView(title: "", semiTitle: "", icon: Image(systemName:"lightbulb.circle"),color: .yellow){
            Text("??").eraseToAnyView()
        }
    }
}

