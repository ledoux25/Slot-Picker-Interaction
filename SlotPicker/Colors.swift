//
//  Colors.swift
//  SlotPicker
//
//  Created by Sanguo Joseph Ledoux on 9/20/25.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color{
    static var backGroundGrey : Color {
        Color.gray.opacity(0.07)
    }
    
    static var blackText : Color {
        .black.opacity(0.8)
    }
    
    static var contentBorder : Color {
        .black.opacity(0.3)
    }
}
