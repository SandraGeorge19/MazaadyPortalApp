//
//  AdvertisementsServiceContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol AdvertisementsServiceContract {
    func getAllAdds() async throws -> Advertisements
}
