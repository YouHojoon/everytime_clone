//
//  SwiftUIView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/22.
//

import SwiftUI
import Combine
struct Carousel<T:View>: View {
    @State public private(set) var selectedItem = 0
    
    private let spacing: CGFloat
    private let offsetToMove = UIScreen.main.bounds.width / 2 - 100
    private let contentList : [T]
    private let showIndicator: Bool
        
    @State private var screenDrag = 0.0
    @State private var offset = 0.0
    
    init(contentList: [T], spacing: CGFloat, showIndicator: Bool = true){
        self.spacing = spacing
        self.contentList = contentList
        self.showIndicator = showIndicator
    }
    
    var body: some View {
        GeometryReader{reader in
            VStack(alignment: .leading){
                HStack(spacing: spacing){
                    ForEach(0..<contentList.capacity){
                        contentList[$0].frame(width:reader.size.width).offset(x:offset).gesture(DragGesture().onChanged{value in
                            withAnimation{
                                if value.translation.width > 0 {
                                    //왼쪽에서 오른쪽으로 드래그 할 떄
                                    // -(cardWidth + spacing) * selectedItem == 현재 선택된 카드 정위치
                                    if selectedItem != 0{//왼쪽 끝이 아니라면
                                        offset = value.translation.width - (reader.size.width + spacing) * CGFloat(selectedItem)
                                    }
                                }
                                else{//오른쪽에서 왼쪽
                                    if selectedItem != contentList.capacity - 1{//오른쪽 끝이 아니라면
                                        offset = value.translation.width - (reader.size.width + spacing) * CGFloat(selectedItem)
                                    }
                                }
                            }
                        }.onEnded{value in
                            withAnimation{
                                if value.translation.width > 0{
                                    if value.translation.width > offsetToMove && selectedItem != 0{
                                        selectedItem -= 1
                                        offset = -((reader.size.width + spacing) * CGFloat(selectedItem))
                                    }
                                    else{
                                        offset = -((reader.size.width + spacing) * CGFloat(selectedItem))
                                    }
                                }
                                else{
                                    if -value.translation.width > offsetToMove && selectedItem != contentList.capacity - 1{
                                        selectedItem += 1
                                        offset = -((reader.size.width + spacing) * CGFloat(selectedItem))
                                    }
                                    else{
                                        offset = -((reader.size.width + spacing) * CGFloat(selectedItem))
                                    }
                                }
                            }
                        })
                    }
                }
                
                if showIndicator{
                    HStack(alignment:.center, spacing: 3){
                        Spacer()
                        ForEach(0..<contentList.capacity){
                            Circle().foregroundColor($0 == selectedItem ? .everytimeColor : .gray.opacity(0.3)).frame(width: 5, height: 5)
                        }
                        Spacer()
                    }.padding([.top,.bottom], 10)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(contentList: [
            HomeAdCardView(Advertisement.getDummy()),
            HomeAdCardView(Advertisement.getDummy()),
            HomeAdCardView(Advertisement.getDummy())
        ],spacing: 8)
    }
}
