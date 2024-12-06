//
//  HomeMatchingView.swift
//  CalmDown
//
//  Created by 채리원 on 12/6/24.
//

import SwiftUI

struct HomeMatchingView: View {
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
            
            HStack(alignment: .center, spacing: 10) {
                Image("profile")
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("이상엽")
                        .font(.pretendard(.medium, size: 16))
                    
                    Text("프론트엔드")
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
                    //action
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.mediumGray)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
            .padding(.horizontal, 16)
            
            Rectangle()
                .frame(width: 356, height: 0.3)
                .padding(.top, 30)
                .foregroundColor(Color.mediumGray)
            
            HStack(alignment: .center, spacing: 10) {
                Image("profile")
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("강태훈")
                        .font(.pretendard(.medium, size: 16))
                    
                    Text("백엔드")
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
                    //action
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.mediumGray)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
            .padding(.horizontal, 16)
            
            Rectangle()
                .frame(width: 356, height: 0.3)
                .padding(.top, 30)
                .foregroundColor(Color.mediumGray)
            
            HStack(alignment: .center, spacing: 10) {
                Image("profile")
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("김규식")
                        .font(.pretendard(.medium, size: 16))
                    
                    Text("백엔드")
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
                    //action
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.mediumGray)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
            .padding(.horizontal, 16)
            
            Rectangle()
                .frame(width: 356, height: 0.3)
                .padding(.top, 30)
                .foregroundColor(Color.mediumGray)
            
            HStack(alignment: .center, spacing: 10) {
                Image("profile")
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("채리원")
                        .font(.pretendard(.medium, size: 16))
                    
                    Text("프론트엔드")
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
                    //action
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.mediumGray)
                    }
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
        
        Button(action: {
            //action
        }) {
            HStack {
                Image("TalkButton")
            }
        }
        .padding(.top, 37)
        .padding(.leading, 250)
        
        Spacer()
    }
}

#Preview {
    HomeMatchingView()
}
