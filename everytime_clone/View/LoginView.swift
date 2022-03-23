//
//  LoginView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/16.
//

import SwiftUI

struct LoginView: View {
    @State private var idInput = ""
    @State private var passwordInput = ""
    
    var body: some View {
        GeometryReader{reader in
            VStack(spacing:0){
                Spacer().frame(height:50)
                Image("everytime_icon").resizable().frame(width: 100, height: 100, alignment: .center)
                
                Text("대학 생활을 더 편하고 즐겁게").font(.system(size:18,weight: .bold)).opacity(0.3)
                Text("에브리타임").foregroundColor(.everytimeColor).font(.system(size:23,weight: .bold))
                
                Spacer().frame(height:60)
                
                TextField("", text: $idInput)
                    .textFieldStyle(LoginViewTextFieldStyle(textInput: $idInput, placeholderText: "아이디"))
                SecureField("",text: $passwordInput).textFieldStyle(LoginViewTextFieldStyle(textInput: $passwordInput, placeholderText: "비밀번호")).padding(.bottom,5)
                Button{
                    
                }label: {
                    Text("에브리타임 로그인").foregroundColor(.white).font(.system(size:20, weight: .bold))
                }.frame(width: reader.size.width - 60, height: 40, alignment: .center).background(Color.everytimeColor).clipShape(RoundedRectangle(cornerRadius: 25)).padding(.bottom, 30)
                
            
                Text("아이디/비밀번호 찾기").foregroundColor(.gray).font(.system(size:18,weight: .semibold)).opacity(0.7).padding(.bottom, 20)
                Text("회원가입").font(.system(size: 20,weight: .bold))
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


fileprivate struct LoginViewTextFieldStyle: TextFieldStyle{
    @Binding var textInput: String
    private let placeholderText: String
    init(textInput: Binding<String> = .constant(""),placeholderText: String){
        _textInput = textInput
        self.placeholderText = placeholderText
    }
    
    func _body(configuration: TextField<_Label>) -> some View {
        GeometryReader{reader in
            HStack{
                Spacer()
                configuration.padding().frame(width: reader.size.width - 60, height: 45, alignment: .center).background(.gray.opacity(0.15)).clipShape(RoundedRectangle(cornerRadius: 25)).placeholder(shouldShow: textInput.isEmpty){
                    Text(placeholderText).fontWeight(.bold).opacity(0.3).padding()
                }
                Spacer()
            }
        }.frame(height: 50)
    }
}
