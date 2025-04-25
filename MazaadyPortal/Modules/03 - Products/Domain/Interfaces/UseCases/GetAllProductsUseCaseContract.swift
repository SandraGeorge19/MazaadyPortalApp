//
//  GetAllProductsUseCaseContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol GetAllProductsUseCaseContract {
    func execute() async throws -> [Product]
}
