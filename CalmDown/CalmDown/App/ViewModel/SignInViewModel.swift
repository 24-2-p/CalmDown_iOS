//
//  SignInViewModel.swift
//  CalmDown
//
//  Created by 채리원 on 12/3/24.
//

import SwiftUI
import Moya

class SignInViewModel: ObservableObject {
    @Published var user = UserModel()
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    private let provider = MoyaProvider<SignInService>()
    
    // 로그인 가능 여부
    var canSignIn: Bool {
        !user.email.isEmpty && !user.password.isEmpty
    }
    
    func signIn() {
        guard canSignIn else {
            self.errorMessage = "이메일과 비밀번호를 입력하세요."
            self.showError = true
            return
        }
        
        provider.request(.signIn(email: user.email, password: user.password)) { [weak self] result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    DispatchQueue.main.async {
                        self?.showError = false
                        print("로그인 성공!")
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.errorMessage = "로그인 실패: 잘못된 이메일 또는 비밀번호"
                        self?.showError = true
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = "네트워크 오류: \(error.localizedDescription)"
                    self?.showError = true
                }
            }
        }
    }
}
