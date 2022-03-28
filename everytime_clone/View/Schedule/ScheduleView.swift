//
//  LectureReviewView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/23.
//

import SwiftUI

struct ScheduleView: View {
    @State private var startScrollOffset = 0.0
    @State private var scrollOffsetSkip = true
    @EnvironmentObject var tabViewModel : TabViewModel
    
    let schedule =  Schedule.getDummy()
    
    var body: some View {
        ScrollView(showsIndicators:false){
            VStack{
                GeometryReader{reader -> AnyView in
                    DispatchQueue.main.async {
                        if startScrollOffset == 0.0{
                            if scrollOffsetSkip{
                                scrollOffsetSkip = false
                            }
                            else{
                                startScrollOffset = reader.frame(in: .global).minY
                            }
                        }
                        let scrollOffset = reader.frame(in: .global).minY - startScrollOffset
                        if scrollOffset != 0 {
                            tabViewModel.isScrolled.send(true)
                        }
                        else{
                            tabViewModel.isScrolled.send(false)
                        }
                    }
                    
                    return VStack(spacing: 0){
                        let width = reader.size.width - 15
                        let height = reader.size.height - 15
                        LazyVGrid(columns:[
                            GridItem(.fixed(15), spacing: 0),GridItem(.fixed(width / 5), spacing: 0),GridItem(.fixed(width / 5), spacing: 0),GridItem(.fixed(width / 5), spacing: 0),GridItem(.fixed(width / 5), spacing: 0),GridItem(.fixed(width / 5), spacing: 0)], alignment: .leading,spacing: 0){
                                ForEach(0..<6){
                                    if $0 == 0{
                                        RoundedCorner(radius: 8, corners: .topLeft).stroke(.gray, lineWidth: 0.5).frame(height:15)
                                    }
                                    else if $0 != 5{
                                        Rectangle().stroke(.gray, lineWidth: 0.5).frame(height:15).overlay(Text(Day.init(rawValue: $0 - 1)!.description).font(.system(size:10,weight: .light)))
                                    }
                                    else{
                                        RoundedCorner(radius: 8, corners: .topRight).stroke(.gray, lineWidth: 0.5).frame(height:15).overlay(Text(Day.init(rawValue: $0 - 1)!.description).font(.system(size:10,weight: .light)))
                                    }
                                }
                                ForEach(0..<72){index in
                                    if index == 66{
                                        RoundedCorner(radius: 8, corners: .bottomLeft).stroke(.gray, lineWidth: 0.5).frame(height:height / 12).overlay(
                                            Text("\(Period.init(rawValue: index / 6)!.time)").font(.system(size:10,weight: .light)).padding([.top,.trailing],1)
                                            , alignment: .topTrailing)
                                    }
                                    else{
                                        if index % 6 == 0{
                                            Rectangle().stroke(.gray, lineWidth: 0.5).frame(height:height / 12).overlay(
                                                Text("\(Period.init(rawValue: index / 6)!.time)").font(.system(size:10,weight: .light)).padding([.top,.trailing],1)
                                                , alignment: .topTrailing)
                                        }
                                        else{
                                            if let id = index - index / 6 - 1, let lecture =  schedule.lectures.first(where: {
                                                $0.id.contains(where: {$0 == id})
                                            }){
                                                let shape: AnyView = index != 71 ? Rectangle().eraseToAnyView() : RoundedCorner(radius: 8, corners: .bottomRight).eraseToAnyView()
                                                
                                                if id == lecture.id.min(){
                                                    shape.foregroundColor(.everytimeColor).frame(height:height / 12).overlay(VStack(alignment: .leading, spacing: 2){
                                                        Divider().frame(height: 2).opacity(0)
                                                        Text(lecture.name).foregroundColor(.white).font(.system(size:10, weight:.bold)).padding(.leading, 2)
                                                        Text(lecture.room).foregroundColor(.white).font(.system(size:8)).padding(.leading, 2)
                                                        Spacer()
                                                    })
                                                }
                                                else{
                                                    shape.foregroundColor(.everytimeColor).frame(height:height / 12)
                                                }
                                            }
                                            else{
                                                if index == 71{
                                                    RoundedCorner(radius: 8, corners: .bottomRight).stroke(.gray, lineWidth: 0.5).frame(height:height / 12)
                                                }
                                                else{
                                                    Rectangle().stroke(.gray, lineWidth: 0.5).frame(height:height / 12)
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                            }
                    }.overlay(RoundedCorner(radius:8,corners: .allCorners).stroke(.gray, lineWidth: 0.5)).eraseToAnyView()
                }.frame(height:600)
                FriendScheduleView()
                GradeCalculatorView().padding(.bottom)
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}

