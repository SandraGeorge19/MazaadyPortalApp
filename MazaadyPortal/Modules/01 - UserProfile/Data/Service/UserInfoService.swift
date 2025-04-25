//
//  UserInfoService.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class UserInfoService: UserInfoServiceContract {
    private let networkManager: NetworkManagerContract
    
    init(networkManager: NetworkManagerContract = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func getUserInfo() async throws -> UserInfo {
        return try await networkManager.sendRequest(
            request: UserInfoEndPoint.userInfo,
            responseType: UserInfo.self
        )
    }
    
    
}
