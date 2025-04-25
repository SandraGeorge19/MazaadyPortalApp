//
//  EndPointContract.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import Foundation

protocol EndPointContract {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var parameters: RequestParameters? { get }
}

extension EndPointContract {
    var baseURL: URL? {
        return URL(string: NetworkConstants.baseURL)
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
    
    var parameters: RequestParameters? {
        return nil
    }
}
