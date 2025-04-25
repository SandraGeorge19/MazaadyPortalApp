//
//  UIColor+Extension.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let r, g, b: CGFloat
        switch hexSanitized.count {
        case 6:
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        default:
            r = 1.0
            g = 1.0
            b = 1.0
        }
        
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
