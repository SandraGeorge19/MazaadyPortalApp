//
//  GetAdvertisementsUseCase.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class GetAdvertisementsUseCase: GetAdvertisementsUseCaseContract {
    private let repository: AdvertisementsRepositoryContract
    
    init(repository: AdvertisementsRepositoryContract = AdvertisementsRepository()) {
        self.repository = repository
    }
    
    func execute() async throws -> Advertisements {
        try await repository.getAllAdds()
    }
}
