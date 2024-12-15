//
//  onboarding_RView.swift
//  CalmDown
//
//  Created by 이상엽 on 12/3/24.
//

import SwiftUI

struct RoleSelectionView: View {
    @State private var selectedRoles: [String] = []
    @State private var navigateToNextView: Bool = false // 다음 화면으로 이동 여부


    var body: some View {
        VStack(spacing: 0) {
            // 로고
            Image("MainLogo")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.top, 33)
                .padding(.trailing, 300)

            Text("팀에서 어떤 역할을 맡을 건가요?")
                .font(.pretendard(.medium, size: 24))
                .fontWeight(.semibold)
                .foregroundColor(Color.deepBlue)
                .padding(.top, 30)
                .padding(.bottom, 20)
                .padding(.trailing, 40)


            VStack(spacing: 20) {
                            HStack {
                                RoleButton(title: "프론트엔드", isSelected: selectedRoles.contains("프론트엔드")) {
                                    toggleRole("프론트엔드")
                                }
                                RoleButton(title: "백엔드", isSelected: selectedRoles.contains("백엔드")) {
                                    toggleRole("백엔드")
                                }
                            }
                            HStack {
                                RoleButton(title: "AI", isSelected: selectedRoles.contains("AI")) {
                                    toggleRole("AI")
                                }
                                RoleButton(title: "IoT", isSelected: selectedRoles.contains("IoT")) {
                                    toggleRole("IoT")
                                }
                            }
                        }
                        .padding(.top, 130)
                        .padding(.horizontal, 20)

                        Spacer()
            
                        MainButton(text: "다음") {
                            navigateToNextView = true // 다음 화면으로 이동
                        }
                        .padding(.top, 81)
                        .padding(.bottom, 30)
            
                    }
                }

                private func toggleRole(_ role: String) {
                    if selectedRoles.contains(role) {
                        selectedRoles.removeAll { $0 == role }
                    } else {
                        selectedRoles.append(role)
                    }
                }
            }

// 역할 선택 버튼 컴포넌트
struct RoleButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.pretendard(.regular, size: 18))
                .foregroundColor(isSelected ? .black : .gray)
                .frame(maxWidth: 163, maxHeight: 132)
                .padding()
                .background(isSelected ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)

                )
        }
    }
}

struct RoleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RoleSelectionView()
    }
}
