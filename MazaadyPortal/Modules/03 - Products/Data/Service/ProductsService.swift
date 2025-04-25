//
//  ProductsService.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation


class ProductsService: ProductsServiceContract {
    private let networkManager: NetworkManagerContract
    
    init(networkManager: NetworkManagerContract = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func getAllProducts() async throws -> [Product] {
        return try await networkManager.sendRequest(
            request: ProductsEndPoints.products,
            responseType: [Product].self
        )
    }
    
    func searchForProducts(with name: String) async throws -> [Product] {
        return try await networkManager.sendRequest(
            request: ProductsEndPoints.searchedProducts(productName: name),
            responseType: [Product].self
        )
    }
}
