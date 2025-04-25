//
//  SearchForProductUseCase.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class SearchForProductUseCase: SearchForProductUseCaseContract {
    private let repository: ProductsRepositoryContract
    
    init(repository: ProductsRepositoryContract = ProductsRepository()) {
        self.repository = repository
    }
    
    func execute(searchText: String) async throws -> [Product] {
        return try await repository.searchForProducts(with: searchText)
    }
}
