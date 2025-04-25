//
//  UIFont+Extension.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation
import UIKit

extension UIFont {
    static func nunitoFont(size: CGFloat, weight: FontWeight = .regular) -> UIFont? {
        return UIFont(name: weight.nunitoFont, size: size)
    }
}

enum FontWeight {
    case regular, meduim, bold
    
    var nunitoFont: String {
        switch self {
        case .bold:
            return "Nunito-Bold"
        case .meduim:
            return "Nunito-Medium"
        case .regular:
            return "Nunito-Regular"
        }
    }
}
