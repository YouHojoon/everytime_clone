//
//  HomeAdCardView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/22.
//

import SwiftUI

struct HomeAdCardView: View {
    private let advertisement: Advertisement
    
    init(_ advertisement: Advertisement){
        self.advertisement = advertisement
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                advertisement.icon.resizable().frame(width:20, height:20)
                Text(advertisement.advertiser).font(.system(size: 13,weight:.bold))
                Spacer()
                Text("AD").foregroundColor(.gray).font(.system(size: 13,weight: .semibold)).frame(width: 30, height: 20).background(.gray.opacity(0.15)).cornerRadius(13)
            }.padding([.leading, .trailing],30)
            advertisement.contentImage.resizable().frame(width: UIScreen.main.bounds.width, height: 250).cornerRadius(10)
            Text(advertisement.title).font(.system(size: 15,weight: .bold)).padding([.leading, .trailing],30)
            Text(advertisement.content).font(.system(size:   15)).padding([.leading, .trailing],30)
            
            HStack{
                Spacer().frame(width:30)
                Button{
                    
                }label: {
                    Text(advertisement.buttonTitle).foregroundColor(.everytimeColor).font(.system(size:15, weight:.semibold)).frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: 35)
                }.overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.everytimeColor, lineWidth: 2))
                Spacer().frame(width:30)
            }
        }
    }
}

struct HomeAdCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAdCardView(Advertisement.getDummy())
    }
}
