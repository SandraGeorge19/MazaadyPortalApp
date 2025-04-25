//
//  AllTagsService.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class AllTagsService: AllTagsServiceContract {
    private let networkManager: NetworkManagerContract
    
    init(networkManager: NetworkManagerContract = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func getAllTags() async throws -> AllTags {
        return try await networkManager.sendRequest(
            request: AllTagsEndPoints.allTags,
            responseType: AllTags.self
        )
    }
}
