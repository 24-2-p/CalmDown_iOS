//
//  matchingView.swift
//  CalmDown
//
//  Created by 이상엽 on 12/6/24.
//

import SwiftUI

struct MatchingView: View {
    @State private var selectedProject: String = "2024 2학기 P 프로젝트"

    var body: some View {
        VStack(spacing: 0) {
            // 상단 타이틀
            VStack(spacing: 8) {
                HStack{
                    Text("Calm Match")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color.deepBlue)
                        .padding(.leading, 33)
                    Spacer()
                }
                HStack{
                    // Pull Down Menu
                    Menu {
                        Button(action: {
                            selectedProject = "2024 2학기 P 프로젝트"
                        }) {
                            Text("2024 2학기 P 프로젝트")
                        }
                        Button(action: {
                            selectedProject = "2024 졸업 프로젝트"
                        }) {
                            Text("2024 졸업 프로젝트")
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

            // 로고
            Image("MainLogo") // 실제 로고 이미지로 대체
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)


            // 매칭하기 버튼
            Button(action: {
                print("매칭하기 버튼 클릭")
            }) {
                Text("매칭하기")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: 283, maxHeight: 44)
                    .background(Color.deepBlue)
                    .cornerRadius(25)
            }
            .padding(.top, 84)
            .padding(.bottom, 10)

            HStack{
                Spacer()
                Text("같이 할 팀원이 있나요?")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 59)
            }
            Spacer()
                
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.white)
    }
}
#Preview{
    MatchingView()
}
