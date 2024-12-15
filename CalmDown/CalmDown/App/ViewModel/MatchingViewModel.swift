//
//  MatchingViewModel.swift
//  CalmDown
//
//  Created by 이상엽 on 12/15/24.
//

import Foundation
import SwiftUI
import Moya
import Combine


class MatchingViewModel: ObservableObject{
    @Published var matchingStatus: String = ""
    
    @Published var totalMembers: Int
    @Published var fmembers: Int
    @Published var bmembers: Int
    
    private let matchingService = MatchingService()
    private var cancellables = Set<AnyCancellable>()

    
    init(
        matchingStatus: String = "",
        totalMembers: Int,
        fmembers: Int,
        bmembers: Int
    ) {
        self.matchingStatus = matchingStatus
        self.totalMembers = totalMembers
        self.fmembers = fmembers
        self.bmembers = bmembers

    }
    
    func matchingStatus(teamId: Int) {
            matchingService.fetchMatchingStatus(teamId: teamId)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error:\(error) ")
                    }
                }, receiveValue: { response in
                    self.matchingStatus = response.status
                    self.totalMembers = response.currentMembers.total
                    self.fmembers = response.currentMembers.frontend
                    self.bmembers = response.currentMembers.backend
                    

                })
                .store(in: &cancellables)
        }
}
