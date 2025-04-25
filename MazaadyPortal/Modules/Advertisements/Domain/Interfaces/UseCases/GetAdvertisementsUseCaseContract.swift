//
//  GetAdvertisementsUseCaseContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol GetAdvertisementsUseCaseContract {
    func execute() async throws -> Advertisements
}

