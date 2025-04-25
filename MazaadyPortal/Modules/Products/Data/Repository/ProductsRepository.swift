//
//  ProductsRepository.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

class ProductsRepository: ProductsRepositoryContract {
    private let service: ProductsServiceContract
    
    init(service: ProductsServiceContract = ProductsService()) {
        self.service = service
    }
    
    func getAllProducts() async throws -> [Product] {
        return try await service.getAllProducts()
    }
    
    func searchForProducts(with name: String) async throws -> [Product] {
        return try await service.searchForProducts(with: name)
    }
}
