//
//  HomeEmploymentInformationView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/23.
//

import SwiftUI

struct HomeInformationView: View {
    private var info: Information
    private let type: `Type`
    
    enum `Type`{
        case book
        case employmentInformation
        case contest
        case internationalActivity
        case benefit
        
        fileprivate var title:String{
            switch self{
            case .employmentInformation:
                return "채용 정보"
            case .contest:
                return "공모전"
            case .internationalActivity:
                return "대외활동"
            case .book:
                return "판매 중인 책"
            case .benefit:
                return "대학생 복지 혜택"
            }
        }
    }
    
    init(_ type: `Type`){
        self.type = type
        self.info = Information.getDummy(type)
    }
    var body: some View {
        VStack(alignment:.leading, spacing: 10){
            HStack{
                Text(type.title).font(.system(size: 18, weight: .bold))
                Spacer()
                Text("더 보기 >").foregroundColor(.everytimeColor).font(.system(size: 15))
            }
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:8){
                    ForEach(0..<10){_ in
                        VStack(spacing:5){
                            info.image.resizable().frame(width: 140, height: 160).cornerRadius(13).overlay(VStack{
                                Spacer()
                                Color.white.frame(height: 10)
                            })
                            
                            Text(info.title).font(.system(size:13,weight: .bold)).lineLimit(2).frame(width:120, alignment: .leading)
                            Text(info.content).foregroundColor(.gray).font(.system(size:10)).frame(width:120,alignment: .leading).padding(.bottom, 10)
                        }.overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2))
                    }
                }
            }
        }.padding().overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2))
    }
}

struct HomeInformationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeInformationView(.contest)
    }
}
