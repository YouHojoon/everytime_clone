//
//  HomeTopPost.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI

struct HomeTopPostView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 15){
            Text("HOT 게시물").font(.system(size: 18, weight: .bold))
            ForEach(0..<4){_ in
                PostPreviewView(.getDummy(),type: .hotPost)
            }
        }.padding().overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2))
    }
}

struct HomeTopPostView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopPostView()
    }
}
