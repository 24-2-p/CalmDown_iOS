//
//  matchingView.swift
//  CalmDown
//
//  Created by 이상엽 on 12/6/24.
//

import SwiftUI

struct MatchingView: View {
    @State private var selectedProject: String = "2024 2학기 P 프로젝트"
    @State private var showTextField: Bool = false // 텍스트 필드 표시 여부
    @State private var additionalTextField: Bool = false // 추가 텍스트 필드 표시 여부
    @State private var email1: String = "" // 첫 번째 텍스트 필드
    @State private var email2: String = "" // 두 번째 텍스트 필드
    @State private var showInfoAlert: Bool = false // i 버튼 알림창 표시 여부
    @State private var isMatching: Bool = false // 매칭 상태
    @State private var isMatched: Bool = false // 매칭 완료 여부


    @State private var isAnimating = false
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    @StateObject private var viewModel = MatchingViewModel(totalMembers: 4, fmembers: 2, bmembers: 2)
    @State private var teamId = 1
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            // 상단 타이틀
            VStack(spacing: 8) {
                HStack {
                    Text("Calm Match")
                        .font(.pretendard(.medium, size: 24))
                        .foregroundColor(Color.deepBlue)
                        .padding(.leading, 33)
                    Spacer()
                }
                HStack {
                    // Pull Down Menu
                    Menu {
                        Button(action: {
                            selectedProject = "2024 2학기 P 프로젝트"
                        }) {
                            Text("2024 2학기 P 프로젝트")
                                .font(.pretendard(.regular, size: 12))
                            
                        }
                        Button(action: {
                            selectedProject = "2024 졸업 프로젝트"
                        }) {
                            Text("2024 졸업 프로젝트")
                                .font(.pretendard(.regular, size: 12))
                        }
                    } label: {
                        HStack(spacing: 5) {
                            Text(selectedProject)
                                .font(.system(size: 14))
                                .foregroundColor(Color.deepBlue)
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color.deepBlue)
                        }
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
            }
            .padding(.top, 33)
            
            Spacer()
            
            Button(action: {
                showInfoAlert.toggle()
            }) {
                Image(systemName: "info.circle") // i 버튼
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .padding(.leading, 100)
            }
            // 로고
            Button(
                action: {
                    self.isAnimating.toggle()
                    viewModel.matchingStatus(teamId: 01)
                },
                label: {
                    Image("MainLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .rotationEffect(
                            Angle(
                                degrees:  self.isAnimating ? 360 : 0
                            )
                        )
                    .animation(self.isAnimating ? foreverAnimation : .default, value: isAnimating)                }
            )
            // 알림창 표시
            .alert(isPresented: $showInfoAlert) {
                Alert(
                    title: Text("팀 구성 안내"),
                    message: Text("팀 구성은 프론트 1명, 백 2명은 고정 인원입니다."),
                    dismissButton: .default(Text("확인"))
                )
            }
            if isMatching {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue.opacity(0.1))
                        .shadow(radius: 4)
                    
                    VStack(spacing: 10) {
                        Text("팀 매칭 현황")
                            .font(.pretendard(.regular, size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(Color.deepBlue)
                        
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("현재 팀원 수: \(viewModel.totalMembers == 0 ? "매칭 중" : "\(viewModel.totalMembers)")")
                                .font(.headline)
                            Text("프론트엔드: \(viewModel.fmembers == 0 ? "매칭 중" : "\(viewModel.fmembers)")")
                                .font(.subheadline)
                            Text("백엔드: \(viewModel.bmembers == 0 ? "매칭 중" : "\(viewModel.bmembers)")")
                                .font(.subheadline)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                    .padding()
                }
                .frame(maxWidth: 200, maxHeight: 200)
                .padding(.top, 30)
            }
            
            // 텍스트 필드 영역
            if showTextField {
                VStack(spacing: 15) {
                    InputField(label: "", systemImage: "envelope", placeholder: "이메일을 입력하세요.", text: $email1)
                    
                    if additionalTextField {
                        InputField(label: "", systemImage: "envelope", placeholder: "이메일을 입력하세요.", text: $email2)
                            .padding(.top, -55)
                    }
                    
                    // 추가 또는 제거 버튼
                    Button(action: {
                        if additionalTextField {
                            // 제거 버튼 동작
                            additionalTextField = false
                            email2 = ""
                        } else {
                            // 추가 버튼 동작
                            additionalTextField = true
                        }
                    }) {
                        Text(additionalTextField ? "제거" : "추가")
                            .font(.pretendard(.regular, size: 14))
                            .foregroundColor(Color.deepBlue)
                            .padding(.vertical, 10)
                            .frame(maxWidth: 60)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding(.top, 20)
            }
            
            // 매칭하기 버튼
            Button(action: {
                            isMatching = true // 버튼 비활성화 및 상태 변경
                isMatched = false // 매칭 완료 상태 초기화

                            viewModel.matchingStatus(teamId: 1) // 팀 매칭 요청
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // 예제: 매칭 완료 후 상태 업데이트
                                isMatched = true
                            }
                        }) {
                            Text(isMatched ? "매칭 완료" : (isMatching ? "매칭 중" : "매칭하기"))
                                .font(.pretendard(.regular, size: 14))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(isMatching ? Color.gray : Color.deepBlue)
                                .cornerRadius(17)
                                .padding(.horizontal)
                        }
                        .disabled(isMatching) // 매칭 중에는 버튼 비활성화
                        .padding(.top, showTextField ? 40 : 84)
                        .padding(.bottom, 10)


            
            // "같이 할 팀원이 있나요?" 버튼
            if isMatching == false {
                
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showTextField.toggle()
                            if !showTextField {
                                // 모든 상태 초기화
                                additionalTextField = false
                                email1 = ""
                                email2 = ""
                            }
                        }
                    }) {
                        Text("같이 할 팀원이 있나요?")
                            .font(.pretendard(.regular, size: 14))
                            .foregroundColor(.gray)
                            .underline(true, color: .gray)
                            .padding(.top, 23)
                            .padding(.trailing, 59)
                    }
                }
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.white)
    }
}

#Preview {
    MatchingView()
}
