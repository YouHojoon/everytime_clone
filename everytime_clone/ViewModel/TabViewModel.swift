//
//  SwiftUIView.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/24.
//

import SwiftUI
import Combine

class TabViewModel: ObservableObject{
    let isScrolled = PassthroughSubject<Bool,Never>()
}
