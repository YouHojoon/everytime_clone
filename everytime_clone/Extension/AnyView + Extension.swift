//
//  AnyView + Extension.swift
//  everytime_clone
//
//  Created by 유호준 on 2022/03/24.
//

import Foundation
import SwiftUI

extension Button: Identifiable{
    public var id: UUID {
        return UUID()
    }
}
