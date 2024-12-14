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
    
    func signUp() {
        guard canSignUp else { return }
        
        provider.request(.signUp(username: user.username, email: user.email, password: user.password)) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data, options: [])
                    
                    if let dict = json as? [String: Any] {
                        if let success = dict["success"] as? Bool, success {
                            DispatchQueue.main.async {
                                self?.isSuccess = true
                            }
                        } else {
                            DispatchQueue.main.async {
                                self?.errorMessage = dict["message"] as? String ?? "회원가입 실패"
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            self?.errorMessage = "올바르지 않은 응답 형식입니다."
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        self?.errorMessage = "데이터 파싱 오류: \(error.localizedDescription)"
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = nil
                }
            }
        }
    }
}
