//
//  MainButton.swift
//  CalmDown
//
//  Created by 채리원 on 12/2/24.
//


import SwiftUI

struct MainButton: View {
    
    private var text: String
    private var enable: Bool
    private var action: () -> Void
    
    init(
        text: String,
        enable: Bool = true,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.enable = enable
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: action) {
                Text(text)
                    .font(.pretendard(.regular, size: 14))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 48, height: 45)
                    .background(RoundedRectangle(cornerRadius: 14).fill(enable ? Color.deepBlue : Color.deepBlue.opacity(0.65)))
            }
            .disabled(!enable)
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

#Preview {
    VStack(spacing: 30) {
        MainButton(text: "버튼 활성화") {}

        MainButton(text: "버튼 비활성화", enable: false) {}
    }
}
