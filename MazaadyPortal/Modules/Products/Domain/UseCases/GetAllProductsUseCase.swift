//
//  GetAllProductsUseCase.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation


class GetAllProductsUseCase: GetAllProductsUseCaseContract {
    private let repository: ProductsRepositoryContract
    
    init(repository: ProductsRepositoryContract = ProductsRepository()) {
        self.repository = repository
    }
    
    func execute() async throws -> [Product] {
        return try await repository.getAllProducts()
    }
}
