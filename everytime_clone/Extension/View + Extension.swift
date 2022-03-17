//
//  TextField + Extension.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/16.
//

import Foundation
import SwiftUI

extension View{
    func placeholder<T: View>(shouldShow:Bool, alignment: Alignment = .leading, @ViewBuilder placeholderText: () -> T) -> some View{
        ZStack(alignment: alignment){
            placeholderText().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
