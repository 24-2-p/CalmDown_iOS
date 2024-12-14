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
        VStack {
            Text("Calm Match")
                .font(.pretendard(.medium, size: 24))
                .foregroundColor(Color.deepBlue)

            if viewModel.comments.isEmpty {
                Spacer()
                VStack {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                        .font(.system(size: 48))
                        .foregroundColor(Color.lightGray)
                    Text("첫 댓글을 남겨주세요.")
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                        .font(.pretendard(.medium, size: 20))
                        .foregroundColor(Color.lightGray)
                }
                Spacer()
            } else {
                List {
                    ForEach(viewModel.comments) { comment in
                        HStack {
                            Image(systemName: "person.circle")
                                .font(.system(size: 40))
                                .foregroundColor(.gray)

                            VStack(alignment: .leading) {
                                Text(comment.author)
                                    .font(.headline)
                                Text(comment.text)
                                    .font(.subheadline)
                                Text(comment.timestamp, style: .date)
                                    .font(.caption)
                                    .foregroundColor(Color.lightGray)
                            }

                            Spacer()

                            Button(action: {
                                viewModel.deleteComment(comment)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(Color.lightGray)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }

            HStack {
                TextField("댓글을 입력하세요.", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.pretendard(.medium, size: 12))
                Button(action: {
                    if !newComment.isEmpty {
                        viewModel.addComment(author: "채리원", text: newComment)
                        newComment = ""
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                        .foregroundColor(Color.deepBlue)
                }
            }
            .padding()
        }
    }
}

class CommentViewModel: ObservableObject {
    @Published var comments: [Comment] = []

    func addComment(author: String, text: String) {
        let newComment = Comment(author: author, text: text, timestamp: Date())
        comments.append(newComment)
    }

    func deleteComment(_ comment: Comment) {
        if let index = comments.firstIndex(where: { $0.id == comment.id }) {
            comments.remove(at: index)
        }
    }
}

struct Comment: Identifiable {
    let id = UUID()
    let author: String
    let text: String
    let timestamp: Date
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
