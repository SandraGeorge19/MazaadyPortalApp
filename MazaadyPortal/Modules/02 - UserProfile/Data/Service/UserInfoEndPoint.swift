//
//  UserInfoEndPoint.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

enum UserInfoEndPoint: EndPointContract {
    case userInfo
    
    var path: String {
        switch self {
        case .userInfo:
            return NetworkConstants.userInfo
        }
    }
}
