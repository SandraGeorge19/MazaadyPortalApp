//
//  LanguageTableViewCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    @IBOutlet weak var languageIcon: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLanguageLabel()
    }

    private func setupLanguageLabel() {
        self.languageLabel.text = "English"
        self.languageLabel.font = UIFont.nunitoFont(size: 16)
        self.languageLabel.textColor = UIColor.black
    }
}
