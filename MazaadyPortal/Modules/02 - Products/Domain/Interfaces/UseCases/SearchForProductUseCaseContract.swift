//
//  SearchForProductUseCaseContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

protocol SearchForProductUseCaseContract {
    func execute(searchText: String) async throws -> [Product]
}
