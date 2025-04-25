//
//  AdvertisementsRepositoryContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//


protocol AdvertisementsRepositoryContract {
    func getAllAdds() async throws -> Advertisements
}