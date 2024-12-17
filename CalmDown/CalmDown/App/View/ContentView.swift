//
//  ContentView.swift
//  CalmDown
//
//  Created by 채리원 on 9/20/24.
//


import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 1 // 두 번째 탭의 tag 값으로 초기화
    let logined: Bool

    var body: some View {
        if logined {
            TabView(selection: $selectedTab) {
                HomeMatchingView()
                    .tabItem {
                        Image("homeTabbar")
                        Text("홈")
                    }.tag(0)
                
                MatchingView()
                    .tabItem {
                        Image("mainTabbar")
                        Text("매칭")
                    }.tag(1)
                
                MyInfoView()
                    .tabItem {
                        Image("profileTabbar")
                        Text("내 정보")
                    }.tag(2)
            }
            .accentColor(Color.deepBlue)
            .navigationBarBackButtonHidden(true) // Back 버튼 숨김

        } else {
            StartView()
        }
    }
}

#Preview {
    ContentView(logined: true)
}
