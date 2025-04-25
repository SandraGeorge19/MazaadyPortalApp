//
//  AdvertisementsEndPoint.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation

enum AdvertisementsEndPoint: EndPointContract {
    case ads
    
    var path: String {
        switch self {
        case .ads:
            return NetworkConstants.ads
        }
    }
}
