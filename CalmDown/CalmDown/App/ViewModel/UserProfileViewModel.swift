//
//  UserProfileViewModel.swift
//  CalmDown
//
//  Created by 채리원 on 12/15/24.
//

import Foundation
import Moya

class UserProfileViewModel: ObservableObject {
    @Published var selectedUserProfile: UserProfile? = nil
    @Published var isSheetPresented: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let provider = MoyaProvider<CommentService>()

    func fetchUserProfile(teamId: Int, userId: Int) {
        isLoading = true
        errorMessage = nil

        provider.request(.fetchProfile(teamId: teamId, userId: userId)) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    do {
                        let decodedResponse = try JSONDecoder().decode(ProfileResponse.self, from: response.data)
                        self?.selectedUserProfile = decodedResponse.success
                        self?.isSheetPresented = true
                        print("isSheetPresented = \(self?.isSheetPresented ?? false)")
                    } catch {
                        self?.errorMessage = "Failed to decode response: \(error.localizedDescription)"
                    }
                case .failure(let error):
                    self?.errorMessage = "Request failed: \(error.localizedDescription)"
                }
            }
        }
    }
}
