//
//  AdvertisementsRepository.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class AdvertisementsRepository: AdvertisementsRepositoryContract {
    private let service: AdvertisementsServiceContract
    
    init(service: AdvertisementsServiceContract = AdvertisementsService()) {
        self.service = service
    }
    
    func getAllAdds() async throws -> Advertisements {
        try await service.getAllAdds()
    }
}
