//
//  LectureReviewView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/23.
//

import SwiftUI

struct LectureReviewPreviewView: View {
    
    private let review: LectureReview
    
    init(_ review: LectureReview){
        self.review = review
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 2){
            HStack(spacing:1){
                ForEach(0..<5){
                    if $0 < review.stars{
                        Image(systemName: "star.fill").foregroundColor(.yellow).font(.system(size:8))
                    }
                    else{
                        Image(systemName: "star.fill").foregroundColor(.gray.opacity(0.3)).font(.system(size:8))
                    }
                }
                
                //                Image(systemName: "hand.thumbsup").font(.system(size: 13)).foregroundColor(.everytimeColor).padding(.leading, 3)
                Spacer()
            }
            Text("\(review.lectureName) : \(review.professer)").font(.system(size: 10,weight: .bold))
            Text("\(review.content)").lineLimit(2).font(.system(size: 10))
        }
    }
}

struct LectureReviewPreview_Previews: PreviewProvider {
    static var previews: some View {
        LectureReviewPreviewView(LectureReview.getDummy())
    }
}
