//
//  CommentService.swift
//  CalmDown
//
//  Created by 채리원 on 12/14/24.
//

import Foundation
import Moya

enum CommentService {
    case writeComment(teamId: Int, userId: Int, postId: Int, content: String)
    case fetchComments(teamId: Int, postId: Int)
    case deleteComment(teamId: Int, postId: Int, commentId: Int)
    case fetchProfile(teamId: Int, userId: Int)
}

extension CommentService: TargetType {
    var baseURL: URL {
        return URL(string: "http://ceprj.gachon.ac.kr:60002")!
    }

    var path: String {
        switch self {
        case .writeComment(let teamId, let userId, let postId, _):
            return "/teams/\(teamId)/users/\(userId)/posts/\(postId)/write"
        case .fetchComments(let teamId, let postId):
            return "/teams/\(teamId)/posts/\(postId)"
        case .deleteComment(let teamId, let postId, let commentId):
            return "/teams/\(teamId)/posts/\(postId)/comments/\(commentId)/del"
        case .fetchProfile(let teamId, let userId):
            return "/teams/\(teamId)/users/\(userId)/profile"
        }
    }

    var method: Moya.Method {
        switch self {
        case .writeComment:
            return .post
        case .fetchComments, .fetchProfile:
            return .get
        case .deleteComment:
            return .delete
        }
    }

    var task: Task {
        switch self {
        case .writeComment(_, _, _, let content):
            return .requestParameters(parameters: ["content": content], encoding: JSONEncoding.default)
        case .fetchComments, .fetchProfile, .deleteComment:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
