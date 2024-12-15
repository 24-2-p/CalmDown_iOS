//
//  UserProfileSheet.swift
//  CalmDown
//
//  Created by 채리원 on 12/15/24.
//

import SwiftUI

struct UserProfileSheet: View {
    let userProfile: UserProfile
    @State private var userData: UserData? // 서버에서 받아올 데이터
    @State private var isLoading: Bool = true // 로딩 상태
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            // 상단 제목과 닫기 버튼
            HStack {
                Text("프로필")
                    .font(.pretendard(.medium, size: 24))
                    .foregroundColor(Color.deepBlue)
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)

            // 사용자 정보
            VStack(spacing: 10) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
                
                Text(userProfile.name)
                    .font(.pretendard(.medium, size: 24))
                
                Text(userProfile.email)
                    .foregroundColor(.gray)
                    .font(.pretendard(.medium, size: 14))
                
                Text(userProfile.position)
                    .font(.pretendard(.medium, size: 14))
                    .padding(6)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.2))
                    )
                    .foregroundColor(.blue)
            }
            .padding(.top, 10)

            // 기술 스택 섹션
            if isLoading {
                // 로딩 상태 표시
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, alignment: .center)
            } else if let data = userData {
                VStack(alignment: .leading, spacing: 16) {
                    Text("기술 스택")
                        .font(.pretendard(.medium, size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)

                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                        ForEach(data.techStacks, id: \.self) { stack in
                            VStack {
                                Image(stack.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                                Text(stack.name)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, 20)
            } else {
                // 데이터 로드 실패 시
                Text("데이터를 불러올 수 없습니다.")
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .center)
            }

            Spacer()
        }
        .padding(.bottom, 20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .onAppear {
            fetchData()
        }
    }

    private func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Mock API 호출
            self.userData = UserData(
                role: "프론트엔드",
                techStacks: [
                    TechStack(name: "스위프트", imageName: "swift"),
                    TechStack(name: "MySQL", imageName: "mysql"),
                    TechStack(name: "노드", imageName: "nodejs"),
                    TechStack(name: "github", imageName: "github")
                ],
                email: "CalmMatch@gmail.com"
            )
            self.isLoading = false
        }
    }
}
