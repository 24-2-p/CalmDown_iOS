//
//  SignUpView.swift
//  CalmDown
//
//  Created by 채리원 on 12/3/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode // 이전 화면으로 이동하기 위한 환경 변수
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Sign Up")
                    .font(.pretendard(.medium, size: 24))
                    .foregroundColor(Color.deepBlue)
                Spacer()
                Image("MainLogo")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.horizontal, 33)
            .padding(.bottom, 28)
            
            InputField(label: "이름", systemImage: "person", placeholder: "Username", text: $viewModel.user.username)
            InputField(label: "이메일", systemImage: "envelope", placeholder: "Email", text: $viewModel.user.email)
            InputField(label: "비밀번호", systemImage: "lock", placeholder: "Password", text: $viewModel.user.password, isSecure: true)
            InputField(label: "비밀번호 확인", systemImage: "lock", placeholder: "Confirm Password", text: $viewModel.user.confirmPassword, isSecure: true)
            
            Text(viewModel.isPasswordMatching ? "비밀번호가 일치합니다." : "비밀번호가 일치하지 않습니다.")
                .font(.pretendard(.medium, size: 14))
                .foregroundColor(viewModel.isPasswordMatching ? Color.customBlack : Color.deepRed)
                .padding(.horizontal, 33)
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundColor(Color.deepRed)
                    .padding(.top, 10)
            }
            
            MainButton(text: "회원가입 완료", enable: viewModel.canSignUp) {
                viewModel.signUp { success in
                    if success {
                        self.presentationMode.wrappedValue.dismiss() // 로그인 화면으로 이동
                    }
                }
            }
            .padding(.top, 156)
        }
    }
}

#Preview {
    SignUpView()
}
