//
//  HomeAdView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI

struct PostPreviewView: View {
    private let post: Post
    private let dateFormatter =  DateFormatter()
    
    init(post: Post){
        dateFormatter.dateFormat = "MM/dd HH:mm"
        
        self.post = post
    }
    
    var body: some View {
        VStack(alignment:.leading,spacing: 0){
            HStack{
                if post.user.icon == nil || post.isAnonymous{
                    Image(systemName: "person.crop.square.fill").foregroundColor(.gray).font(.system(size: 15))
                }else{
                    post.user.icon.foregroundColor(.gray).font(.system(size: 15))
                }
                if post.isAnonymous{
                    Text("익명").font(.system(size: 15,weight: .bold))
                }
                else{
                    Text(post.user.name).font(.system(size: 15,weight: .bold))
                }
                
                Spacer()
                Text(dateFormatter.string(from: post.createdDate)).foregroundColor(.gray).font(.system(size: 13))
            }.padding(.bottom, 5)
            Text(post.title).font(.system(size: 15,weight: .bold)).padding(.bottom, 3)
            Text(post.content).font(.system(size: 15)).lineLimit(2).padding(.bottom,3)
            HStack(spacing:0){
                Text(post.board.rawValue).foregroundColor(.gray).font(.system(size: 13))
                Spacer()
                Image(systemName: "hand.thumbsup").font(.system(size: 13)).foregroundColor(.everytimeColor).padding(.trailing,3)
                Text("\(post.likes)").foregroundColor(.everytimeColor).font(.system(size: 13)).padding(.trailing,5)
                Image(systemName: "message").font(.system(size: 13)).foregroundColor(.cyan).padding(.trailing,3)
                Text("\(post.comments)").foregroundColor(.cyan).font(.system(size: 13))
            }
        }
    }
}

struct PostPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PostPreviewView(post: .getDummy())
    }
}
