//
//  HomeAdView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/21.
//

import SwiftUI

struct PostPreviewView: View {
    
    enum `Type`{
        case hotPost
        case schoolMarketing
        case realtimePopularPost
        case universityEncyclopedia
        case schoolInfomation
        
        fileprivate var shouldShowName: Bool{
            switch self{
            case .hotPost, .universityEncyclopedia:
                return false
            default:
                return true
            }
        }
        
        fileprivate var shouldShowCreatedDate: Bool{
            switch self{
            case .realtimePopularPost:
                return true
            default:
                return false
            }
        }
        
        fileprivate var shouldShowTitle: Bool{
            switch self{
            case .hotPost:
                return false
            default:
                return true
            }
        }
        
        fileprivate var contentLinelimit:Int{
            switch self{
            case .hotPost:
                return 1
            default:
                return 2
            }
        }
        fileprivate var shouldShowImage: Bool{
            switch self{
            case .schoolMarketing,.schoolInfomation:
                return true
            default:
                return false
            }
        }
        
        fileprivate var shouldShowReaction: Bool{
            switch self{
            case .universityEncyclopedia:
                return false
            default:
                return true
            }
        }
        
    }
    
    private let post: Post
    private let dateFormatter =  DateFormatter()
    private let type : `Type`
    
    
    init(_ post: Post, type: `Type` = .realtimePopularPost){
        dateFormatter.dateFormat = "MM/dd HH:mm"
        self.type = type
        self.post = post
    }
    @State var lineLimit = 0
    var body: some View {
        VStack(alignment:.leading,spacing: 0){
            HStack{
                VStack(alignment: .leading, spacing: 0){
                    if type.shouldShowName{
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
                            if type.shouldShowCreatedDate{
                                Text(dateFormatter.string(from: post.createdDate)).foregroundColor(.gray).font(.system(size: 13))
                            }
                        }.padding(.bottom, 5)
                    }
                    
                    if type.shouldShowTitle{
                        Text(post.title).font(.system(size: 15,weight: .bold)).padding(.bottom, 3)
                    }
                    Text(post.content).font(.system(size: 15)).lineLimit(type.contentLinelimit).padding(.bottom,3)
                    
                    HStack(spacing:0){
                        bottomView
                        Spacer()
                        if type.shouldShowReaction{
                            Image(systemName: "hand.thumbsup").font(.system(size: 10)).foregroundColor(.everytimeColor).padding(.trailing,3)
                            Text("\(post.likes)").foregroundColor(.everytimeColor).font(.system(size: 10)).padding(.trailing,5)
                            Image(systemName: "message").font(.system(size: 10)).foregroundColor(.cyan).padding(.trailing,3)
                            Text("\(post.comments)").foregroundColor(.cyan).font(.system(size: 10))
                        }
                    }.padding(.trailing, 10)
                    
                    
                }
                if type.shouldShowImage, let image = post.image{
                    image.resizable().frame(width:100, height: 100).cornerRadius(10)
                }
            }
        }
    }
    
    private var bottomView: some View{
        switch type{
        case .hotPost:
            if Calendar.current.dateComponents([.day], from: Date()) == Calendar.current.dateComponents([.day], from: post.createdDate){
                let dateString = dateFormatter.string(from: post.createdDate).split(separator: " ").last!
                return Text(dateString).foregroundColor(.gray).font(.system(size: 13))
            }
            else{
                let dateString = dateFormatter.string(from: post.createdDate).split(separator: " ").first!
                return Text(dateString).foregroundColor(.gray).font(.system(size: 13))
            }
        default:
            return Text(post.board.rawValue).foregroundColor(.gray).font(.system(size: 13))
        }
    }
    
    
}

struct PostPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PostPreviewView(.getDummy())
    }
}
