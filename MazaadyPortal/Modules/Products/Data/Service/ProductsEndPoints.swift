//
//  ProductsEndPoints.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

enum ProductsEndPoints: EndPointContract {
    case products
    case searchedProducts(productName: String)
    
    var path: String {
        return NetworkConstants.products
    }
    
    var parameters: RequestParameters? {
        switch self {
        case .products:
            return nil
        case .searchedProducts(productName: let productName):
            return .query(["name": productName])
        }
    }
}
