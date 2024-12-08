//
//  HomeEmptyView.swift
//  CalmDown
//
//  Created by 채리원 on 12/6/24.
//

import SwiftUI

struct HomeEmptyView: View {
    var body: some View {
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
            .padding(.bottom, 119)
            
            Image("person.3")
                .padding(.bottom, 17)
            
            Text("매칭된 팀이 없습니다.")
                .font(.pretendard(.medium, size: 20))
                .foregroundColor(Color.mediumGray)
        }
        Spacer()
    }
}

#Preview {
    HomeEmptyView()
}
