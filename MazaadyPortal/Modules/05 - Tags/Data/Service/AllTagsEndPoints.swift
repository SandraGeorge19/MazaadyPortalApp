//
//  AllTagsEndPoints.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation


enum AllTagsEndPoints: EndPointContract {
    case allTags
    
    var path: String {
        switch self {
        case .allTags:
            NetworkConstants.tags
        }
    }
}
