//
//  FriendScheduleView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/28.
//

import SwiftUI

struct FriendScheduleView: View {
    let friends: [User] = [User.getDummy()]
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text("친구 시간표").font(.system(size: 18, weight: .bold))
                Spacer()
                Button{

                }label: {
                    Image(systemName: "plus.app").font(.system(size: 18)).foregroundColor(.black)
                }
            }.padding(.bottom, 15)
            ForEach(0..<friends.count){
                Text(friends[$0].name).font(.system(size: 15))
            }
        }.padding().overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2))
    }
}

struct FriendScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        FriendScheduleView()
    }
}
