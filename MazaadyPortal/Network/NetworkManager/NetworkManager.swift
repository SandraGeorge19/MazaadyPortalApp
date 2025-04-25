//
//  NetworkManager.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import Foundation

class NetworkManager: NetworkManagerContract {
    static let shared = NetworkManager()
    
    private init() {
        // Intentionally Unimplemented
    }
    
    func sendRequest<T: Codable>(request: EndPointContract, responseType: T.Type) async throws -> T {
        do {
            let generatedRequest = try buildURLRequest(from: request)
            let (data, response) = try await URLSession.shared.data(for: generatedRequest)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.noResponse
            }
            guard NetworkConstants.statusCodeRange ~= httpResponse.statusCode else {
                throw NetworkError.serverError(httpResponse.statusCode)
            }
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError(error)
            }
            
        } catch {
            throw NetworkError.unknown(error)
        }
    }
    
    private func buildURLRequest(from request: EndPointContract) throws -> URLRequest {
        guard let baseURL = request.baseURL else {
            throw NetworkError.invalidURL
        }
        let requestBuilder = try APIRequestBuilder(request: request)
            .setURL(baseURL)
            .setPath(request.path)
            .setMethod(request.method)
            .setHeaders(request.headers)
            .setParameters(request.parameters)
            .build()
        
        return requestBuilder
    }
}
