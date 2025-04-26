//
//  TagCollectionViewCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagContainer: UIView!
    @IBOutlet weak var tagName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with tag: Tag?, isSelected: Bool) {
        tagName.text = tag?.name ?? ""
            if isSelected {
                tagContainer.setBorderAndCornerRadius(borderColor: UIColor(hex: "#FF951D"), cornerRadius: 9, backgroundColor: UIColor(hex: "#FFF5E9"))
                tagName.textColor = UIColor(hex: "#FF951D")
                tagName.font = UIFont.nunitoFont(size: 12, weight: .bold)
            } else {
                tagContainer.setBorderAndCornerRadius(borderColor: UIColor(hex: "#E0E0E0"), cornerRadius: 9, backgroundColor: UIColor(hex: "#FFFFFF"))
                tagName.textColor = .black
                tagName.font = UIFont.nunitoFont(size: 12)
            }
        }
}
