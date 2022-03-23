//
//  HomeAdView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI

struct PostPreviewView: View {
    
    enum `Type`{
        case realTimePost
        case hotPost
    }
    
    private let post: Post
    private let dateFormatter =  DateFormatter()
    private let type : `Type`
    init(_ post: Post, type: `Type` = .realTimePost){
        dateFormatter.dateFormat = "MM/dd HH:mm"
        self.type = type
        self.post = post
    }
    
    var body: some View {
        VStack(alignment:.leading,spacing: 0){
            if type == .realTimePost{
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
            }
            
            Text(post.content).font(.system(size: 15)).lineLimit(type == .realTimePost ? 2 : 1).padding(.bottom,3)
            HStack(spacing:0){
                switch type{
                case .realTimePost:
                    Text(post.board.rawValue).foregroundColor(.gray).font(.system(size: 13))
                case .hotPost:
                    if Calendar.current.dateComponents([.day], from: Date()) == Calendar.current.dateComponents([.day], from: post.createdDate){
                        let dateString = dateFormatter.string(from: post.createdDate).split(separator: " ").last!
                        Text(dateString).foregroundColor(.gray).font(.system(size: 13))
                    }
                    else{
                        let dateString = dateFormatter.string(from: post.createdDate).split(separator: " ").first!
                        Text(dateString).foregroundColor(.gray).font(.system(size: 13))
                    }
                    
                }
                
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
        PostPreviewView(Post(user:.getDummy(), createdDate: Date(timeInterval: TimeInterval(60*60*24), since: Date()), title: "제목", content: "내용", likes: 153, comments: 17, board: .free, isAnonymous: true), type: .hotPost)
    }
}
