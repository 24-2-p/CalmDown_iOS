//
//  FontExtension.swift
//  CalmDown
//
//  Created by 채리원 on 12/2/24.
//

import SwiftUI

extension Font {
    static func pretendard(_ style: FontStyle, size: CGFloat) -> Font {
        Font.custom("Pretendard-\(style.rawValue)", size: size)
    }

    enum FontStyle: String {
        case medium = "Medium"
        case regular = "Regular"
    }
}

// 사용, 사이즈는 지정해주어야함
// Text("pretendard")
//    .font(.pretendard(.bold, size: 24))
