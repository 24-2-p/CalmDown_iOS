//
//  SignUpViewModel.swift
//  CalmDown
//
//  Created by 채리원 on 12/3/24.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var user = UserModel()
    
    var isPasswordMatching: Bool {
        !user.password.isEmpty && user.password == user.confirmPassword
    }
    
    var canSignUp: Bool {
        isPasswordMatching && !user.username.isEmpty && !user.email.isEmpty
    }
    
    func signUp() {
        print("회원가입 완료: \(user)")
    }
}
