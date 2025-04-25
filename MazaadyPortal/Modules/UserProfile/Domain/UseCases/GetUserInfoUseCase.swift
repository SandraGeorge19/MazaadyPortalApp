//
//  GetUserInfoUseCase.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class GetUserInfoUseCase: GetUserInfoUseCaseContract {
    private let repository: UserInfoRepositoryContract
    
    init(repository: UserInfoRepositoryContract = UserInfoRepository()) {
        self.repository = repository
    }
    
    func execute() async throws -> UserInfo {
        try await repository.getUserInfo()
    }
}
