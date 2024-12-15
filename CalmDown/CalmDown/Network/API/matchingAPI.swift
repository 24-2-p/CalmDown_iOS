//
//  matchingAPI.swift
//  CalmDown
//
//  Created by 이상엽 on 12/14/24.
//

import Foundation
import Moya

struct Post: Encodable {
    let userId: Int
    let projectId: Int
    let position: String
    let techStacks: [String]
    let portfolio: String
    let projeteamEmailctId: String

}

enum MatchingAPI {
    case matching
    case teamStatus(teamId: Int)
}

extension MatchingAPI: TargetType {
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var task: Moya.Task {
        switch self {
        case .matching:
            return .requestPlain
        case .teamStatus:
            return .requestPlain
        
        }
    }
    
    var baseURL: URL { .init(string: "http://ceprj.gachon.ac.kr:60002")! }
    var path: String {
        switch self {
        case .matching:
            return "/matching/start"
        case .teamStatus(let teamId):
            return "matching/status/\(teamId)"
        }
    }
    var method: Moya.Method {
        switch self {
            
        case .matching:
            return .post
            
        case .teamStatus:
            return .get
            
        }
    }
}
