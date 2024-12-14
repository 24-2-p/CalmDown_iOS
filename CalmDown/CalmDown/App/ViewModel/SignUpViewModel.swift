//
//  SignUpViewModel.swift
//  CalmDown
//
//  Created by 채리원 on 12/3/24.
//

import Foundation
import Combine
import Moya

class SignUpViewModel: ObservableObject {
    @Published var user = UserModel()
    @Published var isSuccess: Bool = false
    @Published var errorMessage: String?
    
    private let provider = MoyaProvider<SignUpService>()
    
    var isPasswordMatching: Bool {
        !user.password.isEmpty && user.password == user.confirmPassword
    }
    
    var canSignUp: Bool {
        isPasswordMatching && !user.username.isEmpty && !user.email.isEmpty
    }
    
    func signUp(completion: @escaping (Bool) -> Void) {
        guard canSignUp else { return }
        
        provider.request(.signUp(username: user.username, email: user.email, password: user.password)) { [weak self] result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    completion(true) // 회원가입 성공
                } else {
                    self?.errorMessage = "회원가입 실패"
                    completion(false)
                }
            case .failure(let error):
                self?.errorMessage = "네트워크 오류: \(error.localizedDescription)"
                completion(false)
            }
        }
    }
}
