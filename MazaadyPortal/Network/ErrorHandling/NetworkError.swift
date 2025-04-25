//
//  NetworkError.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noResponse
    case decodingError(Error)
    case serverError(Int)
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noResponse:
            return "No Response came from the server"
        case .decodingError(let error):
            return "Decoding Error: \(error.localizedDescription)"
        case .serverError(let statusCode):
            return "Server Error with status code: \(statusCode)"
        case .unknown(let error):
            return "Unknown Error: \(error.localizedDescription)"
        }
    }
}
