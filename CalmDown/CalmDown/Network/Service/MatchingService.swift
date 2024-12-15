//
//  MatchingService.swift
//  CalmDown
//
//  Created by 이상엽 on 12/15/24.
//
import Moya
import Combine
import Foundation
import CombineMoya

class MatchingService: ObservableObject {
    let provider = MoyaProvider<MatchingAPI>() // Moya Provider
    @Published var matchingResponse: MatchingResponse? // 응답 데이터를 저장할 변수
    @Published var errorMessage: String? // 에러 메시지

    private var cancellables = Set<AnyCancellable>()

    // 매칭 상태 확인 요청
    func fetchMatchingStatus(teamId: Int) -> AnyPublisher<MatchingResponse, Error> {
        provider.requestPublisher(.teamStatus(teamId: teamId))
            .tryMap { response in
                guard (200...299).contains(response.statusCode) else {
                    print("[MatchingService] teamStatus() statusCode : ", response.statusCode)
                    throw MoyaError.statusCode(response)
                }
                return response.data
            }
            .decode(type: MatchingResponse.self, decoder: JSONDecoder()) // JSON 디코딩
            .receive(on: DispatchQueue.main) // 메인 스레드에서 처리
            .eraseToAnyPublisher() // AnyPublisher로 변환
    }
}
