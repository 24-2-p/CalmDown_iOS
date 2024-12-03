//
//  SignInViewModel.swift
//  CalmDown
//
//  Created by 채리원 on 12/3/24.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var user = UserModel()
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    // 조건에 따른 로그인 가능 여부
    var canSignIn: Bool {
        !user.email.isEmpty && !user.password.isEmpty
    }
    
    func validateSignIn() {
        if user.email != "test@example.com" || user.password != "123456" {
            showError = true
            errorMessage = "잘못된 이메일 또는 비밀번호입니다!"
        } else {
            showError = false
            // 로그인 성공 처리
            print("로그인 성공: \(user)")
        }
    }
}
