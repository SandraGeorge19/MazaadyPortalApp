//
//  APIRequestBuilder.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import Foundation

protocol APIRequestBuilderContract {
    func setURL(_ url: URL) -> Self
    func setPath(_ path: String) -> Self
    func setMethod(_ method: HTTPMethod) -> Self
    func setHeaders(_ headers: [String: String]) -> Self
    func setParameters(_ parameters: RequestParameters?) -> Self
    func build() throws -> URLRequest
}

class APIRequestBuilder: APIRequestBuilderContract {
    private var baseURL: URL?
    private var path: String
    private var method: HTTPMethod
    private var headers: HTTPHeaders
    private var parameters: RequestParameters?
    
    init(request: EndPointContract) {
        self.baseURL = request.baseURL
        self.path = request.path
        self.method = request.method
        self.headers = request.headers
        self.parameters = request.parameters
    }
    
    func setURL(_ url: URL) -> Self {
        self.baseURL = url
        return self
    }
    
    func setPath(_ path: String) -> Self {
        self.path = path
        return self
    }
    
    func setMethod(_ method: HTTPMethod) -> Self {
        self.method = method
        return self
    }
    
    func setHeaders(_ headers: [String : String]) -> Self {
        self.headers = headers
        return self
    }
    
    func setParameters(_ parameters: RequestParameters?) -> Self {
        self.parameters = parameters
        return self
    }
    
    func build() throws -> URLRequest {
        guard let url = self.baseURL else {
            throw NetworkError.invalidURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.allHTTPHeaderFields =  self.headers
        urlRequest.url = urlRequest.url?.appendingPathComponent(self.path)
        try addRequestParamsIfFound(parameters: self.parameters, for: &urlRequest)
        return urlRequest
    }
    
    private func addRequestParamsIfFound(parameters: RequestParameters?, for urlRequest: inout URLRequest) throws {
        guard let parameters = parameters else { return }
        switch parameters {
        case .body(let bodyParams):
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParams, options: [])
            } catch {
                throw error
            }
            
        case .query(let queryParams):
            if let url = urlRequest.url?.absoluteString {
                var component = URLComponents(string: url)
                let queryItems = queryParams.map { param in
                    return URLQueryItem(name: param.key, value: "\(param.value)")
                }
                component?.queryItems = queryItems
                urlRequest.url = component?.url
            }
            
        case .bodyAndQuery(let bodyParams, let queryParams):
            try addRequestParamsIfFound(parameters: .body(bodyParams), for: &urlRequest)
            try addRequestParamsIfFound(parameters: .query(queryParams), for: &urlRequest)
        }
    }
    
}
