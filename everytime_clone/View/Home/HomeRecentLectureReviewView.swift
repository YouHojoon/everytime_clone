//
//  HomeRecentReviewView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/23.
//

import SwiftUI

struct HomeRecentLectureReviewView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 10){
            HStack{
                Text("최근 강의평").font(.system(size: 18, weight: .bold))
                Spacer()
                Text("더 보기 >").foregroundColor(.everytimeColor).font(.system(size: 15))
            }
            ForEach(0..<4){_ in
                LectureReviewPreviewView(LectureReview.getDummy())
            }
        }.padding().overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2))
    }
}

struct HomeRecentLectureReviewView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecentLectureReviewView()
    }
}
