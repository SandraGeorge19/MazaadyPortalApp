//
//  AdvertisementsService.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation


class AdvertisementsService: AdvertisementsServiceContract {
    private let networkManager: NetworkManagerContract
    
    init(networkManager: NetworkManagerContract = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func getAllAdds() async throws -> Advertisements {
        return try await networkManager.sendRequest(
            request: AdvertisementsEndPoint.ads,
            responseType: Advertisements.self
        )
    }
}
