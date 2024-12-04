//
//  ColorExtension.swift
//  CalmDown
//
//  Created by 채리원 on 12/2/24.
//

import SwiftUI

extension Color {
    static let customBlack = Color(hex: "#0F0F0F")
    static let deepBlue = Color(hex: "#004593")
    static let pureWhite = Color(hex: "#FFFFFF")
    static let jetBlack = Color(hex: "#000000")
    static let skyBlue = Color(hex: "#03AFED")
    static let navyBlue = Color(hex: "#043E96")
    static let grayish = Color(hex: "#656B73")
    static let goldenYellow = Color(hex: "#F7B401")
    static let lightGray = Color(hex: "#ADADAD")
    static let deepRed = Color(hex: "#FF1919")
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
