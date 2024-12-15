//
//  MatchingResponse.swift
//  CalmDown
//
//  Created by 이상엽 on 12/15/24.
//

import Foundation

struct MatchingResponse: Decodable {
    let status: String
    let currentMembers: CurrentMembers
}

struct CurrentMembers: Decodable {
    let total: Int
    let frontend : Int
    let backend: Int
}
