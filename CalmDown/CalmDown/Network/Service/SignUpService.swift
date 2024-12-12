//
//  SignUpService.swift
//  CalmDown
//
//  Created by 채리원 on 12/10/24.
//

import Foundation
import Moya

enum SignUpService {
    case signUp(username: String, email: String, password: String)
}

extension SignUpService: TargetType {
    var baseURL: URL {
        return URL(string: "http://ceprj.gachon.ac.kr:60002")!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "/users/signup"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .signUp(username, email, password):
            let parameters: [String: Any] = [
                "email": email,
                "password": password,
                "name": username
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
