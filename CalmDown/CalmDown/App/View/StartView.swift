//
//  StartView.swift
//  CalmDown
//
//  Created by 채리원 on 12/2/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("MainLogo")
                .padding(.top, 70)
            
            VStack(spacing: 0) {
                Text("CALM")
                
                Text("MATCH")
            }
            .font(.pretendard(.medium, size: 40))
            .foregroundColor(Color.deepBlue)
            .padding(.top, 38)
            
            Text("Gachon Univ. CS")
                .font(.pretendard(.medium, size: 12))
                .foregroundColor(Color.customBlack)
                .padding(.top, 18)
            
            VStack(spacing: 0) {
                Text("가천대학교 컴퓨터공학과")
                
                Text("팀 매칭 서비스")
            }
            .font(.pretendard(.medium, size: 16))
            .foregroundColor(Color.customBlack)
            .padding(.top, 18)
            
            Rectangle()
                .frame(width: 271, height: 1)
                .padding(.top, 82)
            
            MainButton(text: "회원가입") {}
                .padding(.top, 64)
            
            HStack {
                Text("이미 계정이 있으신가요?")
                    .font(.pretendard(.medium, size: 16))
                    .foregroundColor(Color.grayish)
                
                Text("로그인하기")
                    .font(.pretendard(.medium, size: 16))
                    .foregroundColor(Color.grayish)
            }
            .padding(.top, 28)
        }
    }
}

#Preview {
    StartView()
}
