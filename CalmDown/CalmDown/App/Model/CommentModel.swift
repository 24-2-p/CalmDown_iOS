//
//  CommentModel.swift
//  CalmDown
//
//  Created by 채리원 on 12/14/24.
//

import Foundation

// API 댓글 응답 모델
struct CommentResponse: Codable {
    let resultType: String
    let success: CommentData
}

struct CommentData: Codable {
    let content: String
    let userId: Int
    let createdAt: String
}

struct CommentListResponse: Codable {
    let resultType: String
    let success: CommentListData
}

struct CommentListData: Codable {
    let content: [CommentItem]
}

struct CommentItem: Codable {
    let name: String
    let content: String
    let createdAt: String
}

struct Comment: Identifiable {
    let id: Int
    let author: String
    let text: String
    let timestamp: Date
}
