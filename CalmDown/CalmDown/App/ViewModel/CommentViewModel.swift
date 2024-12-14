//
//  CommentViewModel.swift
//  CalmDown
//
//  Created by 채리원 on 12/14/24.
//

import Foundation
import Moya

class CommentViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var errorMessage: String? = nil

    private let provider = MoyaProvider<CommentService>()

    // 댓글 작성
    func writeComment(teamId: Int, userId: Int, postId: Int, content: String, author: String) {
        provider.request(.writeComment(teamId: teamId, userId: userId, postId: postId, content: content)) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let decodedResponse = try JSONDecoder().decode(CommentResponse.self, from: response.data)
                    if decodedResponse.resultType == "SUCCESS" {
                        DispatchQueue.main.async {
                            let newComment = Comment(
                                id: decodedResponse.success.userId,
                                author: author,
                                text: decodedResponse.success.content,
                                timestamp: Date()
                            )
                            self?.comments.append(newComment)
                            self?.errorMessage = nil
                        }
                    } else {
                        DispatchQueue.main.async {
                            self?.errorMessage = "댓글 작성 실패"
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        self?.errorMessage = "JSON 디코딩 실패"
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = "네트워크 요청 실패: \(error.localizedDescription)"
                }
            }
        }
    }

    // 댓글 삭제
    func deleteComment(teamId: Int, postId: Int, commentId: Int) {
        provider.request(.deleteComment(teamId: teamId, postId: postId, commentId: commentId)) { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.comments.removeAll { $0.id == commentId }
                    self?.errorMessage = nil
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = "댓글 삭제 실패: \(error.localizedDescription)"
                }
            }
        }
    }
}
