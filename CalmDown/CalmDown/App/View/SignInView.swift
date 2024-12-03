//
//  SignInView.swift
//  CalmDown
//
//  Created by 채리원 on 12/3/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Sign In")
                    .font(.pretendard(.medium, size: 24))
                    .foregroundColor(Color.deepBlue)
                Spacer()
                Image("MainLogo")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.horizontal, 33)
            .padding(.bottom, 28)
            
            InputField(label: "이메일", systemImage: "envelope", placeholder: "Email", text: $viewModel.user.email)
            
            InputField(label: "비밀번호", systemImage: "lock", placeholder: "Password", text: $viewModel.user.password, isSecure: true)
            
            // 에러메시지
            if viewModel.showError {
                Text(viewModel.errorMessage)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundColor(.red)
                    .padding(.horizontal, 33)
                    .padding(.top, 10)
            }
            
            MainButton(text: "로그인", enable: viewModel.canSignIn) {
                viewModel.validateSignIn()
            }
            .padding(.top, 371)
        }
    }
}

#Preview {
    SignInView()
}


#Preview {
    SignInView()
}
