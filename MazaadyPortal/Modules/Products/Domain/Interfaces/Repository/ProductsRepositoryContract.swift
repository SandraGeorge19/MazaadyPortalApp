//
//  ProductsRepositoryContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol ProductsRepositoryContract {
    func getAllProducts() async throws -> [Product]
    func searchForProducts(with name: String) async throws -> [Product]
}
