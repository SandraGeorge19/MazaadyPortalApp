//
//  AdsCell.swift
//  MazaadyPortal
//
//  Created by Sandra George on 25/04/2025.
//

import UIKit
import SDWebImage

class AdsCell: UITableViewCell {

    @IBOutlet weak var adImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupAdsImage(with urlString: String) {
        adImage.sd_setImage(
            with: URL(string: urlString),
            placeholderImage: UIImage(named: "user_placeholder"),
            context: nil
        )
        adImage.layer.cornerRadius = 21
        adImage.clipsToBounds = true
    }
}
