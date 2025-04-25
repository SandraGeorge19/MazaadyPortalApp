//
//  RequestParameters.swift
//  MazaadyPortal
//
//  Created by Sandra George on 24/04/2025.
//

import Foundation

typealias Params = [String: Any]

enum RequestParameters {
    case body(_ bodyParams: Params)
    case query(_ queryParams: Params)
    case bodyAndQuery(_ bodyParams: Params, _ queryParams: Params)
}
