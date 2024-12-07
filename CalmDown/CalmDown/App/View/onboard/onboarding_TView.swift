//
//  onboarding_TView.swift
//  CalmDown
//
//  Created by 이상엽 on 12/6/24.
//

import SwiftUI

struct TechSelectionView: View {
    @State private var selectedTechs: [String] = []
    private var spacingOfTech = CGFloat(70)
    var body: some View {
        ZStack{
            
            VStack(spacing: 0) {
                HStack{
                    Image("MainLogo")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.top, 33)
                        .padding(.leading, 33)
                    Spacer()
                }
                
                HStack{
                    Text("보유한 기술 스택을 선택해주세요.")
                        .font(.pretendard(.medium, size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.deepBlue)
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                        .padding(.trailing, 29)
                }
                
                ScrollView{
                    VStack(spacing: 30){
                        HStack(spacing: spacingOfTech){
                            TechButton(title: "코틀린", imageName: "kotlin", isSelected: selectedTechs.contains("코틀린")) {
                                toggleRole("코틀린")
                            }
                            TechButton(title: "스위프트", imageName: "swift", isSelected: selectedTechs.contains("스위프트")) {
                                toggleRole("스위프트")
                            }
                            TechButton(title: "리액트", imageName: "react", isSelected: selectedTechs.contains("리액트")) {
                                toggleRole("리액트")
                            }
                        }
                        HStack(spacing:spacingOfTech){
                            TechButton(title: "플러터", imageName: "fluter", isSelected: selectedTechs.contains("플러터")) {
                                toggleRole("플러터")
                            }
                            TechButton(title: "nodejs", imageName: "nodejs", isSelected: selectedTechs.contains("nodejs")) {
                                toggleRole("nodejs")
                            }
                            TechButton(title: "js", imageName: "js", isSelected: selectedTechs.contains("js")) {
                                toggleRole("js")
                            }
                            
                        }
                        HStack(spacing:spacingOfTech){
                            TechButton(title: "typescript", imageName: "typescript", isSelected: selectedTechs.contains("typescript")) {
                                toggleRole("typescript")
                            }
                            TechButton(title: "CSS", imageName: "css", isSelected: selectedTechs.contains("css")) {
                                toggleRole("css")
                            }
                            TechButton(title: "HTML5", imageName: "html5", isSelected: selectedTechs.contains("html5")) {
                                toggleRole("html5")
                            }
                            
                        }
                        HStack(spacing:spacingOfTech){
                            TechButton(title: "MySQL", imageName: "mysql", isSelected: selectedTechs.contains("mysql")) {
                                toggleRole("mysql")
                            }
                            TechButton(title: "docker", imageName: "docker", isSelected: selectedTechs.contains("docker")) {
                                toggleRole("docker")
                            }
                            TechButton(title: "git", imageName: "git", isSelected: selectedTechs.contains("git")) {
                                toggleRole("git")
                            }
                        }
                        HStack(spacing:spacingOfTech){
                            TechButton(title: "github", imageName: "github", isSelected: selectedTechs.contains("github")) {
                                toggleRole("github")
                            }
                            TechButton(title: "figma", imageName: "figma", isSelected: selectedTechs.contains("figma")) {
                                toggleRole("figma")
                            }
                        }
                        
                    }
                    .padding(.top, 63)
                    
                }
                .scrollIndicators(.hidden)
                MainButton(text: "다음") {}
                    .padding(.bottom, 30)
                //                    .padding(.top, 81)
            }
            
        }
    }
    private func toggleRole(_ role: String) {
        if selectedTechs.contains(role) {
            selectedTechs.removeAll { $0 == role }
        } else {
            selectedTechs.append(role)
        }
    }
}

struct TechButton: View {
    var title: String
    var imageName: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack{
                Image(imageName)
                    .resizable()
                    .frame(maxWidth: 56, maxHeight: 56)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(isSelected ? Color.skyBlue : Color.clear, lineWidth: 4)
                    )
                Text(title)
                    .font(.pretendard(.regular, size: 14))
                    .foregroundColor(isSelected ? .black : .gray)
                    .padding(.top, 7.31)
            }
            
        }
    }
}



struct TechSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TechSelectionView()
    }
}
