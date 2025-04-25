//
//  AllTagsRepository.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class AllTagsRepository: AllTagsRepositoryContract {
    private let service: AllTagsServiceContract
    
    init(service: AllTagsServiceContract = AllTagsService()) {
        self.service = service
    }
    
    func getAllTags() async throws -> AllTags {
        try await service.getAllTags()
    }
}
