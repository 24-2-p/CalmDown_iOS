//
//  UserProfileModel.swift
//  CalmDown
//
//  Created by 채리원 on 12/14/24.
//

import Foundation

struct ProfileResponse: Codable {
    let resultType: String
    let success: UserProfile
}


struct UserProfile: Codable {
    let name: String
    let email: String
    let skill: [String]
    let position: String
}
