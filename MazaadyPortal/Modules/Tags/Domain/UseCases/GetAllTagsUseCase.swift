//
//  GetAllTagsUseCase.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class GetAllTagsUseCase: GetAllTagsUseCaseContract {
    private let repository: AllTagsRepositoryContract
    
    init(repository: AllTagsRepositoryContract = AllTagsRepository()) {
        self.repository = repository
    }
    
    func execute() async throws -> AllTags {
        try await repository.getAllTags()
    }
}
