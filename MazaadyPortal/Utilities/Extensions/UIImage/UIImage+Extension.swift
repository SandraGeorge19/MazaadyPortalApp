//
//  UIImage+Extension.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import Foundation
import UIKit

extension UIImage {
    
    // Function that translates to bitmap
    // Asks for color and size, return an UIImage
    class func gerRectangleImageWith (color:CGColor, andSize size:CGSize) -> UIImage {
        
        // Putting image on context
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicContext = UIGraphicsGetCurrentContext()
        graphicContext?.setFillColor(color)
        
        // Creating rectangle that will cover the SC's background
        
        let rectangle = CGRect (x: 0, y: 0, width: size.width, height: size.height)
        graphicContext?.fill(rectangle)
        
        // Putting rectangle on context
        
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Return
        return rectangleImage!
    }
}
