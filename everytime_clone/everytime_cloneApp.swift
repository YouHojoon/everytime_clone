//
//  everytime_cloneApp.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/16.
//

import SwiftUI
import UIKit
@main
struct everytime_cloneApp: App {
    
    init(){
        UIScrollView.appearance().bounces = false//맨 끝의 bounce 막기
    }
    var body: some Scene {
        WindowGroup {
            MainTabView().environmentObject(TabViewModel())
//            ScheduleView()
        }
    }
}
