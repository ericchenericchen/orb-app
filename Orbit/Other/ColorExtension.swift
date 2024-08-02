//
//  ColorExtension.swift
//  Orbit
//
//  Created by Eric Chen on 7/15/24.
//

import Foundation
import SwiftUI

extension Color {
    //Define custom colors to add to Color struct
    static let bgBlue = Color(hex: "0C1830")
    static let bgGlow = Color(hex: "8B9CF3")
    static let gradientBlack = Color(hex: "999999")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            let r = Double((hexNumber & 0xff0000) >> 16) / 255
            let g = Double((hexNumber & 0x00ff00) >> 8) / 255
            let b = Double(hexNumber & 0x0000ff) / 255
            self.init(red: r, green: g, blue: b)
            return //returns correct color if valid hex string, otherwise returns white
        }
        self.init(red: 1.0, green: 1.0, blue: 1.0)
    }
}
