//
//  SignInView.swift
//  CalmDown
//
//  Created by 채리원 on 12/3/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    @State private var navigateToRoleSelection = false // 화면 전환 상태 변수

    var body: some View {
            ScrollView {
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
                    
                    if viewModel.showError {
                        Text(viewModel.errorMessage)
                            .font(.pretendard(.medium, size: 14))
                            .foregroundColor(.red)
                            .padding(.horizontal, 33)
                            .padding(.top, 10)
                    }
                    
                    MainButton(text: "로그인", enable: viewModel.canSignIn) {
                        viewModel.signIn()
                        if !viewModel.showError { // 로그인 성공 시 네비게이션 활성화
                            navigateToRoleSelection = true
                        }
                    }
                    .padding(.top, 371)
                    
                    // NavigationLink로 RoleSelectionView 이동
                    NavigationLink(
                        destination: RoleSelectionView(),
                        isActive: $navigateToRoleSelection
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
                .padding()
            }
            .ignoresSafeArea(.keyboard)
            .navigationBarBackButtonHidden(true) // Back 버튼 숨김

        
    }
}

#Preview {
    SignInView()
}
