//
//  GradCalculator.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/28.
//

import SwiftUI

struct GradeCalculatorView: View {
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text("학점 계산기").font(.system(size: 18, weight: .bold))
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "pencil.circle").font(.system(size: 18)).foregroundColor(.black)
                }
            }.padding(.bottom, 15)
            HStack(spacing:0){
                Text("평균 학점").font(.system(size: 15)).padding(.trailing, 5)
                Text("3.72").foregroundColor(.everytimeColor).font(.system(size: 15,weight: .bold)).padding(.trailing, 3)

                Text("/ 4.5").foregroundColor(.gray).font(.system(size: 13,weight: .light)).padding(.trailing, 10)

                Text("취득 학점").font(.system(size: 15)).padding(.trailing, 5)
                Text("130").foregroundColor(.everytimeColor).font(.system(size: 15,weight: .bold)).padding(.trailing, 3)


                Text("/ 150").foregroundColor(.gray).font(.system(size: 13,weight: .light))

            }
        }.padding().overlay(RoundedRectangle(cornerRadius: 13).stroke(.gray.opacity(0.3),lineWidth: 2))
    }
}

struct GradeCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        GradeCalculatorView()
    }
}
