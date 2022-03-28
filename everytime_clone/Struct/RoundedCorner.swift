//
//  RoundedCorner.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/25.
//

import Foundation
import CoreGraphics
import SwiftUI
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
