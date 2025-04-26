//
//  UISegmentsControl+Extension.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import Foundation
import UIKit

extension UISegmentedControl {
    
    // Removing background
    
    func removeBorder(){
        
        // Using UIImage's new func to remove BG
        let backgroundImage = UIImage.gerRectangleImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        
        // Setting on every status
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        // Using UIImage's new func to remove divider
        let divisorImage = UIImage.gerRectangleImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(divisorImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        // Setting colors
        // When selected
        self.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor : UIColor(hex: "#D20653"),
                NSAttributedString.Key.font: UIFont.nunitoFont(size: 14)!
            ],
            for: .selected
        )
        // When on foreground
        self.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor : UIColor(hex: "#828282"),
                NSAttributedString.Key.font: UIFont.nunitoFont(size: 14)!
            ],
            for: .normal
        )
    }
    
    func addUnderlineForSelectedSegment() {
        removeBorder()
        
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex) * underlineWidth
        let underlineYPosition = self.bounds.size.height - underlineHeight
        let underlineFrame = CGRect(x: underlineXPosition, y: underlineYPosition, width: underlineWidth, height: underlineHeight)
        
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor(hex: "#D20653")
        underline.tag = 1
        
        self.addSubview(underline)
    }
    
    // Changing underline position
    
    func changeUnderlinePosition() {
        guard let underline = self.viewWithTag(1) else { return }
        
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineFinalXPosition = underlineWidth * CGFloat(selectedSegmentIndex) + 10
        
        UIView.animate(withDuration: 0.1) {
            underline.frame.origin.x = underlineFinalXPosition
        }
    }
}
