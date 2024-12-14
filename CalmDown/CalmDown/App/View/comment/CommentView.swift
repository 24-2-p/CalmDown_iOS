//
//  CommentView.swift
//  CalmDown
//
//  Created by 채리원 on 12/14/24.
//

import SwiftUI

struct CommentView: View {
    @StateObject private var viewModel = CommentViewModel()
    @State private var newComment = ""

    var body: some View {
        VStack(spacing: 16) {
            // 상단 제목
            Text("Calm Match")
                .font(.pretendard(.medium, size: 24))
                .foregroundColor(Color.deepBlue)
                .padding(.top, 16)

            // 댓글 리스트
            if viewModel.comments.isEmpty {
                emptyStateView
            } else {
                commentsList
            }

            // 댓글 입력 필드
            commentInputField
        }
        .padding(.horizontal, 16)
    }

    // 빈 상태 뷰
    private var emptyStateView: some View {
        VStack(spacing: 8) {
            Spacer()
            Image(systemName: "bubble.left.and.bubble.right.fill")
                .font(.system(size: 48))
                .foregroundColor(Color.lightGray)
            Text("첫 댓글을 남겨주세요.")
                .font(.pretendard(.medium, size: 20))
                .foregroundColor(Color.lightGray)
            Spacer()
        }
    }

    // 댓글 리스트 뷰
    private var commentsList: some View {
        List {
            ForEach(viewModel.comments) { comment in
                CommentRow(comment: comment) {
                    viewModel.deleteComment(teamId: 1, postId: 1, commentId: comment.id)
                }
            }
        }
        .listStyle(PlainListStyle())
    }

    // 댓글 입력 필드 뷰
    private var commentInputField: some View {
        HStack {
            TextField("댓글을 입력하세요.", text: $newComment)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.pretendard(.medium, size: 12))

            Button(action: {
                if !newComment.isEmpty {
                    viewModel.writeComment(
                        teamId: 1,
                        userId: 1,
                        postId: 1,
                        content: newComment,
                        author: "채리원"
                    )
                    newComment = ""
                }
            }) {
                Image(systemName: "paperplane.fill")
                    .font(.title2)
                    .foregroundColor(Color.deepBlue)
            }
        }
        .padding(.bottom, 16)
    }
}

struct CommentRow: View {
    let comment: Comment
    let onDelete: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .font(.system(size: 40))
                .foregroundColor(.gray)

            VStack(alignment: .leading, spacing: 4) {
                Text(comment.author)
                    .font(.headline)
                Text(comment.text)
                    .font(.subheadline)
                Text(comment.timestamp, style: .date)
                    .font(.caption)
                    .foregroundColor(Color.lightGray)
            }

            Spacer()

            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(Color.lightGray)
            }
        }
        .padding(.vertical, 8)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
