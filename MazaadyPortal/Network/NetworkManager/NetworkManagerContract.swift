//
//  NetworkManagerContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import Foundation

protocol NetworkManagerContract {
    func sendRequest<T: Codable>(request: EndPointContract, responseType: T.Type) async throws -> T
}
