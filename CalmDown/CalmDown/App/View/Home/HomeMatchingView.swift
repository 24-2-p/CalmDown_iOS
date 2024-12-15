//
//  HomeMatchingView.swift
//  CalmDown
//
//  Created by 채리원 on 12/6/24.
//

import SwiftUI

struct HomeMatchingView: View {
    @StateObject private var viewModel = UserProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Text("Calm Match")
                        .font(.pretendard(.medium, size: 24))
                        .foregroundColor(Color.deepBlue)
                    Spacer()
                    Image("MainLogo")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .padding(.horizontal, 33)
                .padding(.bottom, 25)
                
                Text("우리 팀")
                    .font(.pretendard(.medium, size: 20))
                    .foregroundColor(Color.customBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 33)
                
                Rectangle()
                    .frame(width: 356, height: 0.3)
                    .padding(.top, 16)
                    .foregroundColor(Color.mediumGray)
                
                ForEach(teamMembers) { member in
                    HStack(alignment: .center, spacing: 10) {
                        Image("profile")
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(member.name)
                                .font(.pretendard(.medium, size: 16))
                            
                            Text(member.position)
                                .font(.pretendard(.medium, size: 8))
                                .foregroundColor(Color.mediumBlue)
                                .padding(4)
                                .background(
                                    RoundedRectangle(cornerRadius: 36)
                                        .fill(Color.lightBlue)
                                )
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.fetchUserProfile(teamId: 1, userId: member.id)
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.mediumGray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 30)
                    .padding(.horizontal, 16)
                    
                    Rectangle()
                        .frame(width: 356, height: 0.3)
                        .padding(.top, 30)
                        .foregroundColor(Color.mediumGray)
                }
                
                // "대화하기" 버튼
                NavigationLink(destination: CommentView()) {
                    Image("CommentButton") // 버튼 이미지를 CommentButton으로 설정
                        .resizable()
                        .frame(width: 105, height: 35) // 이미지 크기 설정
                        .padding(.bottom, 20) // 하단 여백
                }
                .padding(.top, 30)
                .padding(.leading, 200)
                Spacer()
            }
            .sheet(isPresented: $viewModel.isSheetPresented) {
                if let userProfile = viewModel.selectedUserProfile {
                    UserProfileSheet(userProfile: userProfile)
                        .presentationDetents([.fraction(0.7)]) // 시트 높이를 70%로 제한
                } else if viewModel.isLoading {
                    ProgressView("Loading...")
                        .presentationDetents([.fraction(0.7)]) // 로딩 시에도 70%로 제한
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .presentationDetents([.fraction(0.7)]) // 에러 메시지 시에도 70%로 제한
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true) // 네비게이션 바 숨김
        }
    }
    
    // Dummy Data
    let teamMembers = [
        TeamMember(id: 1, name: "이상엽", position: "프론트엔드"),
        TeamMember(id: 2, name: "강태훈", position: "백엔드"),
        TeamMember(id: 3, name: "김규식", position: "백엔드"),
        TeamMember(id: 4, name: "채리원", position: "프론트엔드")
    ]
}

struct TeamMember: Identifiable {
    let id: Int
    let name: String
    let position: String
}

#Preview {
    HomeMatchingView()
}
