//
//  HomeTopPost.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI

struct HomeTopPostView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("실시간 인기 글").font(.system(size: 18, weight: .bold)).padding(.bottom, 5)
            PostPreviewView(post: .getDummy()).padding(.bottom, 5)
            PostPreviewView(post: .getDummy())
        }.padding().overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2))
    }
}

struct HomeTopPostView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopPostView()
    }
}
