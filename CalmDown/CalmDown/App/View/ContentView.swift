//
//  ContentView.swift
//  CalmDown
//
//  Created by 채리원 on 9/20/24.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeMatchingView()
                .tabItem {
                    Image("homeTabbar")
                    Text("홈")
                }
            
            MatchingView()
                .tabItem {
                    Image("mainTabbar")
                    Text("매칭")
                }
            
            MyInfoView()
                .tabItem {
                    Image("profileTabbar")
                    Text("내 정보")
                }
        }
        .accentColor(Color.deepBlue)
    }
}

#Preview {
    ContentView()
}
