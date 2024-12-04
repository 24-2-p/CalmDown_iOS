//
//  InputField.swift
//  CalmDown
//
//  Created by 채리원 on 12/3/24.
//

import SwiftUI

struct InputField: View {
    let label: String
    let systemImage: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(label)
                .foregroundColor(Color.lightGray)
                .font(.pretendard(.medium, size: 14))
                .padding(.bottom, 12)
                .padding(.horizontal, 25)
            
            HStack {
                Image(systemName: systemImage)
                    .foregroundColor(Color.lightGray)
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .autocapitalization(.none)
                } else {
                    TextField(placeholder, text: $text)
                        .autocapitalization(.none)
                }
            }
            .padding(.horizontal, 19)
            .frame(height: 51)
            .background(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(Color.lightGray, lineWidth: 1)
            )
            .padding(.horizontal, 33)
            .padding(.bottom, 28)
        }
    }
}
