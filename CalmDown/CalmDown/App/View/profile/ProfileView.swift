//
//  ProfileView.swift
//  CalmDown
//
//  Created by 이상엽 on 12/8/24.
//

import SwiftUI

struct MyInfoView: View {
    @State private var userData: UserData? // 서버에서 받아올 사용자 데이터
    @State private var isLoading: Bool = true // 로딩 상태

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Text("내 정보")
                        .font(.pretendard(.medium, size: 24))
                        .foregroundColor(Color.deepBlue)
                        .padding(.trailing, -40)
                    Spacer()
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                if isLoading {
                    // 로딩 상태 표시
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if let data = userData {
                    // 내 역할
                    SectionHeader(title: "내 역할", action: {
                        print("역할 수정 버튼 클릭")
                    })
                    RoundedRectangle(cornerRadius: 17)
                        .fill(Color.lightBlue.opacity(0.3))
                        .frame(width: 285, height: 57)
                        .overlay(
                            Text(data.role)
                                .foregroundColor(.black)
                                .font(.pretendard(.regular, size: 18))
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                        )
                        .padding(.horizontal)

                    // 내 기술 스택
                    SectionHeader(title: "내 기술 스택", action: {
                        print("기술 스택 수정 버튼 클릭")
                    })
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
                    .padding(.horizontal)

                    Divider()
                        .padding(.horizontal)

                    // 이름 및 이메일
                    VStack(alignment: .leading, spacing: 20) {
                        TextFieldSection(title: "이름", placeholder: "홍길동", icon: "person.fill")
                        TextFieldSection(title: "이메일", placeholder: data.email, icon: "envelope.fill")
                    }
                    .padding(.horizontal)

                    Divider()
                        .padding(.horizontal)

                    // 팀 나가기 버튼
                    Button(action: {
                        print("팀 나가기 버튼 클릭")
                    }) {
                        Text("팀 나가기")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.goldenYellow)
                            .cornerRadius(25)
                            .padding(.horizontal)
                    }
                } else {
                    Text("데이터를 불러오지 못했습니다.")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(.top, 20)
        }
        .onAppear {
            fetchData()
        }
    }

    // 서버에서 데이터 가져오기
    private func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // API 호출 대체
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

// 컴포넌트: 섹션 헤더
struct SectionHeader: View {
    let title: String
    let action: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(Color.deepBlue)
            Spacer()
            Button(action: action) {
                Text("수정")
                    .font(.subheadline)
                    .foregroundColor(Color.lightGray)
            }
        }
        .padding(.horizontal)
    }
}

// 컴포넌트: 텍스트 필드 섹션
struct TextFieldSection: View {
    let title: String
    let placeholder: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(Color.deepBlue)
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                TextField(placeholder, text: .constant("")) // 임시 바인딩
                    .disabled(true)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

// 데이터 모델
struct UserData {
    let role: String
    let techStacks: [TechStack]
    let email: String
}

struct TechStack: Hashable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
