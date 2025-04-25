//
//  UserInfoRepository.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class UserInfoRepository: UserInfoRepositoryContract {
    private let service: UserInfoServiceContract
    
    init(service: UserInfoServiceContract = UserInfoService()) {
        self.service = service
    }
    
    func getUserInfo() async throws -> UserInfo {
        try await service.getUserInfo()
    }
}
