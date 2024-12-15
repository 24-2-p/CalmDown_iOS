//
//  onboarding_LView.swift
//  CalmDown
//
//  Created by 이상엽 on 12/14/24.
//

import SwiftUI

struct LinkSelectionView: View {
    @State private var selectedRoles: [String] = []
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // 로고
            Image("MainLogo")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.top, 33)
                .padding(.trailing, 300)
            
            Text("본인을 소개할 수 있는 링크를")
                .font(.pretendard(.medium, size: 24))
                .fontWeight(.semibold)
                .foregroundColor(Color.deepBlue)
                .padding(.top, 30)
                .padding(.bottom, 20)
                .padding(.trailing, 60)
            
            Text("첨부하세요.(깃허브, 노션 등)")
                .font(.pretendard(.medium, size: 24))
                .fontWeight(.semibold)
                .foregroundColor(Color.deepBlue)
                .padding(.top, -12)
                .padding(.trailing, 60)
            
            
            InputField(label: "", systemImage: "envelope", placeholder: "링크를 첨부해주세요", text: $viewModel.user.email)
                .padding(.top, 48)
            
            Spacer()
            
            // 다음 버튼
            MainButton(text: "다음") {
                print("선택된 역할: \(selectedRoles)")
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


struct LinkSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LinkSelectionView()
    }
}
