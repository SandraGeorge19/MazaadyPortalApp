//
//  String+Extension.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import Foundation

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = self.data(using: .utf8) else { return nil }
        
        return try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        )
    }
    
    var htmlToString: String {
        htmlToAttributedString?.string ?? self
    }
}
