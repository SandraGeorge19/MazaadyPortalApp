//
//  OfferPriceView.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import UIKit

class OfferPriceView: UIView {

    @IBOutlet weak var offerPriceTitle: UILabel!
    @IBOutlet weak var offerPriceValue: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.xibSetup()
    }
    
    func setupViews(originalPrice: Int, offerPrice: Int, currency: String) {
        setupTitle()
        setupOfferValue(originalPrice: originalPrice, offerPrice: offerPrice, currency: currency)
    }
    
    private func setupTitle() {
        offerPriceTitle.text = "Offer Price"
        offerPriceTitle.font = UIFont.nunitoFont(size: 12)
        offerPriceTitle.textColor = UIColor(hex: "#333333")
    }

    private func setupOfferValue(originalPrice: Int, offerPrice: Int, currency: String) {
        let htmlString = """
        \(offerPrice) \(currency) <font color="red"><s>\(originalPrice) \(currency)</s></font>
        """
        offerPriceValue.attributedText = htmlString.htmlToAttributedString
        offerPriceValue.font = UIFont.nunitoFont(size: 12, weight: .bold)
    }
}
