//
//  UserSession.swift
//  CalmDown
//
//  Created by 채리원 on 12/15/24.
//

import Foundation

class UserSession: ObservableObject {
    static let shared = UserSession()
    private init() {}
    
    @Published var userId: Int? = nil
    @Published var username: String = ""
}
