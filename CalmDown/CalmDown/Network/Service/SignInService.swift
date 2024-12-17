//
//  SignInService.swift
//  CalmDown
//
//  Created by 채리원 on 12/13/24.
//

import Foundation
import Moya

enum SignInService {
    case signIn(email: String, password: String)
}

extension SignInService: TargetType {
    var baseURL: URL {
        return URL(string: "http://ceprj.gachon.ac.kr:60002")! 
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/users/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signIn(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
